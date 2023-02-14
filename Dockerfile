FROM continuumio/miniconda3

WORKDIR /sweng_test

COPY environment.yml .
RUN conda env create -f environment.yml
RUN conda activate env

COPY requirements.txt requirements.txt

RUN pip install -r requirements.txt

COPY . .

RUN export FLASK_APP=setup.py

CMD [ "python", "-m" , "flask", "run", "--host=0.0.0.0"]
