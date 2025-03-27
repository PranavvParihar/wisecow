# Wisecow App Deployment 🚀

## Overview 🌐
The Wisecow app is deployed on an **AWS Lightsail** instance running a **single-node K3s cluster**. The deployment process is fully automated, ensuring that every push triggers the building and deployment of a new Docker image to the cluster.

## URL 🔗  
You can view the app here: [wisecow.pranavparihar.site](https://wisecow.pranavparihar.site)


## Features ✨

- **Deployment**:  
  Wisecow app hosted on an AWS Lightsail instance with a single-node K3s cluster. 🌍

- **Automation**:  
  On each push, a new Docker image is built and automatically deployed to the cluster. 🔄

- **Process**:  
  New pods are created with the updated Docker image, and old pods are deleted seamlessly. ⚡️

- **Time Taken**:  
  The entire setup was completed in approximately **7.5 hours**. ⏱️
  

## Backup & System Health 💾⚙️
The **backup and system health scripts** are stored in a separate directory.

## Technologies Used 🛠️
- **AWS Lightsail** ☁️
- **K3s** 🖥️
- **Docker** 🐳
- **CI/CD (GitHub Actions)** 🔧

## Getting Started 🏁
1. Clone the repository.  
2. Set up **AWS Lightsail** and configure **K3s** on the instance.  
3. Automate Docker build and deployment using **CI/CD** pipelines (GitHub Actions).  
4. Check the deployed application at [wisecow.pranavparihar.site](https://wisecow.pranavparihar.site). 🌍

## License 📜
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
