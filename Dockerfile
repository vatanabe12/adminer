FROM ubuntu:16.04

RUN apt update -y &&  apt install wget -y

RUN apt install adminer -y 

RUN wget "http://www.adminer.org/latest.php" -O /usr/share/adminer/latest.php

RUN ln -s /usr/share/adminer/latest.php /usr/share/adminer/adminer.php

RUN echo "Alias /adminer.php /usr/share/adminer/adminer.php" | tee /etc/apache2/conf-available/adminer.conf

RUN a2enconf adminer.conf

CMD /usr/sbin/apache2ctl -D FOREGROUND 
