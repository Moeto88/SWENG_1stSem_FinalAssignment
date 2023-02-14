# start by pulling the python image
FROM python:3.8-alpine

# copy the requirements file into the image
COPY ./requirements.txt /sweng_test/requirements.txt

# switch working directory
WORKDIR /sweng_test

RUN ls

# install the dependencies and packages in the requirements file
RUN apt-get update && apt-get install -y \
    libgeos-dev

RUN pip install -r requirements.txt

# copy every content from the local file to the image
COPY . /sweng_test

# configure the container to run in an executed manner
ENTRYPOINT [ "python" ]