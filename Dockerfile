FROM continuumio/miniconda3

WORKDIR /sweng_test

SHELL ["/bin/bash", "--login", "-c"]

COPY environment.yml .
RUN conda env create -f environment.yml

RUN conda init bash

RUN conda activate env

COPY requirements.txt requirements.txt

RUN pip install -r requirements.txt

COPY . .

RUN export FLASK_APP=setup.py

RUN python -c "import flask"

CMD [ "python", "-m" , "flask", "run", "--host=0.0.0.0"]
