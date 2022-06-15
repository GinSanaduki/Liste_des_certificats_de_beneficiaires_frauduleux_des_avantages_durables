#!/bin/sh
# 02_RandomSleep_Deux.sh
# sh ShellScript/02_RandomSleep_Deux.sh

LoopCnt=3
while true
do
	test $LoopCnt -lt 0 && SleepTime=10 && break
	Rand=`od -A n -t u4 -N 4 /dev/urandom | sed 's/[^0-9]//g'`
	SleepTime=`echo "$Rand % 21" | bc`
	test $SleepTime -ge 10 && break
	sleep 2
	LoopCnt=$(($LoopCnt-1))
done

echo $SleepTime" seconds sleep start..."

for i in $(seq 1 $SleepTime | tac)
do
	printf '%s %s\r' "$i" 'seconds pending..';
	sleep 1;
done

echo $SleepTime" seconds sleep end."

exit 0

