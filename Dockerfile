FROM debian

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Kiev
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt update && apt-get install -y \
    automake build-essential git libbsd-dev libedit-dev \
    libevent-dev libgmp-dev libgmpxx4ldbl libpcre3-dev \
    libssl-dev libtool libxml2-dev libyaml-dev \
    lld llvm llvm-dev


RUN git clone -b v8.0.6 https://github.com/ivmai/bdwgc.git && \
    cd bdwgc && \
    git clone https://github.com/ivmai/libatomic_ops.git && \
    /autogen.sh && \
    ./configure && \
    make -j && \
    make check \ 
    make install


