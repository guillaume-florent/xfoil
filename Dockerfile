#################################################
#
# Build :
# docker build --tag xfoil:6.99 .
#
# Run :
# xhost +
# home="${1:-$HOME}"
# docker run -ti -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix --volume="${home}:${home}" xfoil:6.99
# or
# docker run -ti xfoil:6.99
#
#################################################

FROM bitnami/minideb:stretch

RUN install_packages git gfortran ca-certificates make xorg-dev

# Get the code and move the code to /tmp/xfoil and erase the rest
RUN mkdir /tmp/xfoil_download
WORKDIR /tmp/xfoil_download
ADD https://api.github.com/repos/guillaume-florent/xfoil/git/refs/heads/master version.json
RUN git clone --depth=1 https://github.com/guillaume-florent/xfoil && \
    mv /tmp/xfoil_download/xfoil/Xfoil /tmp/xfoil && \
    rm -r /tmp/xfoil_download

# Compile
RUN cd /tmp/xfoil/orrs/bin && \
    make -f Makefile_DP osgen && \
    make -f Makefile_DP osmap.o && \
    cd /tmp/xfoil/orrs && \
    ./bin/osgen osmaps_ns.lst && \
    cd /tmp/xfoil/plotlib && \
    make && \
    cd /tmp/xfoil/bin && \
    make xfoil && \
    make pplot && \
    make pxplot && \
    make clean

CMD ["/bin/bash"]