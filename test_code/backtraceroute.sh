mtrback(){
	next
	echo "===测试 [$2] 的回程路由===" | tee -a ${dir}/$logfilename
	mtr -r -c 10 $1 | tee -a ${dir}/$logfilename
	echo -e "===回程 [$2] 路由测试结束===\n\n" | tee -a ${dir}/$logfilename

}

backtraceroute()
{
	mtrback "14.215.116.1" "广州电信（天翼云）"
	mtrback "101.227.255.45" "上海电信（天翼云）"
	mtrback "117.28.254.129" "厦门电信CN2"
	mtrback "113.207.32.65" "重庆联通"
	mtrback "183.192.160.3" "上海移动"
	mtrback "202.205.6.30" "北京教育网"
}