FROM centos:7
ENV HADOOP_VERSION hadoop-2.6.5
ENV SPARK_VERSION spark-2.4.7-bin-hadoop2.6

# 基础 ssh 服务
RUN yum install passwd openssl openssh-server openssh-clients sudo java-1.8.0-openjdk-devel.x86_64 which net-tools supervisor -y
RUN sed -i 's/#*PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config
RUN sed -i "s/UsePAM.*/UsePAM no/g" /etc/ssh/sshd_config
RUN ssh-keygen -q -t rsa -b 2048 -f /etc/ssh/ssh_host_rsa_key -N ''
RUN ssh-keygen -q -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key -N ''
RUN ssh-keygen -t dsa -f /etc/ssh/ssh_host_ed25519_key  -N ''
RUN echo "StrictHostKeyChecking no" > /etc/ssh/ssh_config
COPY id_rsa /etc/ssh/id_rsa
COPY id_rsa.pub /etc/ssh/id_rsa.pub
RUN cat /etc/ssh/id_rsa.pub > /etc/ssh/authorized_keys
EXPOSE 22
RUN useradd -m hadoop && echo "hadoop:hadoop" | chpasswd && usermod -aG wheel hadoop
RUN echo 'hadoop ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers
USER hadoop
WORKDIR /home/hadoop
COPY id_rsa /home/hadoop/.ssh/id_rsa
RUN sudo chmod 600 /home/hadoop/.ssh/id_rsa
COPY id_rsa.pub /home/hadoop/.ssh/id_rsa.pub
RUN sudo chmod 644 /home/hadoop/.ssh/id_rsa.pub
COPY master.sh /home/hadoop/master.sh
COPY slaver.sh /home/hadoop/slaver.sh
RUN sudo chown -R hadoop:hadoop /home/hadoop/
RUN cat /home/hadoop/.ssh/id_rsa.pub > /home/hadoop/.ssh/authorized_keys


# hadoop
COPY hadoop/$HADOOP_VERSION.tar.gz /home/hadoop/$HADOOP_VERSION.tar.gz
RUN tar -zxvf $HADOOP_VERSION.tar.gz && mv $HADOOP_VERSION hadoop
RUN rm -rf /home/hadoop/$HADOOP_VERSION.tar.gz

# spark
COPY spark/$SPARK_VERSION.tgz /home/hadoop/$SPARK_VERSION.tgz
RUN tar -zxvf $SPARK_VERSION.tgz && mv $SPARK_VERSION spark
RUN rm -rf /home/hadoop/$SPARK_VERSION.tgz



# path
RUN echo 'export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk' >> /home/hadoop/.bashrc
RUN echo 'export PATH=$PATH:$JAVA_HOME/bin' >> /home/hadoop/.bashrc
RUN echo 'export HADOOP_HOME=/home/hadoop/hadoop' >> /home/hadoop/.bashrc
RUN echo 'export SPARK_HOME=/home/hadoop/spark' >> /home/hadoop/.bashrc
RUN echo 'export PATH=$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin' >> /home/hadoop/.bashrc
RUN echo 'export PATH=$PATH:$SPARK_HOME/bin:$SPARK_HOME/sbin' >> /home/hadoop/.bashrc


RUN sudo yum install epel-release -y
RUN sudo yum install -y supervisor
