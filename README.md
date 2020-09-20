## 概述
本项目用于搭建一个开发用的测试环境，使用 docker-compose 进行搭建
## hosts
自行配置 hosts
## 站点
- master:50070 hadoop管理站点
- master:8020 hdfs 的 rpc 路径
- master:8088 yarn 的任务管理
- master:2181,slave1:2181,slave2:2181 zookeeper 集群地址
- master:9092,slave1:9092,slave2:9092 kafka 集群地址
- master:8048 kafka-eagle web 地址（admin 123456）