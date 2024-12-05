FROM ubuntu:18.04
ENV DEBIAN_FRONTEND=noninteractive
WORKDIR /opt/app
RUN apt update
RUN apt install default-jdk -y
RUN apt install tomcat9 -y
RUN apt install maven -y
RUN apt install git -y
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
WORKDIR /opt/app/boxfuse-sample-java-war-hello
RUN mvn package
WORKDIR /var/lib/tomcat9/webapps/
RUN cp /opt/app/boxfuse-sample-java-war-hello/target/hello-1.0.war ./
EXPOSE 8080
CMD /usr/share/tomcat9/bin/catalina.sh run