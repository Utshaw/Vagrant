apt-get update
apt-get upgrade
apt-get install -y apache2
# Enable Apache Mods
a2enmod rewrite
echo $(LANG=en_us_88591; date +"%D  %H:%M:%S") >> /vagrant_data/test.txt
