https://blog.csdn.net/weixin_42277529/article/details/126641660

# 一、 Ipopt 安装
（注意：后面有直接命令安装ipopt的教程。。。经过测试使用该源码安装方法安装的ipopt在使用一段时间后可能出现报错无法求解情况。。。求稳建议直接采用命令安装（二、命令行安装））
## 1. 安装依赖
```bash
sudo apt-get install gcc g++ gfortran git patch wget pkg-config liblapack-dev libmetis-dev
```
## 2. 创建一个专属目录方便管理
```bash
mkdir ~/Ipopt_pkg
cd Ipopt_pkg
```

## 2. 安装ASL
```bash
git clone https://github.com/coin-or-tools/ThirdParty-ASL.git
cd ThirdParty-ASL
sudo ./get.ASL
sudo ./configure
sudo make
sudo make install
```
## 3. 安装.BLAS 和LAPACK
```bash
 sudo apt-get install libblas-dev 
 sudo apt-get install liblapack-dev 
```
## 4. 安装HSL
这个安装需要两个步骤，注意！第一步你可能要多动动小手。

* a. 下载coinhsl文件(这个文件可以在其他地方下，不过我不建议，因为懒得找)   
链接：https://pan.baidu.com/s/1BfGxoH-ReSBS1dphB9n-tQ   
提取码：oc8a   
* b. 安装
```bash
 git clone https://github.com/coin-or-tools/ThirdParty-HSL.git
 cd ThirdParty-HSL
 #注意这里要把步骤a.的文件coinhsl解压拷贝到ThirdParty-HSL目录下再执行下面的命令
sudo ./configure
sudo make
sudo make install
```
## 5. 安装MUMPS
```bash
git clone https://github.com/coin-or-tools/ThirdParty-Mumps.git
cd ThirdParty-Mumps
sudo ./get.Mumps
sudo ./configure
sudo make
sudo make install
```
## 6. 安装Ipopt
```bash
git clone https://github.com/coin-or/Ipopt.git
cd Ipopt
mkdir build
cd build
sudo ../configure
sudo make
sudo make test
sudo make install
```
## 7. 完善环境1.0
```bash
sudo mkdir /usr/local/include/coin
sudo cp /usr/local/include/coin-or/* /usr/local/include/coin -rf
```
## 8. 完善环境2.0
```bash
sudo ln -s /usr/local/lib/libcoinmumps.so.3 /usr/lib/libcoinmumps.so.3
sudo ln -s /usr/local/lib/libcoinhsl.so.2 /usr/lib/libcoinhsl.so.2
sudo ln -s /usr/local/lib/libipopt.so.3 /usr/lib/libipopt.so.3
```
完成安装

# 二、直接拉取本仓库
```bash
git clone https://gitee.com/YaoDecheng/ipopt_install.git
```
运行安装脚本  
```bash
./ipopt_install.sh
```

# 三、命令行安装
这种方法与前两种不兼容，注意把环境清理干净
```bash
sudo apt-get install coinor-libcoinmp-dev 
```
安装完成后编译工程会报一个错误，可以通过如下操作修复：  
sudo vim /usr/include/coin/IpSmartPtr.hpp  
```c++
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
```
