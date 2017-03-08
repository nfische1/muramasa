echo -------------- killing zombie childrens ---------------------------------------------
ps -wwef |
grep -e 'ruby.*sauce' |
grep -v grep |
while read u p o
do
  echo $u $p $o
  kill -9 $p
done
echo ---------------done killing zombies childrens -----------------------------------------