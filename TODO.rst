Dockerization
-------------

******** Start from a small footprint Linux Docker image -> minideb ?
******** git clone --depth=1 <remote repo url>
******** Use tmp instead of opt (the executables end up in /usr/bin/)
******** Executables (BINDIR in makefiles) should go to /usr/local/bin
******** Where do .a files go on a Linux system? -> /usr/local/lib
******** Makefile cleanup and simplification
******** install and start scripts