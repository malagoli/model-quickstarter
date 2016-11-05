FROM java:8

MAINTAINER  Davide Malagoli <malagoli@gmail.com>

RUN apt-get update && apt-get install -y \
    maven git

RUN git clone git://github.com/dbpedia/extraction-framework.git
RUN cd extraction-framework; mvn install

RUN git clone --depth 1 https://github.com/dbpedia-spotlight/dbpedia-spotlight.git
RUN cd dbpedia-spotlight; mvn -T 1C -q clean install

RUN git clone --depth 1 https://github.com/jodaiber/wikistatsextractor
RUN cd wikistatsextractor; mvn install

COPY . /opt/
WORKDIR /opt/
RUN ./prepare.sh


