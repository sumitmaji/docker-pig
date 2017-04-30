FROM sumit/hadoop:latest
MAINTAINER Sumit Kumar Maji

#Install Pig
COPY pig-0.16.0.tar.gz /usr/local/pig-0.16.0.tar.gz
RUN tar -xzvf /usr/local/pig-0.16.0.tar.gz -C /usr/local/
RUN mv /usr/local/pig-0.16.0 /usr/local/pig
RUN rm -rf /usr/local/pig-0.16.0.tar.gz
RUN chown -R hduser:hadoop /usr/local/pig

#Derby Environemtn Setup
ENV PIG_HOME /usr/local/pig
ENV PIG_CLASSPATH $HADOOP_HOME/etc/hadoop:.
ENV PATH $PATH:$PIG_HOME/bin

RUN echo 'export PIG_HOME=/usr/local/pig' >> /home/hduser/.bashrc
RUN echo 'export PIG_CLASSPATH=$HADOOP_HOME/etc/hadoop:.' >> /home/hduser/.bashrc
RUN echo 'export PATH=$PATH:$PIG_HOME/bin' >> /home/hduser/.bashrc


ADD bootstrap.sh /etc/bootstrap.sh
RUN chown hduser:hadoop /etc/bootstrap.sh
RUN chmod 700 /etc/bootstrap.sh

ENV BOOTSTRAP /etc/bootstrap.sh
RUN su - hduser -c "echo 'export BOOTSTRAP=/etc/bootstrap.sh' >> /home/hduser/.bashrc"

RUN apt-get update & apt-get install -y net-tools

EXPOSE 9000

CMD /usr/sbin/sshd -D

