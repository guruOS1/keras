FROM tensorflow/tensorflow:latest-gpu

ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get -y update && \
    apt-get install -y build-essential cmake git unzip \
    pkg-config libopenblas-dev liblapack-dev \
    python-numpy python-scipy python-matplotlib python-yaml \
    libhdf5-serial-dev python-h5py \
    graphviz python-opencv \
    && \
    apt-get clean

RUN pip3 install pydot-ng keras

RUN apt-get install -y jupyter-notebook git && apt-get clean

EXPOSE 8888

WORKDIR /data

RUN git clone --depth 1 https://github.com/fchollet/deep-learning-with-python-notebooks.git

CMD jupyter-notebook --port=8888 --ip=0.0.0.0 --allow-root
