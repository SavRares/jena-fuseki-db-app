# Use the official Fuseki Docker image
FROM stain/jena-fuseki:latest

# Copy your RDF data to the Fuseki data directory
COPY newsDCMI.rdf /fuseki/base/databases/newsDCMI/newsDCMI.rdf

# Expose the Fuseki port
EXPOSE 3030

# Start Fuseki with your dataset
CMD ["fuseki-server", "--update", "--mem", "/news"]