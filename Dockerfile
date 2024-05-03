FROM  centos:latest
MAINTAINER vschowdary1985@gmail.com
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum install -y httpd \
 zip\
 unzip
ADD https://www.free-css.com/free-css-templates/page296/OxerFreeWebsiteTemplate-Free-CSS.com.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip OxerFreeWebsiteTemplate-Free-CSS.com.zip
RUN cp -rvf oxer/* .
RUN rm -rf oxer oxer.zip
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80
