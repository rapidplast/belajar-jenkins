FROM centos:7
# RUN yum -y update
RUN yum -y install httpd

RUN yum install epel-release yum-utils -y \
    && yum -y install http://rpms.remirepo.net/enterprise/remi-release-7.rpm \
    && yum-config-manager --enable remi-php74 \
    && yum -y install php php-common php-opcache php-mcrypt php-cli php-gd php-curl php-mysql php-fpm php-mysqlnd php-mbstring php-xml php-json 

RUN sed -i 's/none/All/' /etc/httpd/conf/httpd.conf
RUN sed -i 's/None/All/' /etc/httpd/conf/httpd.conf
RUN sed -i 's/denied/granted/' /etc/httpd/conf/httpd.conf

RUN yum -y install nano

COPY . /var/www/html/

CMD ["/usr/sbin/init"]

EXPOSE 80
EXPOSE 443
