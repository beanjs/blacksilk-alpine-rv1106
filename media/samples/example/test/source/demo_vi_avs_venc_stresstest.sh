#!/bin/sh

print_help()
{
    echo "example: <test_mod=on> $0 <test_result_path> <test_loop> <test_frame> <vi_chnid> <ordinary_stream_test_framecount> <vi_buff_cnt> <vi_resolution> <avs_chn0_resolution> <avs_chn1_resolution>"
    echo "mod: 1.RESTART 2.RESOLUTION"
    echo -e "
          \$1 --------test_result_path: /tmp/stresstest.log\n
          \$2 --------test_loop: 10000\n
          \$3 --------test_frame: 10\n
          \$4 --------vi_chnid: 1\n
          \$5 --------<ordinary_stream_test_framecount>: 450000\n
          \$6 --------vi_buff_cnt: 2\n
          \$7 --------vi_resolution: 1920x1080\n
          \$8 --------avs_chn0_resolution: 3840x1080\n
          \$9 --------avs_chn1_resolution: 1920x544\n"

}

test_result_path=$1
if [ "$1" = "help" ]; then
    print_help
    exit 1
elif [ ! -n "$1" ]; then
    echo "----------------- error!!! lack test_result_path, please input test_result_path"
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

# set vi channel id
vi_chnid=$4
if [ ! -n "$4" ]; then
    echo "----------------- error!!!!, lack vi_chnid seting, please input vi_chnid"
    print_help
    exit 1
fi

#set ordinary_stream_test_framecount
ordinary_stream_test_framecount=$5
if [ ! -n "$5" ]; then
    echo "----------------- error !!!!, lack ordinary_stream_test_framecount setting, please input setting"
    print_help
    exit 1
fi

#set vi buff cnt
vi_buff_cnt=$6
if [ ! -n "$6" ]; then
    echo "----------------- error!!!!, lack vi_buff_cnt, please input vi_buff_cnt"
    print_help
    exit 1
fi

#set vi resulution
vi_resolution=$7
if [ ! -n "$7" ]; then
    echo "----------------- error!!!!, lack vi_resolution, please input vi_resolution"
    print_help
    exit 1
fi

#set avs_chn0_resolution
avs_chn0_resolution=$8
if [ ! -n "$8" ]; then
    echo "----------------- error!!!!, lack avs_chn0_resolution, please input avs_chn0_resolution"
    print_help
    exit 1
fi

#set avs_chn1_resolution
avs_chn1_resolution=$9
if [ ! -n "$9" ]; then
    echo "----------------- error!!!!, lack avs_chn1_resolution, please input avs_chn1_resolution"
    print_help
    exit 1
fi

