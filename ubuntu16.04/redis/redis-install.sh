sudo apt-get update
sudo apt-get install build-essential tcl

#DOWNLOAD REDIS SOURCE STABLE
 cd /tmp
curl -O http://download.redis.io/redis-stable.tar.gz
tar xzvf redis-stable.tar.gz
cd redis-stable

#make test
sudo make install
sudo mkdir /etc/redis
#COPYNG REDIS AS A SERVICE CONFIG
sudo cp ./redis-ass.conf /etc/redis

#REDIS AS A SERVICE
sudo cat redis-service.txt | sudo tee /etc/systemd/system/redis.service

# ADDING REDIS USER AND GIVING PERMISSIONS TO FOLDER
sudo adduser --system --group --no-create-home redis
sudo mkdir /var/lib/redis
sudo chown redis:redis /var/lib/redis
sudo chmod 770 /var/lib/redis

# REDIS START AND STATUS
sudo systemctl start redis
sudo systemctl status redis
