#Get Node Setup
sudo apt-get install curl -y
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -

#Install Node
sudo apt-get update
sudo apt-get install nodejs git

#Install App
cd /var/
git clone https://github.com/ntaheij/itrr-ubuntu.git
cp -a /var/testapp /var/itrr
rm -r /var/testapp

#Create Startup File
echo "cd /var/itrr && sudo nohup node itrr.js" > /etc/init.d/itrr.sh

#Add to Startup
chmod +x /etc/init.d/itrr.sh
sudo update-rc.d itrr.sh defaults

#Execute
cd /var/itrr
sudo npm install
sudo nohup node itrr.js