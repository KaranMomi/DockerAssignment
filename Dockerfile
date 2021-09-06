FROM python:3.7-alpine
COPY target/*.py /tmp/hello.py
WORKDIR /tmp
CMD [ "python", "-c", "print('hello !')"]
