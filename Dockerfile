# Use Ubuntu 22.04 where fortune is available
FROM ubuntu:22.04  

# Update package list
RUN apt-get update  

# Install required dependencies
RUN apt-get install -y fortune cowsay netcat-openbsd  

# Clean up unnecessary files
RUN rm -rf /var/lib/apt/lists/*  

# Set PATH so fortune and cowsay are accessible
ENV PATH="/usr/games:${PATH}"

# Verify installation
RUN which fortune  
RUN which cowsay  

# Set working directory
WORKDIR /app  

# Copy the script into the container
COPY wisecow.sh /app/wisecow.sh  
RUN chmod +x /app/wisecow.sh  

# Expose the port
EXPOSE 4499  

# Run the script
CMD ["/app/wisecow.sh"]
