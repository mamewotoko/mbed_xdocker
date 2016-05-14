mbed_xdocker: mbed sample app built by make on Docker [![Build Status](https://travis-ci.org/mamewotoko/mbed_xdocker.svg?branch=master)](https://travis-ci.org/mamewotoko/mbed_xdocker)
=====================================================

How to build docker container
-----------------------------
1. edit imagefile/Makefile.config
  * TARGET: target chip name (e.g. LPC1768)
  * MBEDPATH: path where mbed is mounted as usb storage (optional)
1. docker image named mbed is created

    ```
    sh build.sh
    ```
How to run (how to build mbed app)
----------------------------------
2. start docker in this directory

    ```
    docker run -it -v $PWD:/build mbed bash
    ```
3. build sample app

    ```
    cd samples/hello_app
    make
    ```
4. hello.bin file is craeted in bin directory, copy it to mbed
5. reset mbed, then LED1 will blink

Inside container
----------------

```
 /mbxc/Makefile.config: make file config
 /opt
   mbed: mbed SDK
   gcc-arm-none-eabi-4_7-2012q4: TOOLCHAIN_PATH
 /build
   
```

Files in app project
--------------------
* Makefile
  * include /mbxc/Makefile.config
* bin: final .bin file is located
* build: .o, elf files are located
* src: source code

TODO
----
* create command like rpxc
* do not build as root, use host user
* separate repository of hello_app
* ethernet sample, USB sample
* create starbord orange library
   * some libraries are contained in mbed (SD, FATFileSystem ...)
* create more sophisticated Makefile
   * make subdir under build directory automatically
* build SDFileSystem, FAT using build.py

Reference
---------
* https://github.com/mamewotoko/mbed_app
  * dockerized
* http://mbed.org/handbook/mbed-tools
* [mbed LPC1768](https://developer.mbed.org/platforms/mbed-LPC1768/)
* [StarBoard Orange](http://mbed.org/cookbook/StarBoard-Orange)

----
Takashi Masuyama < mamewotoko@gmail.com >  
http://mamewo.ddo.jp/
