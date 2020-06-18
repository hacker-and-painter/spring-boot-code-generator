#!/bin/bash
## blog:www.cnbuilder.cn
## create 2019-04-30
version="5.2.1";
appName=$2
if [ -z $appName ];then
    appName=`ls -t |grep .jar$ |head -n1`
fi
## 后台启动项目 自动生成 catalina.log日志文件
function start()
{
    count=`ps -ef |grep java|grep $appName|wc -l`
    if [ $count != 0 ];then
        echo "Maybe $appName is running, please check it..."
    else
        echo "The $appName is starting..."
        ulimit -c unlimited
        nohup java -jar ./$appName -XX:+UseG1GC -XX:+HeapDumpOnOutOfMemoryError -Xms512M -Xmx4G > catalina.log 2>&1 &
    fi
}
## 停止项目
function stop()
{
    appId=`ps -ef |grep java|grep $appName|awk '{print $2}'`
    if [ -z $appId ];then
        echo "Maybe $appName not running, please check it..."
    else
        echo "The $appName is stopping..."
        kill -9 $appId
    fi
}
##重启项目(平滑启动)
function restart()
{
    # get release version
    releaseApp=`ls -t |grep .jar$ |head -n1`
    # get last version
    lastVersionApp=`ls -t |grep .jar$ |head -n2 |tail -n1`
    appName=$lastVersionApp
    stop
    for i in {5..1}
    do
        echo -n "$i "
        sleep 1
    done
    echo 0
    backup
    appName=$releaseApp
    start
}
function backup()
{
    # get backup version
    backupApp=`ls |grep -wv $releaseApp$ |grep .jar$`
    # create backup dir
    if [ ! -d "backup" ];then
        mkdir backup
    fi
    # backup
    for i in ${backupApp[@]}
    do
        echo "backup" $i
        mv $i backup
    done
}
## 查看项目当前状态
function status()
{
    appId=`ps -ef |grep java|grep $appName|awk '{print $2}'`
    if [ -z $appId ]
    then
        echo -e "\033[31m Not running \033[0m"
    else
        echo -e "\033[32m Running [$appId] \033[0m"
    fi
}
function usage()
{
    echo "Usage: $0 {start|stop|restart|status|stop -f}"
    echo "Example: $0 start"
    exit 1
}
case $1 in
    start)
    start;;
    stop)
    stop;;
    restart)
    restart;;
    status)
    status;;
    *)
    usage;;
esac
