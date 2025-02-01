FROM openjdk:11-jre-slim
RUN apt-get update && apt-get install -y wget
RUN wget https://downloads.apache.org/jena/binaries/apache-jena-fuseki-4.7.0.tar.gz && \
    tar -xzf apache-jena-fuseki-4.7.0.tar.gz && \
    mv apache-jena-fuseki-4.7.0 /jena-fuseki
COPY newsDCMI.rdf /jena-fuseki/run/databases/newsDCMI/newsDCMI.rdf
EXPOSE 3030
CMD ["/jena-fuseki/fuseki-server", "--update", "--mem", "/news"]