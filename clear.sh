#! /bin/bash
if [[ $1 && $2 && -d $1 ]]; then
	# 时间范围
	saveTime=$[$2*24*60*60]
	echo $saveTime
	function clearLog(){
		for i in `ls $1`; do
			if [[ -f $1/$i ]]; then
				# 获取文件修改时间
				modifiedTime=`stat -c %Y $1/$i`
				# 获取系统当前时间
				currTime=`date +%s`
				if [[ $[ $currTime - $modifiedTime] -lt $saveTime ]]; then
					rm -f $1/$i
				else
					echo $[ $currTime - $modifiedTime]
				fi

			elif [[ -d $1/$i ]]; then
				clearLog $1/$i
			fi
		done
	}

	# clearLog $1

	echo '清理成功'
else
	echo '请输入有效的文件目录和天数'
	exit
fi
