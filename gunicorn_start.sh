
for line in `cat .env`
do
    if [ ${line:0:1} != '#' ]
    then
        export ${line//\'/}
    fi
done

cd ~/www/python/zaixiandati && gunicorn -k gevent -w 1 -b 192.168.1.15:8888  app:App
