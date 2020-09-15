#!/bin/bash

source /home/hadoop/.bashrc

hadoop-daemon.sh start datanode
yarn-daemon.sh start nodemanager
mr-jobhistory-daemon.sh start historyserver

sudo /usr/sbin/sshd -D
# 50070 查看 namenode、8088 资源管理器、19888 查看历史服务器
# 创建目录：hadoop fs -mkdir -p /user/$USER