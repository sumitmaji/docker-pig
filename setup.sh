#!/bin/bash


#Install Pig
wget "$REPOSITORY_HOST"/repo/pig-0.16.0.tar.gz
tar -xzvf /usr/local/pig-0.16.0.tar.gz
mv /usr/local/pig-0.16.0 /usr/local/pig
rm -rf /usr/local/pig-0.16.0.tar.gz
chown -R hduser:hadoop /usr/local/pig

#Derby Environemtn Setup
export PIG_HOME="/usr/local/pig"
export PIG_CLASSPATH="$HADOOP_HOME/etc/hadoop:."
export PATH="$PATH:$PIG_HOME/bin"

echo 'export PIG_HOME=/usr/local/pig' >> /home/hduser/.bashrc
echo 'export PIG_CLASSPATH=$HADOOP_HOME/etc/hadoop:.' >> /home/hduser/.bashrc
echo 'export PATH=$PATH:$PIG_HOME/bin' >> /home/hduser/.bashrc


