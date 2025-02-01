# Use the official Fuseki Docker image
FROM stain/jena-fuseki:4.7.0

# Copy your RDF data to the Fuseki data directory
COPY newsDCMI.rdf /fuseki/base/databases/newsDCMI/newsDCMI.rdf

# Expose the Fuseki port
EXPOSE 3030

# Start Fuseki with your dataset
CMD ["java", "-jar", "/jena-fuseki/fuseki-server.jar", "--update", "--mem", "/news"]