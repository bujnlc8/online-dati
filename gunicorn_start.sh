cd ~/www/python/zaixiandati
for line in `cat .env`
do
    if [ ${line:0:1} != '#' ]
    then
        export ${line//\'/}
    fi
done
inet=`ifconfig -a|grep inet|grep -v 127.0.0.1|grep -v inet6|awk '{print $2}'|tr -d "addr:" | awk 'NR==1'`
gunicorn -k gevent -w 1 -b ${inet}:8888  app:App
