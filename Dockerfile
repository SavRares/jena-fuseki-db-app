FROM openjdk:11-jre-slim
RUN apt-get update && apt-get install -y wget
RUN wget https://dlcdn.apache.org/jena/binaries/apache-jena-fuseki-5.3.0.tar.gz && \
    tar -xzf apache-jena-fuseki-5.3.0.tar.gz && \
    mv apache-jena-fuseki-5.3.0.tar.gz /jena-fuseki && \
    rm apache-jena-fuseki-5.3.0.tar.gz

RUN mkdir -p /jena-fuseki/run/databases/newsDCMI

COPY newsDCMI.rdf /jena-fuseki/run/databases/newsDCMI/newsDCMI.rdf
EXPOSE 3030
CMD ["/jena-fuseki/fuseki-server", "--update", "--mem", "/news"]