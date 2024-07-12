# srslte_leonardo (ubuntu 20.04)

# INSTALLING MATLAB
```
setxkbmap fr
```
# INSTALLING PSENSOR
```
sudo su
```
```
apt update
```
```
apt install lm-sensors
```
```
sensors-detect
```
```
apt install psensor
```

```
exit
```
  
# INSTALLING MATLAB 2018
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
Mounting point is : /media/name_session/name_dvd </br>
for me : name_session it's dast et name_dvd are MATHWORKS_R2018B et MATHWORKS_R2018B1 </br>
```
cp -rf /media/$SUDO_USER/MATHWORKS_R2018B/* INSTALL
```
```
cp -rf /media/$SUDO_USER/MATHWORKS_R2018B1/* INSTALL
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
wget https://raw.githubusercontent.com/SitrakaResearchAndPOC/MATLAB_R2018b_Linux64_Crack/main/MATLAB_R2018b_Linux64_Crack.zip
```
```
unzip MATLAB_R2018b_Linux64_Crack.zip
```
```
mv 'MATLAB R2018b Linux64 Crack' MATLABLIC
```
```
cp MATLABLIC/license_standalone.lic /usr/local/MATLAB/R2018b/bin/
```
```
cp -rf  MATLABLIC/R2018b/bin/glnxa64/* /usr/local/MATLAB/R2018b/bin/glnxa64/
```
```
cd /usr/local/MATLAB/R2018b/bin/
```
```
./matlab
```
Find the certificate at /usr/local/MATLAB/R2018b/bin/ as license_standalone.lic </br>
create bash scripting for matlab
#ln -s /usr/local/MATLAB/R2018b/bin/matlab /home/fnmg/Desktop/matlab
```
exit
```
```
sudo su
```
```
nano matlab.sh
```
create and save 
```
#!/bin/sh
echo "launching matlab 2018"
cd /usr/local/MATLAB/R2018b/bin/
./matlab
```
```
chmod +x matlab.sh
```
# INSTALLING DEPENDENCIES
```
sudo su
```
```
apt update
```
```
apt-get install build-essential cmake libfftw3-dev libmbedtls-dev libboost-program-options-dev libconfig++-dev libsctp-dev  
```
```
apt-get install python3-pip
```
```
apt-get install git
```
```
pip3 install mako
```
```
apt-get install git cmake g++ libboost-all-dev libgmp-dev swig python3-numpy python3-mako python3-sphinx python3-lxml doxygen libfftw3-dev libsdl1.2-dev libgsl-dev libqwt-qt5-dev libqt5opengl5-dev python3-pyqt5 liblog4cpp5-dev libzmq3-dev python3-yaml python3-click python3-click-plugins python3-zmq python3-scipy python3-gi python3-gi-cairo gobject-introspection gir1.2-gtk-3.0 build-essential libusb-1.0-0-dev python3-docutils python3-setuptools python3-ruamel.yaml python-is-python3
```
```
apt-get install libtinfo5 libncurses5
```
```
apt-get  install curl wget zip net-tools
```

## Testing MATALAB CODE
```
cd /usr/local/MATLAB/R2018b/bin
```
```
wget https://raw.githubusercontent.com/SitrakaResearchAndPOC/srslte_leonardo/main/FinalCodeRAJO.zip
```
```
unzip FinalCodeRAJO.zip
```
run matlab by 
```
./matlab
```
ON MATLAB got to : FinalCodeRAJO </br></br>
TEST ON MATLAB </br>
RQ : you could use ctrl+Y to paste on matlab
getting key
```
getting_key()
```
For plotting key with index_in = 1 for 256 bits
```
plotting_key256(1)
```
For plotting key with index_in = 1 for 512 bits
```
plotting_key512(1)
```
RQ : Before imshow, use conversion uint8
```
testing_inversibility_chaotic_ANN_Substitution
```
```
testing_inversibility_chaotic_HamiltonianPermutation
```
Plotting result : 
```
plotting_full_matrix_result1
```
```
plotting_full_matrix_result2
```
Plotting key result : 
```
plotting_key_evaluation(10, '-')
```
or
```
plotting_key_evaluation(10, '--')
```
or
```
plotting_key_evaluation(10, ':')
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
# Installing driver bladerf : 
```
git clone https://github.com/Nuand/bladeRF.git
```
```
cd bladeRF
```
```
mkdir build
```
```
cd build
```
```
cmake ../
```
```
make
```
```
make install
```
```
ldconfig
```
```
cd ../..
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
## Installing srsRAN
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
```
cd ../..
```

