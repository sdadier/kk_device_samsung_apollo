/*
 * Free, open-source replacement of the closed source akmd driver written
 * by AKM. This program is the user-space counterpart of akm8973 and bma150
 * sensors found on various Android phones.
 *
 * Copyright Antti S. Lankila, 2010, licensed under GPL.
 *
 * The device node to read data from is called akm8973_daemon. The control
 * device node is akm8973_aot. The libsensors from android talks to
 * akm8973_aot. The akmd samples the chip data and performs the analysis.
 * The measuring is inherently a slow process, and therefore a cached
 * copy of results is periodically updated to the /dev/input node "compass"
 * using an ioctl on the akm8973_daemon.
 */

#include <pthread.h>
#include <stdio.h>

#include "Akmd.hpp"
#include "device/AKM8973_2_6_29.hpp"
#include "device/OrientationAdapter.hpp"
#include "device/TemperatureReaderAdapter.hpp"
#include "device/BMA150.hpp"

using namespace akmd;

static Akmd *measurer;

static void* read_loop(void *lock)
{
    /* Failure to lock this mutex means the main thread is holding it.
     * It releases it when going to sleep. */
    while (pthread_mutex_trylock((pthread_mutex_t*) lock) != 0) {
        measurer->measure();
        measurer->sleep_until_next_update();
    }

    return NULL;
}

void hero_mainloop(int magnetometer_gain, int temperature_zero)
{
    AKM8973_2_6_29* magnetometer_reader = new AKM8973_2_6_29(magnetometer_gain);
    ChipReader* accelerometer_reader = new BMA150();
    ChipReader* orientation_reader = new OrientationAdapter(accelerometer_reader, magnetometer_reader);
    ChipReader* temperature_reader = new TemperatureReaderAdapter(magnetometer_reader, temperature_zero);
    measurer = new Akmd(orientation_reader, magnetometer_reader, accelerometer_reader, temperature_reader, magnetometer_reader);

    while (true) {
        magnetometer_reader->wait_start();
        LOGI("Begin periodic update.");
        measurer->start();

        /* Start our read thread */
        pthread_mutex_t read_lock;
        SUCCEED(pthread_mutex_init(&read_lock, NULL) == 0);
        SUCCEED(pthread_mutex_lock(&read_lock) == 0);
        pthread_t thread_id;
        SUCCEED(pthread_create(&thread_id, NULL, read_loop, &read_lock) == 0);

        magnetometer_reader->wait_stop();
        LOGI("Stop periodic update.");

        /* Signal our read thread to stop. */
        SUCCEED(pthread_mutex_unlock(&read_lock) == 0);
        void *result;
        SUCCEED(pthread_join(thread_id, &result) == 0);
        SUCCEED(pthread_mutex_destroy(&read_lock) == 0);

        measurer->stop();
    }

    delete measurer;
    delete temperature_reader;
    delete magnetometer_reader;
    delete accelerometer_reader;
}

void apollo_mainloop()
{
    AKM8973_2_6_29* magnetometer_reader = new AKM8973_2_6_29(0);
    LOGI("accelerometer_reader");
    ChipReader* accelerometer_reader = new BMA150();
    LOGI("orientation_reader");
    ChipReader* orientation_reader = new OrientationAdapter(accelerometer_reader, magnetometer_reader);
    LOGI("temperature_reader");
    ChipReader* temperature_reader = new TemperatureReaderAdapter(magnetometer_reader, 0);
    LOGI("new Akmd");
    measurer = new Akmd(orientation_reader, magnetometer_reader, accelerometer_reader, temperature_reader, magnetometer_reader);

    while (true) {
        magnetometer_reader->wait_start();
        LOGI("Begin periodic update.");
        measurer->start();

        /* Start our read thread */
        pthread_mutex_t read_lock;
        SUCCEED(pthread_mutex_init(&read_lock, NULL) == 0);
        SUCCEED(pthread_mutex_lock(&read_lock) == 0);
        pthread_t thread_id;
        SUCCEED(pthread_create(&thread_id, NULL, read_loop, &read_lock) == 0);

        magnetometer_reader->wait_stop();
        LOGI("Stop periodic update.");

        /* Signal our read thread to stop. */
        SUCCEED(pthread_mutex_unlock(&read_lock) == 0);
        void *result;
        SUCCEED(pthread_join(thread_id, &result) == 0);
        SUCCEED(pthread_mutex_destroy(&read_lock) == 0);

        measurer->stop();
    }

    delete measurer;
    delete temperature_reader;
    delete magnetometer_reader;
    delete accelerometer_reader;
}

int main(int argc, char **argv)
{
    LOGI("Akmd: opening devices");

    apollo_mainloop();

    return 0;
}
