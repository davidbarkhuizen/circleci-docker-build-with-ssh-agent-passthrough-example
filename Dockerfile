FROM python:2.7

WORKDIR /tmp/docker_build

COPY requirements.txt .
RUN python -m pip install -r ./requirements.txt

ENTRYPOINT ["tail", "-f", "/dev/null"]