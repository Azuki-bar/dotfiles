FROM ubuntu:22.04 as builder
ENV LANG=ja_JP.UTF-8
ENV PATH=/root/.deno/bin/:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
WORKDIR /root
RUN apt-get update && \
  apt-get install -y \
    build-essential \
    curl \
    fd-find \
    gcc \
    git \
    python3 \
    python3-pip \
    unzip

ADD https://deb.nodesource.com/setup_current.x /setup_current.x
RUN bash /setup_current.x
RUN apt-get install -y nodejs
ADD https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.deb nvim-linux64.deb
ADD https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep_13.0.0_amd64.deb ripgrep.deb

RUN apt-get -y install ./nvim-linux64.deb ./ripgrep.deb

ADD https://deno.land/install.sh deno-install.sh
RUN chmod +x ./deno-install.sh
RUN ./deno-install.sh

RUN pip3 install neovim
RUN git clone https://github.com/Azuki-bar/dotfiles.git
RUN ./dotfiles/nvim/link_conf.sh
CMD ["nvim"]
