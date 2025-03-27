# Wisecow App Deployment

## Overview
The Wisecow app is deployed on an **AWS Lightsail** instance running a **single-node K3s cluster**. The deployment process is fully automated, ensuring that every push triggers the building and deployment of a new Docker image to the cluster.

## Features

- **Deployment**:  
  Wisecow app hosted on an AWS Lightsail instance with a single-node K3s cluster.

- **Automation**:  
  On each push, a new Docker image is built and automatically deployed to the cluster.

- **Process**:  
  New pods are created with the updated Docker image, and old pods are deleted seamlessly.

- **Time Taken**:  
  The entire setup was completed in approximately **10 hours**.

- **URL**:  
  You can view the app here: [wisecow.pranavparihar.site](https://wisecow.pranavparihar.site)
