#!/bin/bash


#Install Pig
tar -xzvf /container/pig-0.16.0.tar.gz -C /usr/local/
mv /usr/local/pig-0.16.0 /usr/local/pig
rm -rf /container/pig-0.16.0.tar.gz
chown -R hduser:hadoop /usr/local/pig

#Derby Environemtn Setup
export PIG_HOME="/usr/local/pig"
export PIG_CLASSPATH="$HADOOP_HOME/etc/hadoop:."
export PATH="$PATH:$PIG_HOME/bin"

echo 'export PIG_HOME=/usr/local/pig' >> /home/hduser/.bashrc
echo 'export PIG_CLASSPATH=$HADOOP_HOME/etc/hadoop:.' >> /home/hduser/.bashrc
echo 'export PATH=$PATH:$PIG_HOME/bin' >> /home/hduser/.bashrc


