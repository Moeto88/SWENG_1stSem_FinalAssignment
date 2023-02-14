# syntax=docker/dockerfile:1

FROM python:3.10-alpine

WORKDIR /sweng_test

COPY requirements.txt requirements.txt

RUN pip install -r requirements.txt

COPY . .

RUN export FLASK_APP=setup.py

CMD [ "python", "-m" , "flask", "run", "--host=0.0.0.0"]
