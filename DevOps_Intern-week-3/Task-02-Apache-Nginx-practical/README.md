
# Beginner Guide: Nginx and Apache Lab on Ubuntu

## What You'll Learn
How to set up two popular web servers (Nginx and Apache) on your Ubuntu computer and make Nginx forward requests to Apache.

## Step 1: Set Up Apache (Backend Server)
Apache will serve a simple webpage.
- Install Apache:
  ```bash
  sudo apt update -y
  sudo apt install -y apache2
  ```
- Create a webpage:
  ```bash
  sudo nano /var/www/html/index.html
  # Add: <h1>Hello from Apache</h1>
  ```
- Change Apache to use port 8080:
  Edit these files:
  ```bash
  sudo nano /etc/apache2/ports.conf
  # Add: Listen 8080

  sudo nano /etc/apache2/sites-available/000-default.conf
  # Change: <VirtualHost *:8080>
  ```
- Restart Apache:
  ```bash
  sudo systemctl restart apache2
  ```
- Check: Visit `http://localhost:8080` in your browser.

## Step 2: Set Up Nginx (Frontend Server)
Nginx will show a webpage and later forward requests to Apache.
- Install Nginx:
  ```bash
  sudo apt install -y nginx
  ```
- Create a webpage:
  ```bash
  sudo nano /var/www/html/index.html
  # Add: <h1>Hello from Nginx</h1>
  ```
- Check: Visit `http://localhost` in your browser.

## Step 3: Make Nginx Forward to Apache
This is called a reverse proxy.
- Create a config file:
  ```bash
  sudo nano /etc/nginx/sites-available/proxy.conf
  # Add:
  server {
    listen 80;
    location / {
      proxy_pass http://127.0.0.1:8080;
    }
  }
  ```
- Enable the config:
  ```bash
  sudo rm -f /etc/nginx/sites-enabled/default
  sudo ln -s /etc/nginx/sites-available/proxy.conf /etc/nginx/sites-enabled/
  sudo nginx -t
  sudo systemctl reload nginx
  ```
- Check: Visit `http://localhost` → You should see Apache page.

## Step 4: Host Another Site with Nginx
You can host multiple sites using names.
- Create a folder and page:
  ```bash
  sudo mkdir -p /var/www/demo
  sudo nano /var/www/demo/index.html
  # Add: <h1>Demo Site on Nginx</h1>
  ```
- Create config:
  ```bash
  sudo nano /etc/nginx/sites-available/demo.conf
  # Add:
  server {
    listen 80;
    server_name demo.local;
    root /var/www/demo;
    index index.html;
  }
  ```
- Enable and test:
  ```bash
  sudo ln -s /etc/nginx/sites-available/demo.conf /etc/nginx/sites-enabled/
  sudo nano /etc/hosts
  # Add: 127.0.0.1 demo.local
  sudo nginx -t
  sudo systemctl reload nginx
  ```
- Check: Visit `http://demo.local`

## Step 5: Load Balancing (Optional)
Send traffic to multiple Apache servers.
- Create config:
  ```bash
  sudo nano /etc/nginx/sites-available/loadbalance.conf
  # Add:
  upstream backend {
    server 127.0.0.1:8080;
    # server 127.0.0.1:8081; # optional second server
  }
  server {
    listen 80;
    location / {
      proxy_pass http://backend;
    }
  }
  ```
- Enable and reload:
  ```bash
  sudo ln -s /etc/nginx/sites-available/loadbalance.conf /etc/nginx/sites-enabled/
  sudo nginx -t
  sudo systemctl reload nginx
  ```

## Cleanup
Stop the servers when done:
```bash
sudo systemctl stop nginx
sudo systemctl stop apache2
```
