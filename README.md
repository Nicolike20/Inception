# Inception

## 📚 About the Project

**Inception** is a system administration and virtualization project from the 42 coding school curriculum. The goal is to use **Docker** and **Docker Compose** to create and manage a full multi-container infrastructure that includes a WordPress website running behind an NGINX reverse proxy, all served with SSL encryption.

The project emphasizes the principles of containerization, automation, networking, and secure service deployment.

---

## 🧩 Project Objective

Build a secure and scalable web infrastructure using:

- **Docker** – to containerize all services
- **Docker Compose** – to orchestrate multiple services with ease
- **Volumes** – to ensure data persistence
- **NGINX** – as a web server and reverse proxy
- **WordPress + PHP-FPM** – as the web application
- **MariaDB** – as the relational database
- **SSL/TLS** – to enable HTTPS connections

Each service must run in its own container, and only Docker and docker-compose are allowed to be used — no virtual machines or other container engines.

---

## 🛠️ How to Use

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/inception.git
   cd inception
   ```

2. Set up the `.env` file (if applicable) with your credentials:
   ```env
   MYSQL_ROOT_PASSWORD=...
   MYSQL_USER=...
   MYSQL_PASSWORD=...
   MYSQL_DATABASE=...
   DOMAIN_NAME=...
   ```

3. Start the services:
   ```bash
   docker-compose up --build
   ```

4. Access the services:
   - WordPress: `https://yourdomain.com`
   - Admin dashboard: `https://yourdomain.com/wp-admin`

---

## 🧠 Skills Demonstrated

- Docker and Docker Compose orchestration  
- Service decoupling and container architecture  
- Environment variable and secret management  
- NGINX configuration (virtual hosts, SSL, reverse proxy)  
- TLS certificate generation and renewal using **OpenSSL** or **Certbot**  
- Data persistence using Docker volumes  
- Networking between containers using custom Docker bridges  
- Secure WordPress and MariaDB configuration


---

## 📁 Project Status

✅ Completed – all mandatory services implemented, secured, and orchestrated via Docker Compose.  

---

## 📌 Notes

- All services are containerized — no applications installed directly on the host machine  
- Infrastructure designed to be reusable, reproducible, and easily deployable  
- Emphasis on security, performance, and Docker best practices

---

## 📫 Contact

Feel free to reach out via [GitHub](https://github.com/Nicolike20) if you have any questions or want to connect.

[![forthebadge](https://forthebadge.com/images/featured/featured-built-with-love.svg)](https://forthebadge.com)
