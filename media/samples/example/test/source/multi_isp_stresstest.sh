#!/bin/sh

print_help()
{
    echo "example: <test_mod=on> $0 <test_result_path> <test_loop> <test_frame> <isp_group_mode> <vi_frame_switch_test_loop> <vi_chnid> <vi_buff_cnt> <vi_resolution>"
    echo "mod: 1.PN_MODE 2.HDR 3.FRAMERATE 4.LDCH 5.RESTART"
    echo -e "
          \$1 --------test_result_path: /tmp/stresstest.log\n
          \$2 --------test_loop: 10000\n
          \$3 --------test_frame: 10\n
          \$4 --------isp_group_mode: 0: no-group, 1: group\n
          \$5 --------vi_frame_switch_test_loop: 5000\n
          \$6 --------vi_chnid: 0\n
          \$7 --------vi_buff_cnt: 2\n
          \$8 --------vi_resolution: 1920x1080\n"

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

isp_group_mode=$4
if [ ! -n "$4" ]; then
    echo "----------------- error!!!!, lack isp group mode seting, please input isp_group_mode"
    print_help
    exit 1
fi

vi_framerate_switch_loop=$5
if [ ! -n "$5" ]; then
    echo "----------------- warning!!!!, lack vi_framerate_switch_loop"
    print_help
    exit 1
fi

#set vi channel id
vi_chnid=$6
if [ ! -n "$6" ]; then
    echo "----------------- error!!!!, lack vi_chnid, please input vi_chnid"
    print_help
    exit 1
fi

#set vi buff cnt
vi_buff_cnt=$7
if [ ! -n "$7" ]; then
    echo "----------------- error!!!!, lack vi_buff_cnt, please input vi_buff_cnt"
    print_help
    exit 1
fi

#set vi_resolution
vi_resolution=$8
if [ ! -n "$8" ]; then
    echo "----------------- error!!!!, lack vi_resolution, please input vi_resolution"
    print_help
    exit 1
fi

test_case()
{
    if [ "$PN_MODE" = "on" ]; then
        #1: PN mode switch
        echo -e "--------------------------------------- <sample_mulit_isp_stresstest> PN mode switch test start -------------------------------------------\n"
        echo -e "<sample_mulit_isp_stresstest -a /etc/iqfiles/ -c 2 --vi_size $vi_resolution --vi_chnid $vi_chnid --vi_buffcnt $vi_buff_cnt --modeTestType 1 --modeTestLoop $test_loop --testFrameCount $frame_count --ispLaunchMode $isp_group_mode>\n"
        sample_mulit_isp_stresstest -a /etc/iqfiles/ -c 2 --vi_size $vi_resolution --vi_chnid $vi_chnid --vi_buffcnt $vi_buff_cnt --modeTestType 1 --modeTestLoop $test_loop --testFrameCount $frame_count --ispLaunchMode $isp_group_mode
        if [ $? -eq 0 ]; then
            echo "-------------------------1 <sample_mulit_isp_stresstest> PN mode switch test success " >> $test_result_path
            echo -e "--------------------------------------- <sample_mulit_isp_stresstest> PN mode switch test_result success -------------------------------------------\n\n\n"
        else
            echo "-------------------------1 <sample_mulit_isp_stresstest> PN mode switch test failure " >> $test_result_path
            echo -e "--------------------------------------- <sample_mulit_isp_stresstest> PN mode switch test_result failure -------------------------------------------\n\n\n"
            exit 1
        fi
    fi

    if [ "$HDR" = "on" ]; then
        #2: hdr mode switch test
        echo -e "--------------------------------------- <sample_mulit_isp_stresstest> hdr_mode_switch_test start -------------------------------------------\n"
        echo -e "<sample_mulit_isp_stresstest -a /etc/iqfiles/ -c 2 --vi_size $vi_resolution --vi_chnid $vi_chnid --vi_buffcnt $vi_buff_cnt --modeTestType 2 --modeTestLoop $test_loop --testFrameCount $frame_count --ispLaunchMode $isp_group_mode>\n"
        sample_mulit_isp_stresstest -a /etc/iqfiles/ -c 2 --vi_size $vi_resolution --vi_chnid $vi_chnid --vi_buffcnt $vi_buff_cnt --modeTestType 2 --modeTestLoop $test_loop --testFrameCount $frame_count --ispLaunchMode $isp_group_mode
        if [ $? -eq 0 ]; then
            echo "-------------------------2 <sample_mulit_isp_stresstest> HDR mode switch test success " >> $test_result_path
            echo -e "--------------------------------------- <sample_mulit_isp_stresstest> hdr_mode_switch_test success -------------------------------------------\n\n\n"
        else
            echo "-------------------------2 <sample_mulit_isp_stresstest> HDR mode switch test failure " >> $test_result_path
            echo -e "--------------------------------------- <sample_mulit_isp_stresstest> hdr_mode_switch_test failure -------------------------------------------\n\n\n"
            exit 1
        fi
    fi

    if [ "$FRAMERATE" = "on" ]; then
        #3: frameRate switch test
        echo -e "--------------------------------------- <sample_mulit_isp_stresstest> frameRate_switch_test start -------------------------------------------\n"
        echo -e "<sample_mulit_isp_stresstest -a /etc/iqfiles/ -c 2 --vi_size $vi_resolution --vi_chnid $vi_chnid --vi_buffcnt $vi_buff_cnt --modeTestType 3 --modeTestLoop $vi_framerate_switch_loop --testFrameCount $frame_count --ispLaunchMode $isp_group_mode>\n"
        sample_mulit_isp_stresstest -a /etc/iqfiles/ -c 2 --vi_size $vi_resolution --vi_chnid $vi_chnid --vi_buffcnt $vi_buff_cnt --modeTestType 3 --modeTestLoop $vi_framerate_switch_loop --testFrameCount $frame_count --ispLaunchMode $isp_group_mode
        if [ $? -eq 0 ]; then
            echo "-------------------------3 <sample_mulit_isp_stresstest> isp frameRate switch test success " >> $test_result_path
            echo -e "--------------------------------------- <sample_mulit_isp_stresstest> frameRate_switch_test success -------------------------------------------\n\n\n"
        else
            echo "-------------------------3 <sample_mulit_isp_stresstest> isp frameRate switch test failure " >> $test_result_path
            echo -e "--------------------------------------- <sample_mulit_isp_stresstest> frameRate_switch_test failure -------------------------------------------\n\n\n"
            exit 1
        fi
    fi

    if [ "$LDCH" = "on" ]; then
        #4: LDCH mode test
        echo -e "--------------------------------------- <sample_mulit_isp_stresstest> LDCH mode test start -------------------------------------------\n"
        echo -e "<sample_mulit_isp_stresstest -a /etc/iqfiles/ -c 2 --vi_size $vi_resolution --vi_chnid $vi_chnid --vi_buffcnt $vi_buff_cnt --modeTestType 4 --modeTestLoop $test_loop --testFrameCount $frame_count --ispLaunchMode $isp_group_mode>\n"
        sample_mulit_isp_stresstest -a /etc/iqfiles/ -c 2 --vi_size $vi_resolution --vi_chnid $vi_chnid --vi_buffcnt $vi_buff_cnt --modeTestType 4 --modeTestLoop $test_loop --testFrameCount $frame_count --ispLaunchMode $isp_group_mode
        if [ $? -eq 0 ]; then
            echo "-------------------------4 <sample_mulit_isp_stresstest> LDCH mode switch test success " >> $test_result_path
            echo -e "--------------------------------------- <sample_mulit_isp_stresstest> LDCH mode test success -------------------------------------------\n\n\n"
        else
            echo "-------------------------4 <sample_mulit_isp_stresstest> LDCH mode switch test failure " >> $test_result_path
            echo -e "--------------------------------------- <sample_mulit_isp_stresstest> LDCH mode test failure -------------------------------------------\n\n\n"
            exit 1
        fi
    fi

    if [ "$RESTART" = "on" ]; then
        #4: isp_deinit_init test
        echo -e "--------------------------------------- <sample_mulit_isp_stresstest> isp_deinit_init test start -------------------------------------------\n"
        echo -e "<sample_mulit_isp_stresstest -a /etc/iqfiles/ -c 2 --vi_size $vi_resolution --vi_chnid $vi_chnid --vi_buffcnt $vi_buff_cnt --modeTestType 5 --modeTestLoop $test_loop --testFrameCount $frame_count --ispLaunchMode $isp_group_mode>\n"
        sample_mulit_isp_stresstest -a /etc/iqfiles/ -c 2 --vi_size $vi_resolution --vi_chnid $vi_chnid --vi_buffcnt $vi_buff_cnt --modeTestType 5 --modeTestLoop $test_loop --testFrameCount $frame_count --ispLaunchMode $isp_group_mode
        if [ $? -eq 0 ]; then
            echo "-------------------------5 <sample_mulit_isp_stresstest> isp_deinit_init switch test success " >> $test_result_path
            echo -e "--------------------------------------- <sample_mulit_isp_stresstest> isp_deinit_init test success -------------------------------------------\n\n\n"
        else
            echo "-------------------------5 <sample_mulit_isp_stresstest> isp_deinit_init switch test failure " >> $test_result_path
            echo -e "--------------------------------------- <sample_mulit_isp_stresstest> isp_deinit_init test failure -------------------------------------------\n\n\n"
            exit 1
        fi
    fi

    sleep 3
    echo 3 > /proc/sys/vm/drop_caches
    cat /proc/meminfo | grep MemAvailable >> $test_result_path

}

test_case

exit 0

