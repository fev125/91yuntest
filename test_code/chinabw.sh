cbw()
{
	#获得相关数据
	wget --no-check-certificate https://raw.githubusercontent.com/91yun/speedtest-cli/master/speedtest_cli.py 1>/dev/null 2>&1
	bd=`python speedtest_cli.py --server $1`
    latency=`echo "$bd" | awk -F ':' '/Hosted/{print $2}'`
	download=`echo "$bd" | awk -F ':' '/Download/{print $2}'`
	upload=`echo "$bd" | awk -F ':' '/Upload/{print $2}'`
	hostby=`echo "$bd" | grep 'Hosted'`
    rm -rf speedtest_cli.py

	#显示在屏幕上
    if [ -n "$latency" ]
    then
        printf "%-18s%-18s%-20s%-12s\n" "$2" "$upload" "$download" "$latency"
        #写入日志文件
	    echo "$2|$upload|$download|$latency">>${dir}/$logfilename
    fi


}
chinabw()
{
    next
    echo "===开始测试国内带宽===">>${dir}/$logfilename
    printf "%-18s%-18s%-20s%-12s\n" " Node Name" "Upload Speed" "Download Speed" "Latency"
    cbw '5316' '南京 电信'
    cbw '19076' '重庆 电信'
    cbw '7509' '杭州 电信'
    cbw '17251' '广州 电信'
    cbw '2461' '成都 联通'
    cbw '5145' '北京 联通'
    cbw '21005' '上海 联通'
    cbw '6144' '乌鲁木齐 联通'
    cbw '16803' '上海 移动'
    cbw '16803' '上海 移动'
    cbw '4515' '深圳 移动'
    cbw '4647' '杭州 移动'
    cbw '6611' '广州 移动'
    cbw '6611' '广州 移动'
    
    echo -e "===国内带宽测试结束==\n\n">>${dir}/$logfilename
}