# On linux : Programming SIMCARD

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
# On windows, use grsim 
[gr_sim](https://github.com/SitrakaResearchAndPOC/srslte_leonardo/blob/main/GRSIMWrite-3.10%20.zip) </br>
unzip and lauch GRSIMWrite.exe </br>
Download the config at [sim_config](https://github.com/SitrakaResearchAndPOC/srslte_leonardo/blob/main/sim_srslte.grsp) </br>
Click loadData and select sim_srslte.grsp </br>
Plug the simwrite </br>
Click Refresh </br>
Click writeData </br>

# INSTALLING CPU-POWER
```
apt update
```
Installing CPUPOWER
```
cpupower
```
```
apt-get install linux-tools-common
```
```
apt-get install linux-tools-generic
```
(installing also linux-tools-<number-proposed>-tools-generic by taping command cpupower)
```
cpupower frequency-set -g performance 
```

# Creating the configuration
```
sudo su
```
```
mkdir -p /root/.config
```
```
mkdir -p /root/.config/srsran
```
```
rm -rf /root/.config/srsran/*
```
* For USRP : config
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

* For BladeRF : config
```
wget https://raw.githubusercontent.com/SitrakaResearchAndPOC/srslte_leonardo/main/srsran_config_bladerf.zip
```
```
rm -rf srsran
```
```
rm -rf /root/.config/srsran/*
```
```
unzip srsran_config_bladerf.zip
```
```
cp srsran/* /root/.config/srsran
```
```
wget https://raw.githubusercontent.com/SitrakaResearchAndPOC/srslte_leonardo/main/script_srs.zip
```
```
unzip script_srs.zip
```
```
cp -rf script_srs/SCRIPT_SRS/home/*.sh ../$SUDO_USER
```
```
exit
```
# Preparing launching LTE
Before launching, reboot if necessary
```
uhd_images_downloader
```
```
exit
```


# Launching LTE
```
sudo su
```
```
bash srsepc.sh
```
Tape ctrl+shift+T
```
bash srsenb.sh
```
```
if config
```
find <interface>
```
bash srsepc_if_masq.sh <interface>
```


RQ : Error time burst </br>
* The USB doesn't detect USB3.0 </br>
* The processing is no enough </br>
* The configuration is bad indeed about device argument and references clock of equipement </br>

# Link
* [uhd](https://www.linkedin.com/pulse/installation-uhd-40-gnu-radio-38-rfnoc-ubuntu-2004-murthy-s)
* [leonardo](https://blog.leonardotamiano.xyz/tech/build-your-own-4g-network/)
* [hackmd](https://hackmd.io/@4G7xxurNQEGA3Apb11YQJg/H1GJsHt9o)
* [cyberloginit](https://cyberloginit.com/2018/05/03/build-a-lte-network-with-srslte-and-program-your-own-usim-card.html)
* [ilabt](https://doc.ilabt.imec.be/ilabt/wilab/tutorials/usrp_b200.html)
* [tenettech](https://blogspot.tenettech.net/2019/10/17/validation-of-4g-lte-using-software-defined-radio/)
* [zhixun-wireless](http://zhixun-wireless.top/install-and-configure-srslte-enb-epc-on-ubuntu)
* [nickvsnetworking](https://nickvsnetworking.com/srslte-install-for-bladerf-limesdr-on-debian-ubuntu/)
* [programmersought](https://programmersought.com/article/84496400694/)
* [radioactive](https://band.radio/srsLTE)  
* [matlab_hash_used](https://github.com/paulchen2713/SHA3)
* [matlab_hash_ref](https://www.mathworks.com/matlabcentral/fileexchange/31795-sha-algorithms-160-224-256-384-512)	

