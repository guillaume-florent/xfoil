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

RUN install_packages git gfortran

# Get the code and move the code to /opt/xfoil and erase the rest
RUN mkdir /opt/xfoil_download
WORKDIR /opt
ADD https://api.github.com/repos/guillaume-florent/xfoil/git/refs/heads/master version.json
RUN git clone https://github.com/guillaume-florent/xfoil && mv /opt/xfoil_download/xfoil/XFoil /opt/xfoil && rm -r /opt/xfoil_download

# Compile
WORKDIR /opt/xfoil/bin
RUN make osgen && make osmap.o

WORKDIR /opt/xfoil
RUN ./bin/osgen osmaps_ns.lst

WORKDIR /opt/xfoil/bin
RUN make xfoil && make pplot && make pxplot && make clean

WORKDIR /opt/bin
RUN ln -s /opt/xfoil/runs/xfoil xfoil

CMD ["/bin/bash"]