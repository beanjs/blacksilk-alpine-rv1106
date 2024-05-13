#!/bin/sh

print_help()
{
    echo "example: <test_mod=on> $0 <test_result_path> <test_loop> <test_frame> <ifEnableWrap>"
    echo "mod: 1.RESOLUTION 2.ENCODE_TYPE 3.SMART_P 4.SVC 5.MOTION 6.IDR 7.ROTATION"
    echo -e "
          \$1 --------test_result_path: /tmp/stresstest.log\n
          \$2 --------test_loop: 10000\n
          \$3 --------test_frame: 10\n
          \$4 --------ifEnableWrap: 0:close, 1:open\n"
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
if [ ! -n "$4" ]; then
    echo "----------------- error!!!!, lack frame_count, please input test frame"
    print_help
    exit 1
fi

#set wrap mode
ifOpenWrap=$4
if [ ! -n "$4" ]; then
    echo "----------------- warning!!!!, lack ifOpenWrap setting, please input setting"
    print_help
    exit 1
fi

test_case()
{
    if [ "$RESOLUTION" = "on" ]; then
        #venc resolution switch test
        echo -e "--------------------------------------- <sample_venc_stresstest> venc resolution switch test start -------------------------------------------\n"
        echo -e "<sample_venc_stresstest -w 1920 -h 1080 -a /etc/iqfiles/ --wrap $ifOpenWrap --mode_test_type 1 --mode_test_loop $test_loop --test_frame_count $frame_count>\n"
        sample_venc_stresstest -w 1920 -h 1080 -a /etc/iqfiles/ --wrap $ifOpenWrap --mode_test_type 1 --mode_test_loop $test_loop --test_frame_count $frame_count
        if [ $? -eq 0 ]; then
            echo "-------------------------5 <sample_venc_stresstest> venc resolution switch test success" >> $test_result_path
            echo -e "--------------------------------------- <sample_venc_stresstest> venc resolution switch test success -------------------------------------------\n\n\n"
        else
            echo "-------------------------5 <sample_venc_stresstest> venc resolution switch test failure" >> $test_result_path
            echo -e "--------------------------------------- <sample_venc_stresstest> venc resolution switch test failure -------------------------------------------\n\n\n"
            exit 1
        fi
    fi

    if [ "$ENCODE_TYPE" = "on" ]; then
        # encode type switch test
        echo -e "--------------------------------------- <sample_venc_stresstest> encode type switch test start -------------------------------------------\n"
        echo -e "<sample_venc_stresstest -w 1920 -h 1080 -a /etc/iqfiles/ --wrap $ifOpenWrap --mode_test_type 2 --mode_test_loop $test_loop --test_frame_count $frame_count>\n"
        sample_venc_stresstest -w 1920 -h 1080 -a /etc/iqfiles/ --wrap $ifOpenWrap --mode_test_type 2 --mode_test_loop $test_loop --test_frame_count $frame_count
        if [ $? -eq 0 ]; then
            echo "-------------------------6 <sample_venc_stresstest> encode type switch test success" >> $test_result_path
            echo -e "--------------------------------------- <sample_venc_stresstest> encode type switch test success -------------------------------------------\n\n\n"
        else
            echo "-------------------------6 <sample_venc_stresstest> encode type switch test failure" >> $test_result_path
            echo -e "--------------------------------------- <sample_venc_stresstest> encode type switch test failure -------------------------------------------\n\n\n"
            exit 1
        fi
    fi

    if [ "$SMART_P" = "on" ]; then
        #smartp mode switch test
        echo -e "--------------------------------------- <sample_venc_stresstest> smartp mode switch test start -------------------------------------------\n"
        echo -e "<sample_venc_stresstest -w 1920 -h 1080 -a /etc/iqfiles/ --wrap $ifOpenWrap --mode_test_type 3 --mode_test_loop $test_loop --test_frame_count $frame_count>\n"
        sample_venc_stresstest -w 1920 -h 1080 -a /etc/iqfiles/ --wrap $ifOpenWrap --mode_test_type 3 --mode_test_loop $test_loop --test_frame_count $frame_count
        if [ $? -eq 0 ]; then
            echo "-------------------------7 <sample_venc_stresstest> smartp mode switch test success" >> $test_result_path
            echo -e "--------------------------------------- <sample_venc_stresstest> smartp mode switch test success -------------------------------------------\n\n\n"
        else
            echo "-------------------------7 <sample_venc_stresstest> smartp mode switch test failure" >> $test_result_path
            echo -e "--------------------------------------- <sample_venc_stresstest> smartp mode switch test failure -------------------------------------------\n\n\n"
            exit 1
        fi
    fi

    if [ "$SVC" = "on" ]; then
        #SVC mode switch test
        echo -e "--------------------------------------- <sample_venc_stresstest> SVC mode switch test start -------------------------------------------\n"
        echo -e "<sample_venc_stresstest -w 1920 -h 1080 -a /etc/iqfiles/ --wrap $ifOpenWrap --mode_test_type 4 --mode_test_loop $test_loop --test_frame_count $frame_count>\n"
        sample_venc_stresstest -w 1920 -h 1080 -a /etc/iqfiles/ --wrap $ifOpenWrap --mode_test_type 4 --mode_test_loop $test_loop --test_frame_count $frame_count
        if [ $? -eq 0 ]; then
            echo "-------------------------8 <sample_venc_stresstest> SVC mode switch test success" >> $test_result_path
            echo -e "--------------------------------------- <sample_venc_stresstest> SVC mode switch test success -------------------------------------------\n\n\n"
        else
            echo "-------------------------8 <sample_venc_stresstest> SVC mode switch test failure" >> $test_result_path
            echo -e "--------------------------------------- <sample_venc_stresstest> SVC mode switch test failure -------------------------------------------\n\n\n"
            exit 1
        fi
    fi

    if [ "$MOTION" = "on" ]; then
        #motion deblur switch test
        echo -e "<sample_venc_stresstest -w 1920 -h 1080 -a /etc/iqfiles/ --wrap $ifOpenWrap --mode_test_type 5 --mode_test_loop $test_loop --test_frame_count $frame_count>\n"
        echo -e "--------------------------------------- <sample_venc_stresstest> motion deblur switch test start -------------------------------------------\n"
        sample_venc_stresstest -w 1920 -h 1080 -a /etc/iqfiles/ --wrap $ifOpenWrap --mode_test_type 5 --mode_test_loop $test_loop --test_frame_count $frame_count
        if [ $? -eq 0 ]; then
            echo "-------------------------9 <sample_venc_stresstest> motion deblur switch test success" >> $test_result_path
            echo -e "--------------------------------------- <sample_venc_stresstest> motion deblur switch test success -------------------------------------------\n\n\n"
        else
            echo "-------------------------9 <sample_venc_stresstest> motion deblur switch test failure" >> $test_result_path
            echo -e "--------------------------------------- <sample_venc_stresstest> motion deblur switch test failure -------------------------------------------\n\n\n"
            exit 1
        fi
    fi

    if [ "$IDR" = "on" ]; then
        #force IDR switch test
        echo -e "--------------------------------------- <sample_venc_stresstest> force IDR switch test start -------------------------------------------\n"
        echo -e "<sample_venc_stresstest -w 1920 -h 1080 -a /etc/iqfiles/ --wrap $ifOpenWrap --mode_test_type 6 --mode_test_loop $test_loop --test_frame_count $frame_count>\n"
        sample_venc_stresstest -w 1920 -h 1080 -a /etc/iqfiles/ --wrap $ifOpenWrap --mode_test_type 6 --mode_test_loop $test_loop --test_frame_count $frame_count
        if [ $? -eq 0 ]; then
            echo "-------------------------10 <sample_venc_stresstest> force IDR switch test success" >> $test_result_path
            echo -e "--------------------------------------- <sample_venc_stresstest> force IDR switch test success -------------------------------------------\n\n\n"
        else
            echo "-------------------------10 <sample_venc_stresstest> force IDR switch test failure" >> $test_result_path
            echo -e "--------------------------------------- <sample_venc_stresstest> force IDR switch test failure -------------------------------------------\n\n\n"
            exit 1
        fi
    fi

    if [ "$ROTATION" = "on" ]; then
        #venc chn rotation switch test
        echo -e "--------------------------------------- <sample_venc_stresstest> venc chn rotation test start -------------------------------------------\n"
        echo -e "<sample_venc_stresstest -w 1920 -h 1080 -a /etc/iqfiles/ --wrap $ifOpenWrap --mode_test_type 7 --mode_test_loop $test_loop --test_frame_count $frame_count>\n"
        sample_venc_stresstest -w 1920 -h 1080 -a /etc/iqfiles/ --wrap $ifOpenWrap --mode_test_type 7 --mode_test_loop $test_loop --test_frame_count $frame_count
        if [ $? -eq 0 ]; then
            echo "-------------------------11 <sample_venc_stresstest> venc chn rotation test success" >> $test_result_path
            echo -e "--------------------------------------- <sample_venc_stresstest> venc chn rotation test success -------------------------------------------\n\n\n"
        else
            echo "-------------------------11 <sample_venc_stresstest> venc chn rotation test failure" >> $test_result_path
            echo -e "--------------------------------------- <sample_venc_stresstest> venc chn rotation test failure -------------------------------------------\n\n\n"
            exit 1
        fi
    fi

    sleep 1
    echo 3 > /proc/sys/vm/drop_caches
    cat /proc/meminfo | grep MemAvailable >> $test_result_path

}

test_case

exit 0
