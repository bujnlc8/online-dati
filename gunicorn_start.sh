cd ~/www/python/zaixiandati
for line in `cat .env`
do
    if [ ${line:0:1} != '#' ]
    then
        export ${line//\'/}
    fi
done

gunicorn -k gevent -w 1 -b 192.168.1.15:8888  app:App
