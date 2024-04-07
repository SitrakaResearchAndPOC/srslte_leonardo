# srslte_leonardo (ubuntu 20.04)

# INSTALLING MATLAB
```
setxkbmap fr
```
Copy MATLAB File </br>
extract crack in DOWNLOADS/MATLAB : MATLAB_R2018b_Linux64_Crack.zip </br>
Create directory MATLABLIC </br>
Copy all crack file in MATLABLIC </br>
```
sudo su
```
```
mkdir MATLAB
```
```
cd MATLAB
```
```
mkdir INSTALL
```
open the two file using diskimager : </br>
utf-8''r2018b_glnxa64_dvd1.iso </br>
utf-8''r2018b_glnxa64_dvd2.iso </br>
</br>
Mounting point is : /media/nom_session/nom_dvd </br>
for me : name_session it's leonardo et name_dvd c'est MATHWORKS_R2018B et MATHWORKS_R2018B1 </br>
</br>
```
mkdir INSTALL
```
```
cp -rf /media/leonardo/MATHWORKS_R2018B/* INSTALL
```
```
cp -r /media/leonardo/MATHWORKS_R2018B1/* INSTALL
```
```
cd INSTALL
```
```
bash install
```

Enter the right key : </br>
For me , it's : 
```
09806-07443-53955-64350-21751-41297
```
```
1) standalone:
- Install choosing the option "Use a File Installation Key" and supply the following FIK
	09806-07443-53955-64350-21751-41297
- To install Matlab Production Server,using this
	40236-45817-26714-51426-39281
- Use license_standalone.lic to activate,
  or copy license_standalone.lic to %installdir%\licenses\ ,and run matlab without activation
- after the installation finishes copy the folders to %installdir% to overwriting the originally installed files

2) floating license (network license server):
- Install choosing the option "Use a File Installation Key" and supply the following FIK
	31095-30030-55416-47440-21946-54205
- To install Matlab Production Server,using this
	57726-51709-20682-42954-31195
- Use license_server.lic when asked
- after the installation finishes copy the folders to %installdir% to overwriting the originally installed files
```
INSTALLATION FILE IS IN : /usr/local/MATLAB/R2018b </br>
use this command for changing path : 
```
cd /usr/local/MATLAB/R2018b/bin
```

Copy the licence key : 
```
cd /home/leonardo/Downloads/MATLAB
```
```
cp MATLABLIC/license_standalone.lic /usr/local/MATLAB/R2018b/bin/
```
Copy the crack : 
```
cp -rf  MATLABLIC/R2018b/bin/glnxa64/* /usr/local/MATLAB/R2018b/bin/glnxa64/
```
```
cd /usr/local/MATLAB/R2018b/bin
```
#ln -s /usr/local/MATLAB/R2018b/bin/matlab /home/fnmg/Desktop/matlab

# INSTALLING DEPENDENCIES
```
apt update
```
```
sudo apt-get install build-essential cmake libfftw3-dev libmbedtls-dev libboost-program-options-dev libconfig++-dev libsctp-dev  
```
```
apt install python3-pip
```
```
apt install git
```
```
pip3 install mako
```
```
sudo apt install git cmake g++ libboost-all-dev libgmp-dev swig python3-numpy python3-mako python3-sphinx python3-lxml doxygen libfftw3-dev libsdl1.2-dev libgsl-dev libqwt-qt5-dev libqt5opengl5-dev python3-pyqt5 liblog4cpp5-dev libzmq3-dev python3-yaml python3-click python3-click-plugins python3-zmq python3-scipy python3-gi python3-gi-cairo gobject-introspection gir1.2-gtk-3.0 build-essential libusb-1.0-0-dev python3-docutils python3-setuptools python3-ruamel.yaml python-is-python3
```
```
sudo apt install libtinfo5 libncurses5
```
```
apt-get  install curl wget zip
```

## Installing UHD
```
git clone -b "UHD-4.0" https://github.com/EttusResearch/uhd
```
```
cd uhd/host/
```
```
mkdir build
```
```
cd build
```
```
cmake ..
```
```
make -j$(nproc --ignore=1)
```
```
make install
```
```
ldconfig
```
```
cd ../../..
```

## Installing opencells simcard
```
curl https://open-cells.com/d5138782a8739209ec5760865b1e53b0/uicc-v3.2.tgz > uicc-v3.2.tgz
```
or using : 
```
wget https://open-cells.com/d5138782a8739209ec5760865b1e53b0/uicc-v3.2.tgz
```
Compiling  : 
```
tar -xvf uicc-v3.2.tgz
```
```
cd uicc-v3.2
```
```
make clean
```
```
make 
```
```
./program_uicc --help
```
```
cd ..
```
```
curl -L https://github.com/srsran/srsRAN_4G/archive/refs/tags/release_23_04.tar.gz > srsRAN_23_04.tar.gz
```
```
tar -xvf srsRAN_23_04.tar.gz
```
```
cd srsRAN_4G-release_23_04/
```
```
mkdir build
```
```
cd build
```
```
cmake ..
```
```
make -j$(nproc --ignore=1)
```
```
make test
```
```
make install
```
```
ldconfig
```

# Programming SIMCARD

```
cd uicc-v3.2
```
Please replace xxxxxxxx by 0c010955 </br>
RQ : More information about parmeters of program_uicc please check this [github](https://github.com/SitrakaResearchAndPOC/fork_program_uicc) and [youtube](https://www.youtube.com/watch?v=nfTzATOZd_s)
```
sudo ./program_uicc --adm xxxxxxxx --imsi 208920100001101 --isdn 00000001 --acc 0001 --key 6874736969202073796d4b2079650a73 --opc 504f20634f6320504f50206363500a4f -spn "OpenCells01" --authenticate 
```
Configure the apn of phone as : OpenCells01

```
exit
```

# Creating the configuration
```
mkdir -rf /root/.config
```
```
mkdir -rf /root/.config/srsran
```
```
wget https://raw.githubusercontent.com/SitrakaResearchAndPOC/srslte_leonardo/main/srsran_config.zip
```
```
unzip srsran_config.zip
```
```
cp srsran/* /root/.config/srsran
```
```
exit
```

# Sharing Internet
Open terminal </br>
Find the name of the interface having internet, let name it <name_interface>
```
ifconfig
```
```
cd srsRAN../epc
```
```
sudo ./srsepc/srsepc_if_masq.sh name_interface
```
# Preparing launching LTE
```
uhd_images_downloader
```

# Launching LTE
```
srsepc
```
Tape ctrl+shift+T
```
srsenb
```


# Link
* [uhd](https://www.linkedin.com/pulse/installation-uhd-40-gnu-radio-38-rfnoc-ubuntu-2004-murthy-s)
* [leonardo](https://blog.leonardotamiano.xyz/tech/build-your-own-4g-network/)



