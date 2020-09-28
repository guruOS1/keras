FROM tensorflow/tensorflow:latest-gpu

ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get -y update && \
    apt-get install -y build-essential cmake git unzip \
    pkg-config libopenblas-dev liblapack-dev \
    python3-numpy python3-scipy python3-matplotlib python3-yaml \
    libhdf5-serial-dev python3-h5py \
    graphviz python3-opencv \
    && \
    apt-get clean

RUN pip3 install pydot-ng keras

CMD ["python3"]
