FROM sumit/hadoop:latest
MAINTAINER Sumit Kumar Maji

ADD . /container/

#Derby Environemtn Setup
ENV PIG_HOME /usr/local/pig
ENV PIG_CLASSPATH $HADOOP_HOME/etc/hadoop:.
ENV PATH $PATH:$PIG_HOME/bin

RUN /container/setup.sh

EXPOSE 9000

CMD /usr/sbin/sshd -D

