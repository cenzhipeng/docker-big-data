export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk
export PATH=$PATH:$JAVA_HOME/bin
export HADOOP_HOME=/home/hadoop/hadoop
export SPARK_HOME=/home/hadoop/spark
export ZK_HOME=/home/hadoop/zookeeper
export KAFKA_HOME=/home/hadoop/kafka
export PATH=$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin
export PATH=$PATH:$SPARK_HOME/bin:$SPARK_HOME/sbin
export PATH=$PATH:$ZK_HOME/bin
export PATH=$PATH:$KAFKA_HOME/bin
export KE_HOME=/home/hadoop/kafka-eagle
export PATH=$PATH:$KE_HOME/bin

if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

export CLICOLOR=1
export LSCOLORS='gxfxcxdxbxGxDxabagacad'
export PS1='\[\033[01;32m\]\u@\[\033[01;32m\]\H:\[\033[01;36m\]\w\[\033[00m\]\$ '
export TERM=xterm-color









# path
# RUN echo 'export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk' >> /home/hadoop/.bashrc
# RUN echo 'export PATH=$PATH:$JAVA_HOME/bin' >> /home/hadoop/.bashrc
# RUN echo 'export HADOOP_HOME=/home/hadoop/hadoop' >> /home/hadoop/.bashrc
# RUN echo 'export SPARK_HOME=/home/hadoop/spark' >> /home/hadoop/.bashrc
# RUN echo 'export ZK_HOME=/home/hadoop/zookeeper' >> /home/hadoop/.bashrc
# RUN echo 'export KAFKA_HOME=/home/hadoop/kafka' >> /home/hadoop/.bashrc
# RUN echo 'export PATH=$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin' >> /home/hadoop/.bashrc
# RUN echo 'export PATH=$PATH:$SPARK_HOME/bin:$SPARK_HOME/sbin' >> /home/hadoop/.bashrc
# RUN echo 'export PATH=$PATH:$ZK_HOME/bin' >> /home/hadoop/.bashrc
# RUN echo 'export PATH=$PATH:$KAFKA_HOME/bin' >> /home/hadoop/.bashrc