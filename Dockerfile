FROM debian:stretch

RUN apt-get update

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y autoconf automake bash bison bzip2 \
                    cmake flex gettext git g++ intltool \
                    libffi-dev libtool libtool-bin libltdl-dev libssl-dev \
                    libxml-parser-perl make openssl patch perl \
                    pkg-config scons sed unzip wget xz-utils g++-multilib libc6-dev-i386 git htop unzip wget ruby gperf autopoint \
                    p7zip-full gliv gdk-pixbuf libgdk-pixbuf2.0-dev

RUN apt-get clean

RUN git clone https://github.com/mxe/mxe.git && cd mxe && make hdf4 hdf5 tiff qt5 gsl fftw cfitsio MXE_TARGETS=i686-w64-mingw32.shared JOBS=$(nproc)
