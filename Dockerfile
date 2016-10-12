
FROM ubuntu:latest
MAINTAINER Strykul (strykul@gmail.com)

#This Docker Image has been prepared for Android Development
#Preconditions are: 
#Java1.7, 
#Android SDK Tools:latest, 
#Android Platform Tools: latest,
#Android Build-Tools 21.1.2,
#Android Build-Tools 22.0.1,
#Android Build-Tools 23.0.3,
#Android SDK Platform 23,
#Android Support Repository:latest,
#Android Support Library:latest,

#Ubuntu setup
RUN apt-get update  
RUN apt-get install -y wget
RUN dpkg --add-architecture i386
RUN apt-get install -y expect
RUN apt-get update
RUN apt-get install -y libz1:i386 libncurses5:i386 libbz2-1.0:i386 libstdc++6:i386 
#Download Android SDK
RUN wget https://dl.google.com/android/android-sdk_r24.4.1-linux.tgz 
RUN tar zxvf android-sdk_r24.4.1-linux.tgz
 
#Move Android SDK to a proper location
RUN mv android-sdk-linux /opt/android-sdk
RUN cd /opt/android-sdk

#Install latest Java JDK&JRE
RUN apt-get install -y default-jre
RUN apt-get install -y default-jdk

#Setup Environmentals
ENV ANDROID_HOME /opt/android-sdk
ENV PATH ${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools
RUN ( sleep 5 && while [ 1 ]; do sleep 1; echo y; done ) | /opt/android-sdk/tools/android update sdk -a -u --filter tools
RUN ( sleep 5 && while [ 1 ]; do sleep 1; echo y; done ) | /opt/android-sdk/tools/android update sdk --all --no-ui --filter platform-tools
RUN ( sleep 5 && while [ 1 ]; do sleep 1; echo y; done ) | /opt/android-sdk/tools/android update sdk --all --no-ui --filter build-tools-22.0.1
RUN ( sleep 5 && while [ 1 ]; do sleep 1; echo y; done ) | /opt/android-sdk/tools/android update sdk --all --no-ui --filter build-tools-23.0.3
RUN ( sleep 5 && while [ 1 ]; do sleep 1; echo y; done ) | /opt/android-sdk/tools/android update sdk --all --no-ui --filter  build-tools-21.1.2
RUN ( sleep 5 && while [ 1 ]; do sleep 1; echo y; done ) | /opt/android-sdk/tools/android update sdk --all --no-ui --filter  android-19
RUN ( sleep 5 && while [ 1 ]; do sleep 1; echo y; done ) | /opt/android-sdk/tools/android update sdk --all --no-ui --filter  android-22
RUN ( sleep 5 && while [ 1 ]; do sleep 1; echo y; done ) | /opt/android-sdk/tools/android update sdk --all --no-ui --filter  android-23
RUN ( sleep 5 && while [ 1 ]; do sleep 1; echo y; done ) | /opt/android-sdk/tools/android update sdk --all --no-ui --filter  extra-android-support
RUN ( sleep 5 && while [ 1 ]; do sleep 1; echo y; done ) | /opt/android-sdk/tools/android update sdk --all --no-ui --filter  extra-android-m2repository
RUN ( sleep 5 && while [ 1 ]; do sleep 1; echo y; done ) | /opt/android-sdk/tools/android update sdk --all --no-ui --filter  extra-google-m2repository
RUN ( sleep 5 && while [ 1 ]; do sleep 1; echo y; done ) | /opt/android-sdk/tools/android update sdk --all --force --no-ui --filter  extra-google-google_play_services

#Cleaning 
RUN apt-get clean
