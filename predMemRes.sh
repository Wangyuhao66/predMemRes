#!/usr/bin/env bash

#echo original parameters=[$@]

#-o或--options选项后面是可接受的短选项，如ab:c::，表示可接受的短选项为-a -b -c，
#其中-a选项不接参数，-b选项后必须接参数，-c选项的参数为可选的
#-l或--long选项后面是可接受的长选项，用逗号分开，冒号的意义同短选项。
#-n选项 后接选项解析错误时提示的脚本名字
ARGS=`getopt -o ha:o: --long genome:,output_tag: -n "$0" -- "$@"`
if [ $? != 0 ]; then
    echo "Terminating..."
    exit 1
fi

#echo ARGS=[$ARGS]
#将规范化后的命令行参数分配至位置参数（$1,$2,...)
eval set -- "${ARGS}"
#echo formatted parameters=[$@]

while true
do
    case "$1" in
	-h|--help)
            echo "Usage: predMemRes.sh -a genome -o output_tag"
	    echo "-a|--genome the input genome file"
	    echo "-o|output_tag the output_tag"
	    exit 1
	    ;;
        -a|--genome)
            #echo "Option a";
	    forgenome=$2
            shift 2
            ;;
        -o|--output_tag)
            #echo "Option b, argument $2";
	    foroutput_tag=$2
            shift 2
            ;;
        --)
            shift
            break
            ;;
        *)
            echo "Internal error!"
            exit 1
            ;;
    esac
done
#
echo $forgenome,$foroutput_tag
#
#Rscript cutoffselection.R 666 /home/micro/LZP/PanCoreSample/VCsample/VCtreef/parsnp.tree
Rscript predMemRes.R $forgenome $foroutput_tag
