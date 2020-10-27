#Get Node Setup
sudo apt-get install curl -y
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -

#Install Node
sudo apt-get update
sudo apt-get install nodejs git

#Install App
cd /var/
git clone https://github.com/ntaheij/itrr-ubuntu.git
rm package-lock.json
cp -a /var/itrr-ubuntu /var/itrr
rm -r /var/itrr-ubuntu

#Create Startup File
cp -a /var/itrr/itrr-startup.sh /etc/init.d/itrr.sh
rm -r /var/itrr/itrr-startup.sh

#Add to Startup
chmod +x /etc/init.d/itrr.sh
cd /etc/init.d
sudo update-rc.d itrr.sh defaults 100
sudo update-rc.d itrr.sh enable

#Execute
cd /var/itrr
sudo npm install
sudo nohup node itrr.js </dev/null >/dev/null 2>&1 &

#Remove logs
rm wget-log