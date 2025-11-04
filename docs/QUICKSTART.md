# Quick Start Guide ⚡

Get up and running in 5 minutes!

## 🎯 Fastest Way to Deploy

### Option 1: GitHub Pages (2 minutes)
```bash
# 1. Fork this repo on GitHub
# 2. Go to Settings → Pages
# 3. Select "main" branch → Save
# 4. Done! Access at https://yourusername.github.io/qr-data-transfer
```

### Option 2: Netlify Drop (30 seconds)
1. Go to [app.netlify.com/drop](https://app.netlify.com/drop)
2. Drag `index.html` onto the page
3. Get instant HTTPS URL
4. Done!

## 📱 How to Use

### Sending (Device A)
1. Open the app
2. Type text or upload a file
3. Click **Generate QR Stream**
4. Keep screen visible

### Receiving (Device B)
1. Open the app
2. Click **Receive** tab
3. Click **Start Camera**
4. Point at Device A's screen
5. Wait for completion
6. Download your data!

## ⚠️ Important

**Mobile camera requires HTTPS!**
- ✅ GitHub Pages (automatic HTTPS)
- ✅ Netlify (automatic HTTPS)
- ✅ Vercel (automatic HTTPS)
- ❌ Plain HTTP won't work on mobile

## 🔧 Local Testing

Need to test locally? Use ngrok:

```bash
# Terminal 1: Start server
python3 -m http.server 8000

# Terminal 2: Create HTTPS tunnel
ngrok http 8000

# Use the ngrok HTTPS URL on your phone
```

## 💡 Tips

- **Best distance**: 15-30cm from screen
- **Lighting**: Good lighting helps scanning
- **Stability**: Keep both devices stable
- **Browser**: Chrome (Android) or Safari (iOS) work best

## 📊 Performance

- Small text (< 10KB): ~3-5 seconds
- Medium files (100KB): ~30-40 seconds  
- Large files (1MB): ~5 minutes
- Very large (5MB+): Be patient! 😊

## 🐛 Troubleshooting

**Camera won't start?**
- Check you're using HTTPS
- Allow camera permissions
- Try different browser

**QR codes not scanning?**
- Improve lighting
- Hold device steady
- Adjust distance to screen
- Clean camera lens

**Slow transfer?**
- Normal! Each frame = 333ms
- Compress files before sending
- Consider smaller data for speed

## 📚 More Info

- Full docs: [README.md](../README.md)
- Deployment guide: [docs/DEPLOYMENT.md](DEPLOYMENT.md)
- Contributing: [CONTRIBUTING.md](../CONTRIBUTING.md)

---

Need help? [Open an issue](https://github.com/yourusername/qr-data-transfer/issues)
