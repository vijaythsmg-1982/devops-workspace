FROM ubuntu:latest
WORKDIR /app
COPY . .
RUN apt update -y \
&& apt install maven -y
RUN mvn clean package
