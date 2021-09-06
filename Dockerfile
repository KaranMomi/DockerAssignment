FROM python:3.7-alpine
COPY *.py /tmp/hello.py
WORKDIR /tmp
CMD [ "python", "hello.py"]
