# python2.7 のベースイメージを使用
FROM python:2.7-slim

# 必要なパッケージのインストール
RUN apt-get update && apt-get install -y \
    build-essential \
    gcc \
    make \
    git \
    build-essential \
    libssl-dev \
    zlib1g-dev \
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev \
    wget \
    curl \
    && rm -rf /var/lib/apt/lists/*

# 必要な python modules のinstall
RUN pip install numpy cython matplotlib pandas scipy ipykernel

# class のインストール
RUN git clone https://github.com/lesgourg/class_public.git class \
    && cd class \
    && make all \
    && cd python \
    && python setup.py build \
    && python setup.py install

WORKDIR /workspace

CMD ["bash"]
