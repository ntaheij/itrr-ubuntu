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
echo "cd /var/itrr && sudo nohup node itrr.js </dev/null >/dev/null 2>&1 &" > /etc/init.d/itrr.sh

#Add to Startup
chmod +x /etc/init.d/itrr.sh
sudo update-rc.d itrr.sh defaults
sudo update-rc.d itrr.sh enable

#Execute
cd /var/itrr
sudo npm install
sudo nohup node itrr.js </dev/null >/dev/null 2>&1 &

#Remove logs
rm wget-log