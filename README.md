# docker-ner
Docker container for Stanford Named Entity Recognizer (NER)

Start the docker container:
```
docker run -d -p 8080:8080 mbartoli/ner
```

For reference, this is the command that runs inside the container:
```
java -mx1000m -cp stanford-ner.jar edu.stanford.nlp.ie.NERServer \
     -loadClassifier classifiers/english.muc.7class.distsim.crf.ser.gz  \
     -port 8080 -outputFormat inlineXML
```

Example usage with python from the host machine:
```
import ner
tagger = ner.SocketNER(host='localhost', port=8080)
tagger.get_entities("Pomona College is located in Claremont, California")
```
