# Version 1.0.0
FROM ubuntu:14.10
MAINTAINER Mike Bartoli "michael.bartoli@pomona.edu"
EXPOSE 8080
RUN apt-get update
RUN apt-get -y install \
	wget \
	unzip \
	openjdk-8-jdk \
	openjdk-8-jre

WORKDIR /home
RUN wget -O ner.zip http://nlp.stanford.edu/software/stanford-ner-2015-04-20.zip
RUN unzip ner.zip

WORKDIR /home/stanford-ner-2015-04-20
CMD java -mx1000m -cp stanford-ner.jar edu.stanford.nlp.ie.NERServer \
    -loadClassifier classifiers/english.muc.7class.distsim.crf.ser.gz \
    -port 8080 -outputFormat inlineXML