test_case()
{
    if [ "$RESTART" = "on" ]; then
        #1. media_deinit_init test
        echo -e "--------------------------------------- <sample_demo_vi_avs_venc_stresstest> media_deinit_init test start -------------------------------------------\n"
        echo -e "<sample_demo_vi_avs_venc_stresstest --vi_size $vi_resolution --avs_chn0_size $avs_chn0_resolution --avs_chn1_size $avs_chn1_resolution --chn_id $vi_chnid --vi_chn_buf_cnt $vi_buff_cnt -a /etc/iqfiles/ -e h265cbr -b 4096 -n 2 --test_type 1 --test_loop $test_loop --test_frame $frame_count>\n"
        sample_demo_vi_avs_venc_stresstest --vi_size $vi_resolution --avs_chn0_size $avs_chn0_resolution --avs_chn1_size $avs_chn1_resolution --chn_id $vi_chnid --vi_chn_buf_cnt $vi_buff_cnt -a /etc/iqfiles/ -e h265cbr -b 4096 -n 2 --test_type 1 --test_loop $test_loop --test_frame $frame_count
        if [ $? -eq 0 ]; then
            echo "-------------------------1 <sample_demo_vi_avs_venc_stresstest> media_deinit_init test success" >> $test_result_path
            echo -e "--------------------------------------- <sample_demo_vi_avs_venc_stresstest> media_deinit_init test success -------------------------------------------\n\n\n"
        else 
            echo "-------------------------1 <sample_demo_vi_avs_venc_stresstest> media_deinit_init test failure" >> $test_result_path
            echo -e "--------------------------------------- <sample_demo_vi_avs_venc_stresstest> media_deinit_init test failure -------------------------------------------\n\n\n"
            exit 1
        fi
    fi

    if [ "$RESOLUTION" = "on" ]; then
        #2. avs_resolution_test
        echo -e "--------------------------------------- <sample_demo_vi_avs_venc_stresstest> avs_resolution_test start -------------------------------------------\n"
        echo -e "<sample_demo_vi_avs_venc_stresstest --vi_size $vi_resolution --avs_chn0_size $avs_chn0_resolution --avs_chn1_size $avs_chn1_resolution --chn_id $vi_chnid --vi_chn_buf_cnt $vi_buff_cnt -a /etc/iqfiles/ -e h265cbr -b 4096 -n 2 --test_type 2 --test_loop $test_loop --test_frame $frame_count>\n"
        sample_demo_vi_avs_venc_stresstest --vi_size $vi_resolution --avs_chn0_size $avs_chn0_resolution --avs_chn1_size $avs_chn1_resolution --chn_id $vi_chnid --vi_chn_buf_cnt $vi_buff_cnt -a /etc/iqfiles/ -e h265cbr -b 4096 -n 2 --test_type 2 --test_loop $test_loop --test_frame $frame_count
        if [ $? -eq 0 ]; then
            echo "-------------------------2 <sample_demo_vi_avs_venc_stresstest> avs_resolution_test success" >> $test_result_path
            echo -e "--------------------------------------- <sample_demo_vi_avs_venc_stresstest> avs_resolution_test success -------------------------------------------\n\n\n"
        else
            echo "-------------------------2 <sample_demo_vi_avs_venc_stresstest> avs_resolution_test failure" >> $test_result_path
            echo -e "--------------------------------------- <sample_demo_vi_avs_venc_stresstest> avs_resolution_test failure -------------------------------------------\n\n\n"
            exit 1
        fi
    fi

    if [ "$ORDINARY" = "on" ]; then
        #3. ordinary stream test
        echo -e "--------------------------------------- <sample_demo_vi_avs_venc_stresstest> ordinary stream test start -------------------------------------------\n"
        echo -e "<sample_demo_vi_avs_venc_stresstest --vi_size $vi_resolution --avs_chn0_size $avs_chn0_resolution --avs_chn1_size $avs_chn1_resolution --chn_id $vi_chnid --vi_chn_buf_cnt $vi_buff_cnt -a /etc/iqfiles/ -e h265cbr -b 4096 -n 2 -l $ordinary_stream_test_framecount>\n"
        sample_demo_vi_avs_venc_stresstest --vi_size $vi_resolution --avs_chn0_size $avs_chn0_resolution --avs_chn1_size $avs_chn1_resolution --chn_id $vi_chnid --vi_chn_buf_cnt $vi_buff_cnt -a /etc/iqfiles/ -e h265cbr -b 4096 -n 2 -l $ordinary_stream_test_framecount
        if [ $? -eq 0 ]; then
            echo "-------------------------3 <sample_demo_vi_avs_venc_stresstest> ordinary stream test success" >> $test_result_path
            echo -e "--------------------------------------- <sample_demo_vi_avs_venc_stresstest> ordinary stream test success -------------------------------------------\n\n\n"
        else
            echo "-------------------------3 <sample_demo_vi_avs_venc_stresstest> ordinary stream test failure" >> $test_result_path
            echo -e "--------------------------------------- <sample_demo_vi_avs_venc_stresstest> ordinary stream test failure -------------------------------------------\n\n\n"
            exit 1
        fi
    fi

    sleep 3
    echo 3 > /proc/sys/vm/drop_caches
    cat /proc/meminfo | grep MemAvailable >> $test_result_path

}

test_case

exit 0
