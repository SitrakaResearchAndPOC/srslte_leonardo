setxkbmap fr

extract KEY IN DOWNLOADS : MATLAB_R2018b_Linux64_Crack.zip
Create DIRECTORY MATLABLIC
COPY ALL FILE CRACK IN MATLABLIC

sudo su
mkdir MATLAB
cd MATLAB
mkdir INSTALL

open the two file using diskimager : 
utf-8''r2018b_glnxa64_dvd1.iso
utf-8''r2018b_glnxa64_dvd2.iso

Mounting point is : /media/nom_session/nom_dvd
for me : nanme_session it's leonardo et name_dvd c'est MATHWORKS_R2018B et MATHWORKS_R2018B1



mkdir install
cp -rf /media/leonardo/MATHWORKS_R2018B/* INSTALL
cp -r /media/leonardo/MATHWORKS_R2018B1/* INSTALL

cd INSTALL
bash install

entrée la clé adequate : 
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



INSTALLTION FIL IS IN : /usr/local/MATLAB/R2018b
cd /usr/local/MATLAB/R2018b/bin


COPY THE LICENCE KEY : 
cd /home/leonardo/Downloads/MATLAB
cp MATLABLIC/license_standalone.lic /usr/local/MATLAB/R2018b/bin/

COPY THE CRACK : 
cp -rf  MATLABLIC/R2018b/bin/glnxa64/* /usr/local/MATLAB/R2018b/bin/glnxa64/


cd /usr/local/MATLAB/R2018b/bin

#ln -s /usr/local/MATLAB/R2018b/bin/matlab /home/fnmg/Desktop/matlab


cp code /usr/local/MATLAB/R2018b/bin

