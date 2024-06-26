FROM  centos:latest
MAINTAINER vschowdary1985@gmail.com
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum install -y httpd \
 zip\
 unzip
ADD  https://www.tooplate.com/download/2137_barista_cafe /var/www/html/
WORKDIR /var/www/html/
RUN cp 2137_barista_cafe cafe.zip
RUN rm 2137_barista_cafe
RUN  unzip cafe
RUN  cp -rvf 2137_barista_cafe/* .
RUN rm -rf 2137_barista_cafe cafe.zip
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80
