init:
	sudo apt-get install default-jre
	sudo apt-get install default-jdk
	sudo apt-get install openjdk-7-jre
	sudo apt-get install openjdk-7-jdk
	sudo apt-get install osmosis
	sudo apt-get install osmctools
	mkdir ~/.cache/graphhopper/ -p

download:
	./scripts/download.sh

setup:
	./scripts/setup.sh

start:
	./scripts/start.sh
