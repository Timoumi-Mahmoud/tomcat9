#####
### Overview 

- Automated installation of Apache Tomcat 9
- Configuration of JVM heap size based on the environment:
  - DEV: 256 MB
  - PROD: 512 MB
- Automatic deployment of the WAR file
- Automated deployment tests in a Docker container

### Usage
```bash
./tomcat_deploy.sh DEV
//or
./tomcat_deploy.sh PROD
```

### Project structure

.
├── deploy.yml  
├── Dockerfile  
├── sample.war
├── tomcat_deploy.sh
└── tomcat_test.sh


**`deploy.yml`**
This playbook performs the following steps:
    Downloads and extracts Tomcat 9.
    Creates a user for Tomcat.
    Configures access permissions for Tomcat.
    Copies a WAR file into the Tomcat directory.
    Creates an initialization script to manage the startup and shutdown of Tomcat.
    Configures the JVM heap size based on the environment (DEV or PROD) by modifying the setenv.sh file.


**`Dockerfile`** :  
 Creates a Docker image based on Debian with Ansible and other necessary utilities for installing and deploying Tomcat. It installs required dependencies, including Ansible, Python, and procps.

**`tomcat_deploy.sh`** :  
This bash script is used to run the deployment process inside a Docker container. It accepts an argument (DEV or PROD) to define the execution environment. The script builds the Docker image from the Dockerfile and launches a container with a volume attached, mapping the current directory ($(pwd)) to /data inside the container. The container then runs the tomcat_test.sh file to perform deployment tests.


