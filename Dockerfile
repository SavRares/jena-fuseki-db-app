# Use a lightweight base image with Java 17 pre-installed
FROM eclipse-temurin:17-jre-jammy

# Install necessary tools
RUN apt-get update && apt-get install -y wget

# Download and install Apache Jena Fuseki
RUN wget https://dlcdn.apache.org/jena/binaries/apache-jena-fuseki-5.3.0.tar.gz && \
    tar -xzf apache-jena-fuseki-5.3.0.tar.gz && \
    mv apache-jena-fuseki-5.3.0 /jena-fuseki && \
    rm apache-jena-fuseki-5.3.0.tar.gz

# Create the required directories
RUN mkdir -p /jena-fuseki/run/databases/newsDCMI

# Copy your RDF data to the Fuseki data directory
COPY newsDCMI.rdf /jena-fuseki/run/databases/newsDCMI/newsDCMI.rdf

# Expose the Fuseki port
EXPOSE 3030

# Start Fuseki with your dataset
CMD ["/jena-fuseki/fuseki-server", "--update", "--mem", "/news"]