******** Start from a small footprint Linux Docker image -> minideb ?
******** git clone --depth=1 <remote repo url>
******** Use tmp instead of opt (the executables end up in /usr/bin/)
******** Executables (BINDIR in makefiles) should go to /usr/local/bin
******** Where do .a files go on a Linux system? -> /usr/local/lib
******** Makefile cleanup and simplification
******** install and start scripts

Compile procedure
-----------------
See:
README
http://macoovacany.blogspot.fr/2013/01/compiling-xfoil-on-debian-squeeze.html
http://remmirath-en.blogspot.fr/2007/10/how-to-build-and-install-xfoil-on.html
https://giuseppeschettini.wordpress.com/2008/11/27/how-to-compile-xfoil-697-in-linux/

https://solarianprogrammer.com/2014/01/23/xfoil-mac-os-x/

Packages
--------
xorg-x11-devel

from https://ubuntuforums.org/showthread.php?t=288920  :

This can be solved by installing the following packages (not exactly sure which one solved it, but I installed them all for good measure.)

lapack3, lapack3-dev, lapack3-doc, refblas3, refblas3-dev, refblas3-doc
