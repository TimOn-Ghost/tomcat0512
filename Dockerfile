FROM ubuntu:18.04
ENV DEBIAN_FRONTEND=noninteractive
WORKDIR /opt/app
RUN apt update
RUN apt install default-jdk -y
RUN apt install tomcat9 -y
RUN apt install maven -y
RUN apt install git -y
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
RUN cd  boxfuse-sample-java-war-hello
RUN mvn package
RUN cp hello-1.0.war /var/lib/tomcat9/webapps/
RUN mvn clean package -DskipTests
EXPOSE 8080
