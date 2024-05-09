FROM  centos:latest
MAINTAINER vschowdary1985@gmail.com
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum install -y httpd \
 zip\
 unzip
ADD  https://www.tooplate.com/download/2137_barista_cafe /var/www/html/
RUN mv 2137_barista_cafe cafe.zip
WORKDIR /var/www/html/
RUN  unzip cafe
RUN  cp -rvf 2137_barista_cafe/* .
RUN rm -rf 2137_barista_cafe cafe.zip
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80
