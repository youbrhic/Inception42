# 🏗️ Inception

> A 42 School system administration and Docker project.  
> This project demonstrates containerization, orchestration, and infrastructure management using **Docker** and **Docker Compose**.  
> It includes a functional WordPress website with additional services to enhance the environment.

---

## 📘 Overview

**Inception** is a project that teaches you how to deploy and manage a multi-service infrastructure using Docker.  
The goal is to build **from scratch** containers for various services, orchestrate them, ensure they are secure, and make them persist data properly.

The project consists of:

- **Mandatory services**:
  - Nginx (reverse proxy with SSL)
  - WordPress (PHP-FPM)
  - MariaDB (database)
  
- **Bonus services**:
  - Redis cache for WordPress
  - FTP server linked to WordPress volume
  - Static website
  - Adminer (database management)
  - Optional additional service of your choice

---

## 🧩 Project Goals

The key objectives of this project are:

1. Create **Dockerfiles** for each service.
2. Run each service in its **own container**.
3. Use **Docker volumes** to persist critical data.
4. Connect containers with **Docker networks**.
5. Enable secure connections (SSL) for web services.
6. Implement **bonus services** to improve functionality and performance.

---

## 🧩 Project Goals


---

## 🧱 Project Structure


---

## 🌐 Services Overview

| Service           | Description | Port  | Notes |
|------------------|-------------|-------|-------|
| **Nginx**         | Reverse proxy with SSL | 443   | Secures traffic using self-signed certificates |
| **WordPress**     | PHP-FPM CMS | 9000  | Connects to MariaDB and Redis |
| **MariaDB**       | Database | 3306  | Stores WordPress content |
| **Redis**         | Cache for WordPress | 6379  | Optional but improves performance |
| **FTP Server**    | File transfer for WordPress volume | 21/20 | Accessible with FTP client |
| **Static Website**| Simple HTML/CSS/JS site | 8080  | Demonstrates static web hosting |
| **Adminer**       | Database management | 8081  | Lightweight DB admin tool |
| **Optional Service** | User-defined bonus | Custom | Must be justified during defense |

---

## 🔧 Environment Variables (example)

All credentials and variables are stored in `.env`:

```
# Database

DB_NAME=WP_DB
DB_USER=youbrhic
DB_VOLUME=/home/youbrhic/data/mariadb

# WordPress

WP_DOMAINE_NAME=youbrhic.42.fr
WP_TITLE=inception
WP_ADMIN_USER=youbrhic
WP_ADMIN_EMAIL=youbrhic@gmail.com
WP_NEW_USER_NAME=yassine
WP_NEW_USER_EMAIL=yassine@gmail.com
WP_NEW_USER_ROLE=subscriber
WP_VOLUME=/home/youbrhic/data/wordpress

# FTP
USERFTP=yassine

```

## 🔧 Secrets (example)
All passwords and sensitive data are stored in secrets folder:

```
secrets/
├── db_root_pass.txt       # Root password for the database
├── db_user_pass.txt       # Database user password
├── ftp_user_pass.txt      # FTP user password
├── wp_admin_pass.txt      # WordPress admin password
└── wp_user_pass.txt       # WordPress regular user password

```
## 🗂️ Project Structure
```
Inception42/
├── Makefile
├── README.md
├── secrets/
│   ├── db_root_pass.txt
│   ├── db_user_pass.txt
│   ├── ftp_user_pass.txt
│   ├── wp_admin_pass.txt
│   └── wp_user_pass.txt
└── srcs/
    ├── .env                 # Environment variables file
    ├── docker-compose.yml
    └── requirements/
        ├── bonus/
        │   ├── Adminer/
        │   │   └── Dockerfile
        │   ├── ftp/
        │   │   ├── Dockerfile
        │   │   └── tools/
        │   │       └── ftp_config.sh
        │   ├── portainer/
        │   │   └── Dockerfile
        │   ├── redis/
        │   │   ├── Dockerfile
        │   │   └── tools/
        │   │       └── Redis_script.sh
        │   └── static_website/
        │       ├── Dockerfile
        │       └── tools/
        │           └── index.html
        ├── mariadb/
        │   ├── Dockerfile
        │   └── tools/
        │       └── mdb_config.sh
        ├── nginx/
        │   ├── Dockerfile
        │   └── tools/
        │       └── default.conf
        └── wordpress/
            ├── Dockerfile
            └── tools/
                └── wp_config.sh

```
## 📚 References

***NGINX*** :https://www.freecodecamp.org/news/the-nginx-handbook/ 

***Wp*** (wordpress CLI) :https://wp-cli.org/

***Dockerfile*** : https://docs.docker.com/build/concepts/dockerfile/

***Docker-compose*** : https://docs.docker.com/compose/
 
***SQL-Mysql*** : https://www.youtube.com/watch?v=5OdVJbNCSso

