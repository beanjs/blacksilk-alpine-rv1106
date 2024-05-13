#!/bin/sh

print_help()
{
    echo "example: <test_mod> $0 <test_result_path> <test_loop> <test_frame>"
    echo "mod: VPSS_RESTART RESOLUTION"
    echo -e "
          \$1 --------test_result_path (require arguments)\n
          \$2 --------test_loop (require arguments)\n
          \$3 --------test_frame (require arguments)\n"
}

test_result_path=$1
if [ "$1" = "help" ]; then
    print_help
    exit 1
elif [ ! -n "$1" ]; then
    echo "------ error!!! lack test_result_path, please input test_result_path"
    print_help
    exit 1
else
    echo " the test_result_path your input is: $1"
fi

#set test loop
test_loop=$2
if [ ! -n "$2" ]; then
    echo "----------------- error!!!, lack test_loop, please input test loop"
    print_help
    exit 1
fi

#set frame count for every loop
frame_count=$3
if [ ! -n "$3" ]; then
    echo "----------------- error!!!!, lack frame_count, please input test frame"
    print_help
    exit 1
fi

test_case()
{
    if [ "$RESTART" = "on" ]; then
        #1. vpss_deinit_ubind_test
        echo -e "--------------------------------------- <sample_vpss_stresstest> vpss_deinit_ubind_test start -------------------------------------------\n"
        echo -e "<sample_vpss_stresstest --vi_size 1920x1080 --vpss_size 1920x1080 -a /etc/iqfiles/ --mode_test_type 1 --mode_test_loop $test_loop --test_frame_count $frame_count>\n"
        sample_vpss_stresstest --vi_size 1920x1080 --vpss_size 1920x1080 -a /etc/iqfiles/ --mode_test_type 1 --mode_test_loop $test_loop --test_frame_count $frame_count
        if [ $? -eq 0 ]; then
            echo "-------------------------1 <sample_vpss_stresstest> vpss_deinit_ubind_test success" >> $test_result_path
            echo -e "--------------------------------------- <sample_vpss_stresstest> vpss_deinit_ubind_test success -------------------------------------------\n\n\n"
        else
            echo "-------------------------1 <sample_vpss_stresstest> vpss_deinit_ubind_test failure" >> $test_result_path
            echo -e "--------------------------------------- <sample_vpss_stresstest> vpss_deinit_ubind_test failure -------------------------------------------\n\n\n"
            exit 1
        fi
    fi

    if [ "$RESOLUTION" = "on" ]; then
        #2. vpss_resolution_test
        echo -e "--------------------------------------- <sample_vpss_stresstest> vpss_resolution_test start -------------------------------------------\n"
        echo -e "<sample_vpss_stresstest --vi_size 1920x1080 --vpss_size 1920x1080 -a /etc/iqfiles/ --mode_test_type 2 --mode_test_loop $test_loop --test_frame_count $frame_count>\n"
        sample_vpss_stresstest --vi_size 1920x1080 --vpss_size 1920x1080 -a /etc/iqfiles/ --mode_test_type 2 --mode_test_loop $test_loop --test_frame_count $frame_count
        if [ $? -eq 0 ]; then
            echo "-------------------------2 <sample_vpss_stresstest> vpss_resolution_test success" >> $test_result_path
            echo -e "--------------------------------------- <sample_vpss_stresstest> vpss_resolution_test success -------------------------------------------\n\n\n"
        else
            echo "-------------------------2 <sample_vpss_stresstest> vpss_resolution_test failure" >> $test_result_path
            echo -e "--------------------------------------- <sample_vpss_stresstest> vpss_resolution_test failure -------------------------------------------\n\n\n"
            exit 1
        fi
    fi

    sleep 3
    echo 3 > /proc/sys/vm/drop_caches
    cat /proc/meminfo | grep MemAvailable >> $test_result_path

}

test_case

exit 0
