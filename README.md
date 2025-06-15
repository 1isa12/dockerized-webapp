# DevOps Assignment: Dockerize and Deploy a Node.js App on AWS EC2

## Objective: To Dockerize a Node.js application and deploy it on an AWS EC2 instance with clear documentation and automation practices.

---

## Tools Used

- Node.js (Express)
- Docker
- Git & GitHub
- AWS EC2 (Ubuntu 22.04 LTS)
- Terminal / PowerShell

---

## Repository

GitHub Repo: [https://github.com/1isa12/dockerized-webapp](https://github.com/1isa12/dockerized-webapp)

---

## Steps & Commands Used

### 1. Create Node.js App

```bash
mkdir node-docker-app
cd node-docker-app
npm init -y
npm install express
````

**app.js**

```javascript
const express = require('express');
const app = express();
const port = 3000;

app.get('/', (req, res) => {
  res.send('🎉 Hello from Dockerized Node.js App!');
});

app.listen(port, '0.0.0.0', () => {
  console.log(`App running at http://localhost:3000`);
});
```

---

### 2. Create Dockerfile

```Dockerfile
FROM node:18
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 3000
CMD ["node", "app.js"]
```

---

### 3. Run Docker Locally

```bash
docker build -t node-docker-app .
docker run -p 3000:3000 node-docker-app
```

Visited: [http://localhost:3000](http://localhost:3000)
Took a screenshot of app running locally

---

### 4. Launch EC2 on AWS

* Ubuntu 22.04
* t2.micro (Free Tier)
* Inbound Rules:

  * SSH (22)
  * HTTP (80)
  * Custom TCP (3000)

---

### 5. SSH into EC2

```bash
ssh -i ec2-key.pem ubuntu@13.60.242.252
```

---

### 6. Install Docker on EC2

```bash
sudo apt update
sudo apt install docker.io -y
sudo systemctl start docker
sudo usermod -aG docker ubuntu
exit
```

Re-login:

```bash
ssh -i ec2-key.pem ubuntu@13.60.242.252
```

---

### 7. Clone GitHub Repo in EC2

```bash
sudo apt install git -y
git clone https://github.com/1isa12/dockerized-webapp.git
cd dockerized-webapp
```

---

### 8. Build & Run App in Docker (on EC2)

```bash
docker build -t node-docker-app .
docker run -p 3000:3000 node-docker-app
```

Visited: `http://13.60.242.252:3000`
Took a screenshot of app running via EC2

---

## Screenshots Collected

* Docker app running locally
* EC2 instance dashboard
* SSH terminal session on EC2
* App running via public EC2 IP

Uploaded to Google Drive: [Your Drive Link Here](#)

---

## ✅ Conclusion

Successfully containerized and deployed a Node.js app using Docker on AWS EC2 with proper documentation and DevOps practices.
