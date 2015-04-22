export USER_HOME=$(eval echo ~${SUDO_USER})
mkdir $USER_HOME"/.cache/graphhopper" -p

sudo apt-get install default-jre
sudo apt-get install default-jdk
sudo apt-get install openjdk-7-jre
sudo apt-get install openjdk-7-jdk
sudo apt-get install osmosis
sudo apt-get install osmctools

cd graphhopper
./graphhopper.sh clean
./graphhopper.sh build
