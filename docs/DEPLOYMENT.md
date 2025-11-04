# Deployment Guide

This guide shows how to deploy QR Data Transfer to various platforms with HTTPS support (required for mobile camera access).

## Table of Contents
1. [GitHub Pages (Recommended)](#github-pages)
2. [Netlify](#netlify)
3. [Vercel](#vercel)
4. [Local Testing with ngrok](#local-testing)
5. [Self-Hosting](#self-hosting)

---

## GitHub Pages

**Easiest option - Free with automatic HTTPS**

### Steps:
1. **Fork or Create Repository**
   - Fork this repo, or create a new one
   - Upload `index.html` to your repository

2. **Enable GitHub Pages**
   - Go to your repository on GitHub
   - Click **Settings** → **Pages**
   - Under "Source", select **main** branch
   - Click **Save**

3. **Access Your Site**
   - Wait 1-2 minutes for deployment
   - Your site will be at: `https://yourusername.github.io/repo-name`

### Automatic Deployment
This repo includes a GitHub Actions workflow that automatically deploys on push to main.

**Enable it:**
- Go to **Settings** → **Pages**
- Under "Build and deployment", select **GitHub Actions**

---

## Netlify

**Super fast deployment - Free tier with instant HTTPS**

### Method 1: Netlify Drop (Easiest)
1. Go to [app.netlify.com/drop](https://app.netlify.com/drop)
2. Drag and drop `index.html`
3. Get instant HTTPS URL (e.g., `https://random-name.netlify.app`)

### Method 2: Git Integration
1. Connect your GitHub repository
2. Build settings:
   - Build command: (leave empty)
   - Publish directory: `/`
3. Click **Deploy**

### Method 3: Netlify CLI
```bash
# Install CLI
npm install -g netlify-cli

# Deploy
cd qr-data-transfer
netlify deploy --prod
```

---

## Vercel

**Modern platform - Free with automatic HTTPS**

### Method 1: Vercel CLI (Recommended)
```bash
# Install CLI
npm install -g vercel

# Deploy
cd qr-data-transfer
vercel --prod
```

### Method 2: Vercel Dashboard
1. Go to [vercel.com](https://vercel.com)
2. Click **New Project**
3. Import your Git repository
4. Click **Deploy**

---

## Local Testing

For local development, you need HTTPS for mobile camera access.

### Option 1: ngrok (Recommended)

**Creates secure tunnel to localhost**

```bash
# Install ngrok from https://ngrok.com

# Start local server
python3 -m http.server 8000

# In another terminal, create tunnel
ngrok http 8000

# Use the HTTPS URL (e.g., https://abc123.ngrok.io) on your phone
```

### Option 2: localhost (Desktop Only)
```bash
# Simple HTTP server (receiver won't work on mobile)
python3 -m http.server 8000

# Or use Node.js
npx http-server -p 8000

# Access at http://localhost:8000
```

**Note:** Mobile browsers require HTTPS for camera access. `localhost` exception only works on the same device.

---

## Self-Hosting

### Requirements
- Web server (Apache, Nginx, etc.)
- SSL/TLS certificate (Let's Encrypt recommended)
- Domain name (optional but recommended)

### Nginx Example

1. **Install Nginx**
```bash
sudo apt update
sudo apt install nginx
```

2. **Copy Files**
```bash
sudo cp index.html /var/www/html/
```

3. **Install SSL with Let's Encrypt**
```bash
sudo apt install certbot python3-certbot-nginx
sudo certbot --nginx -d yourdomain.com
```

4. **Nginx Config** (`/etc/nginx/sites-available/qr-transfer`)
```nginx
server {
    listen 443 ssl http2;
    server_name yourdomain.com;

    ssl_certificate /etc/letsencrypt/live/yourdomain.com/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/yourdomain.com/privkey.pem;

    root /var/www/html;
    index index.html;

    location / {
        try_files $uri $uri/ =404;
    }
}

server {
    listen 80;
    server_name yourdomain.com;
    return 301 https://$server_name$request_uri;
}
```

5. **Enable and Restart**
```bash
sudo ln -s /etc/nginx/sites-available/qr-transfer /etc/nginx/sites-enabled/
sudo nginx -t
sudo systemctl restart nginx
```

### Apache Example

1. **Install Apache**
```bash
sudo apt update
sudo apt install apache2
```

2. **Copy Files**
```bash
sudo cp index.html /var/www/html/
```

3. **Install SSL with Let's Encrypt**
```bash
sudo apt install certbot python3-certbot-apache
sudo certbot --apache -d yourdomain.com
```

---

## Troubleshooting

### Camera Won't Start on Mobile
- ✅ Ensure you're using HTTPS (not HTTP)
- ✅ Check browser permissions
- ✅ Try Chrome (Android) or Safari (iOS)

### "Not Secure" Warning
- ❌ HTTP detected - camera access blocked
- ✅ Use one of the HTTPS deployment methods above

### Local Testing Not Working on Phone
- ❌ Can't use simple HTTP server
- ✅ Use ngrok for HTTPS tunnel

### Deployment Failed
- Check that `index.html` is in the root directory
- Ensure GitHub Actions has permissions
- Wait 1-2 minutes for DNS propagation

---

## Quick Comparison

| Platform | Speed | Cost | Difficulty | HTTPS | Best For |
|----------|-------|------|------------|-------|----------|
| **GitHub Pages** | ⭐⭐⭐ | Free | Easy | ✅ | Open source projects |
| **Netlify Drop** | ⭐⭐⭐⭐⭐ | Free | Very Easy | ✅ | Quick testing |
| **Vercel** | ⭐⭐⭐⭐ | Free | Easy | ✅ | Modern projects |
| **ngrok** | ⭐⭐⭐⭐⭐ | Free | Easy | ✅ | Local testing |
| **Self-hosted** | ⭐⭐ | Varies | Hard | ⚙️ | Full control |

---

## Support

Need help? [Open an issue](https://github.com/yourusername/qr-data-transfer/issues)
