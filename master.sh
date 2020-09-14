#!/bin/bash
sudo /usr/sbin/sshd -D

#start-dfs.sh
#start-yarn.sh
hadoop-daemons.sh start namenode
hadoop-daemons.sh start secondarynamenode
yarn-daemon.sh start resourcemanager
mr-jobhistory-daemon.sh start historyserver

# 初始化需要执行 hdfs namenode -format
# 50070 查看 namenode、8088 资源管理器、19888 查看历史服务器
# 创建目录：hadoop fs -mkdir -p /user/$USER