#!/bin/bash



# set up logfile

export LOGFILE=/home/vagrant/provision_script.log
su vagrant -c "touch $LOGFILE"



# Add postgis to list of trusted repositories
echo 'Adding postgis to list of trusted repositories...'
sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt trusty-pgdg main" >> /etc/apt/sources.list'
wget --quiet -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | apt-key add -
apt-get update -qy >> $LOGFILE
apt-get upgrade -qy >> $LOGFILE



# install apt packages

# echo 'Installing Firefox...'
# apt-get install -y firefox >> $LOGFILE
echo 'Installing PostgreSQL 9.5...'
apt-get install -qy postgresql-9.5-postgis-2.2 >> $LOGFILE
echo 'Installing pgadmin3...'
apt-get install -qy pgadmin3 >> $LOGFILE
echo 'Installing pgRouting 2.1...'
apt-get install -qy postgresql-9.5-pgrouting >> $LOGFILE
echo 'Installing Python for Postgres...'
apt-get install -qy postgresql-plpython3-9.5 >> $LOGFILE
echo 'Installing dos2unix...'
apt-get install -qy dos2unix >> $LOGFILE

echo 'Cleaning up APT...'
apt-get autoremove -qy >> $LOGFILE



# install stuff as vagrant user

su vagrant -c 'bash ~/proj/user_provision_script.sh'



# configure PostgreSQL

echo 'Creating vagrant user in PostgreSQL...'
su postgres -c "psql -c \"CREATE USER vagrant WITH CREATEUSER PASSWORD 'vagrant';\"" >> $LOGFILE

echo 'Creating vagrant database in PostgreSQL...'
su postgres -c 'psql -c "CREATE DATABASE vagrant;"' >> $LOGFILE

# echo 'Loading data into PostgreSQL...'
# su vagrant -c 'psql < proj/buildCrimeDataRaw.sql' >> $LOGFILE



echo 'Finished installing packages.'
echo 'Run the following line on your host machine:'
echo '$ vagrant plugin install vagrant-vbguest'

