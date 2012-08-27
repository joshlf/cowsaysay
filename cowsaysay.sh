if [ $# -ne 2 ]
then
	echo "Usage: $0 <n> <text>"
	exit 1
fi

if [ $1 -eq 0 ]
then
	echo $2 | cowsay
	exit 0
fi

TMP1=/tmp/cowsaysay$$_1.tmp
TMP2=/tmp/cowsaysay$$_2.tmp

echo $2 > $TMP1

for i in `seq 1 $1`
do
	cowsay -n <$TMP1 >$TMP2	
	mv $TMP2 $TMP1
done

cat $TMP1
rm $TMP1
