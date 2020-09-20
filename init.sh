#!/bin/bash
# 用来初始化一些操作（一些敏感文件生成、安装包的下载）

yes | ssh-keygen -t rsa -C "test" -f id_rsa -N ""

wget http://archive.apache.org/dist/hadoop/common/hadoop-2.6.5/hadoop-2.6.5.tar.gz -P hadoop/
wget http://archive.apache.org/dist/spark/spark-2.4.7/spark-2.4.7-bin-hadoop2.6.tgz -P spark/
wget http://archive.apache.org/dist/kafka/2.6.0/kafka_2.12-2.6.0.tgz -P kafka/
wget http://archive.apache.org/dist/zookeeper/zookeeper-3.5.8/apache-zookeeper-3.5.8-bin.tar.gz -P zookeeper/
wget https://repo1.maven.org/maven2/org/apache/iceberg/iceberg-spark-runtime/0.9.1/iceberg-spark-runtime-0.9.1.jar -P iceberg/
mkdir -p kafka-eagle && wget https://github.com/smartloli/kafka-eagle-bin/archive/v2.0.1.tar.gz -O kafka-eagle/kafka-eagle-bin-2.0.1.tar.gz