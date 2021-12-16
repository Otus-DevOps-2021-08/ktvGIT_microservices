FROM python:3.6.0-alpine
# FROM python:3.6.0-alpine3.8
# FROM python:slim-buster
WORKDIR /app
ADD . /app
RUN pip install --upgrade pip
RUN pip install -r /app/requirements.txt
RUN apk update
RUN apk  add gcc
RUN apk add musl-dev
RUN pip3 install py-zipkin
RUN pip3 install flask==0.12.3
ENV POST_DATABASE_HOST post_db
ENV POST_DATABASE posts
CMD ["python3", "post_app.py"]
