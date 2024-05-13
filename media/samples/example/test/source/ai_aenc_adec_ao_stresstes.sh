#!/bin/sh

print_help()
{
    echo "example: $0  <test_loop>"
    echo -e "
          \$1 --------test_loop: 10000\n"
}

#set test mode
test_mode=$1
if [ ! -n "$1" ]; then
    echo "----------------- error!!!, lack test_mode, please input test mode"
    print_help
    exit 1
else
    echo --------test_mode: $test_mode
fi


#set test loop
test_loop=$2
if [ ! -n "$2" ]; then
    echo "----------------- error!!!, lack test_loop, please input test loop"
    print_help
    exit 1
else
    echo --------test_loop: $test_loop
fi

killall rkipc
while true
do
    ps|grep rkipc |grep -v grep
    if [ $? -ne 0 ]; then
        echo "rkipc exit"
        break
    else
        sleep 1
        echo "rkipc active"
    fi
done

test_case()
{
    if [ $test_mode == 0 ]; then
        echo -e "--------------------------------------- <sample_ai_aenc_adec_ao_stresstest 8k g711a> start -------------------------------------------\n"
        echo -e "<sample_ai_aenc_adec_ao_stresstest -r 8000 -t g711a -v 1>\n"
        sample_ai_aenc_adec_ao_stresstest -r 8000 -t g711a -v 1
        if [ $? -eq 0 ]; then
            echo "-------------------------<sample_ai_aenc_adec_ao_stresstest 8k g711a> success" > /tmp/sample_ai_aenc_adec_ao_stresstest.log
            echo -e "--------------------------------------- <sample_ai_aenc_adec_ao_stresstest> success -------------------------------------------\n\n\n"
        else
            echo "-------------------------<sample_ai_aenc_adec_ao_stresstest 8k g711a> failure" > /tmp/sample_ai_aenc_adec_ao_stresstest.log
            echo -e "--------------------------------------- <sample_ai_aenc_adec_ao_stresstest> failure -------------------------------------------\n\n\n"
            exit 0
        fi
    elif [ $test_mode == 1 ]; then
        echo -e "--------------------------------------- <sample_ai_aenc_adec_ao_stresstest 16k g711a> start -------------------------------------------\n"
        echo -e "<sample_ai_aenc_adec_ao_stresstest -r 16000 -t g711a -v 1>\n"
        sample_ai_aenc_adec_ao_stresstest -r 16000 -t g711a -v 1
        if [ $? -eq 0 ]; then
            echo "-------------------------<sample_ai_aenc_adec_ao_stresstest 16k g711a> success" > /tmp/sample_ai_aenc_adec_ao_stresstest.log
            echo -e "--------------------------------------- <sample_ai_aenc_adec_ao_stresstest> success -------------------------------------------\n\n\n"
        else
            echo "-------------------------<sample_ai_aenc_adec_ao_stresstest 16k g711a> failure" > /tmp/sample_ai_aenc_adec_ao_stresstest.log
            echo -e "--------------------------------------- <sample_ai_aenc_adec_ao_stresstest> failure -------------------------------------------\n\n\n"
            exit 0
        fi
    elif [ $test_mode == 2 ]; then
        echo -e "--------------------------------------- <sample_ai_aenc_adec_ao_stresstest 8k g711u> start -------------------------------------------\n"
        echo -e "<sample_ai_aenc_adec_ao_stresstest -r 8000 -t g711u -v 1>\n"
        sample_ai_aenc_adec_ao_stresstest -r 8000 -t g711u -v 1
        if [ $? -eq 0 ]; then
            echo "-------------------------<sample_ai_aenc_adec_ao_stresstest> success 8k g711u" > /tmp/sample_ai_aenc_adec_ao_stresstest.log
            echo -e "--------------------------------------- <sample_ai_aenc_adec_ao_stresstest> success -------------------------------------------\n\n\n"
        else
            echo "-------------------------<sample_ai_aenc_adec_ao_stresstest> failure 8k g711u" > /tmp/sample_ai_aenc_adec_ao_stresstest.log
            echo -e "--------------------------------------- <sample_ai_aenc_adec_ao_stresstest> failure -------------------------------------------\n\n\n"
            exit 0
        fi
    elif [ $test_mode == 3 ]; then
        echo -e "--------------------------------------- <sample_ai_aenc_adec_ao_stresstest 16k g711u> start -------------------------------------------\n"
        echo -e "<sample_ai_aenc_adec_ao_stresstest -r 16000 -t g711u -v 1>\n"
        sample_ai_aenc_adec_ao_stresstest -r 16000 -t g711u -v 1
        if [ $? -eq 0 ]; then
            echo "-------------------------<sample_ai_aenc_adec_ao_stresstest 16k g711u> success" > /tmp/sample_ai_aenc_adec_ao_stresstest.log
            echo -e "--------------------------------------- <sample_ai_aenc_adec_ao_stresstest> success -------------------------------------------\n\n\n"
        else
            echo "-------------------------<sample_ai_aenc_adec_ao_stresstest 16k g711u> failure" > /tmp/sample_ai_aenc_adec_ao_stresstest.log
            echo -e "--------------------------------------- <sample_ai_aenc_adec_ao_stresstest> failure -------------------------------------------\n\n\n"
            exit 0
        fi
    elif [ $test_mode == 4 ]; then
        echo -e "--------------------------------------- <sample_ai_aenc_adec_ao_stresstest 8k g726> start -------------------------------------------\n"
        echo -e "<sample_ai_aenc_adec_ao_stresstest -r 8000 -t g726 -v 1>\n"
        sample_ai_aenc_adec_ao_stresstest -r 8000 -t g726 -v 1
        if [ $? -eq 0 ]; then
            echo "-------------------------<sample_ai_aenc_adec_ao_stresstest 8k g726> success" > /tmp/sample_ai_aenc_adec_ao_stresstest.log
            echo -e "--------------------------------------- <sample_ai_aenc_adec_ao_stresstest> success -------------------------------------------\n\n\n"
        else
            echo "-------------------------<sample_ai_aenc_adec_ao_stresstest 8k g726> failure" > /tmp/sample_ai_aenc_adec_ao_stresstest.log
            echo -e "--------------------------------------- <sample_ai_aenc_adec_ao_stresstest> failure -------------------------------------------\n\n\n"
            exit 0
        fi
    elif [ $test_mode == 5 ]; then
        echo -e "--------------------------------------- <sample_ai_aenc_adec_ao_stresstest 16k g711a loop $test_loop> start -------------------------------------------\n"
        echo -e "<sample_ai_aenc_adec_ao_stresstest  -r 16000 -t g711a -v 1 -s 1 -l $test_loop>\n"
        sample_ai_aenc_adec_ao_stresstest -r 16000 -t g711a -v 1 -s 1 -l $test_loop
        if [ $? -eq 0 ]; then
            echo "-------------------------<sample_ai_aenc_adec_ao_stresstest 16k g711a loop $test_loop> success" > /tmp/sample_ai_aenc_adec_ao_stresstest.log
            echo -e "--------------------------------------- <sample_ai_aenc_adec_ao_stresstest> success -------------------------------------------\n\n\n"
        else
            echo "-------------------------<sample_ai_aenc_adec_ao_stresstest 16k g711a loop $test_loop> failure" > /tmp/sample_ai_aenc_adec_ao_stresstest.log
            echo -e "--------------------------------------- <sample_ai_aenc_adec_ao_stresstest> failure -------------------------------------------\n\n\n"
            exit 0
        fi
    else
        echo -e "---------------------------------------test_mode($test_mode) is invalid parameter, parameter range is [0,5]-------------------------------------------\n"
    fi
}

test_case
echo "sample_ai_aenc_adec_ao_stresstest is:"
cat /tmp/sample_ai_aenc_adec_ao_stresstest.log

exit 0
