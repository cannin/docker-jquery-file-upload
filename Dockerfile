FROM ubuntu:16.04
MAINTAINER cannin

# Basic packages
RUN apt-get update; apt-get upgrade -y
RUN apt-get install -y htop git wget nano links

# Install supervisord
RUN apt-get install -y supervisor

# Install Apache
RUN apt-get install -y php7.0-gd php-pear libapache2-mod-php7.0 apache2 apache2-utils php-apcu

# Install jQuery-File-Upload/
RUN git clone https://github.com/blueimp/jQuery-File-Upload.git /var/www/upload
ADD jquery-file-upload/index.html /var/www/upload/index.html

# Configure apache
ADD php/php.ini /etc/php/7.0/apache2/php.ini
ADD apache/apache2.conf /etc/apache2/apache2.conf
ADD apache/000-default.conf /etc/apache2/sites-available/000-default.conf
RUN chmod 777 /var/www/upload/server/php/files

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 80
CMD ["/usr/bin/supervisord"]
