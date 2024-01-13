FROM python:3.11-slim-buster

RUN apt-get install gcc python3-dev \ 
    && pip install -U \
    pip \
    setuptools \
    wheel

WORKDIR /project

RUN useradd -m -r app && \
    chown app /project

COPY requirements.txt ./
RUN pip install -U -r requirements.txt

COPY . .

USER app

ARG GIT_HASH
ENV GIT_HASH=${GIT_HASH:-dev}

