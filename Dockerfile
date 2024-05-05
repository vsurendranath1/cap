FROM  centos:latest
MAINTAINER vschowdary1985@gmail.com
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum install -y httpd \
 zip\
 unzip
ADD https://html5up.net/lens/download /var/www/html/
WORKDIR /var/www/html/
RUN unzip download.zip
RUN cp -rvf download/* .
RUN rm -rf download download.zip
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80
