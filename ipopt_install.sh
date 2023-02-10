
sudo rm /usr/local/include/coin -rf

sudo apt-get install gcc g++ gfortran git patch wget pkg-config liblapack-dev libmetis-dev -y

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd ${DIR}/ThirdParty-ASL/ 
sudo ./configure 
# sudo make clean
sudo make 
sudo make install

cd ${DIR}/ThirdParty-HSL/
sudo ./configure
# sudo make clean 
sudo make 
sudo make install

cd ${DIR}/ThirdParty-Mumps/ 
sudo ./configure 
# sudo make clean
sudo make 
sudo make install

cd ${DIR}/Ipopt/
mkdir build
cd build
sudo ../configure 
# sudo make clean
sudo make 
sudo make test   
sudo make install

sudo mkdir /usr/local/include/coin
sudo cp /usr/local/include/coin-or/* /usr/local/include/coin -rf



#sudo apt-get install coinor-libipopt-dev  cppad
#sudo vim /usr/include/coin/IpSmartPtr.hpp

#define HAVE_CSTDDEF // 修改部分
#ifdef HAVE_CSTDDEF
# include <cstddef>
#else
# ifdef HAVE_STDDEF_H
#  include <stddef.h>
# else
#  error "don't have header file for stddef"
# endif
#endif
#undef HAVE_CSTDDEF // 修改部分





