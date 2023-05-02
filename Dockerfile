FROM centos:centos7

RUN yum install java-11-openjdk wget -y

WORKDIR /opt

RUN wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.74/bin/apache-tomcat-9.0.74.tar.gz --no-check-certificate \
    && tar -xvzf apache-tomcat-9.0.74.tar.gz \
    && mv apache-tomcat-9.0.74 tomcat9
COPY target/myweb-8.2.2-SNAPSHOT.war tomcat9/webapps/myweb.war
CMD ["/opt/tomcat9/bin/catalina.sh", "run"]

 
