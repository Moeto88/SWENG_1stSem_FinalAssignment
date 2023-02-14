FROM continuumio/miniconda:latest

WORKDIR /sweng_test

COPY . ./

RUN chmod +x boot.sh

RUN Conda env create -f environment.yml

RUN echo "source activate testForOS" &gt; ~/.bashrc
ENV PATH /opt/conda/envs/testForOS/bin:$PATH

EXPOSE 5000

ENTRYPOINT ["./boot.sh"]