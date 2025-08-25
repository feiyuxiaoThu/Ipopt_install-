# 安装 ipopt 和 casadi

首先运行安装 ipopt 相关

然后安装 casadi

```bash
git clone https://github.com/casadi/casadi.git
cd casadi
mkdir build
cd build
cmake .. -DWITH_IPOPT=ON -DWITH_EXAMPLES=OFF
make
sudo make install
```

参考：

1. [ubuntu上配置ipopt和casadi求解二次规划](https://seashore.top/Blog_ButterFly/2024/09/23/ubuntu%E4%B8%8A%E9%85%8D%E7%BD%AEipopt%E5%92%8Ccasadi%E6%B1%82%E8%A7%A3%E4%BA%8C%E6%AC%A1%E8%A7%84%E5%88%92/)
2. [Ipopt CasADi Installation](https://github.com/Hydrogen2000/Ipopt-CasADi-Installation)



