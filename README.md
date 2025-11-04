# QR Data Transfer 📱➡️📱

Transfer data between devices using animated QR codes - no internet, no apps, just cameras and screens!

![License](https://img.shields.io/badge/license-MIT-blue.svg)

## ✨ Features

- 📤 **Send text or files** - Type text directly or upload any file type
- 🎬 **Animated QR codes** - Displays rotating QR codes at ~3 fps
- 📷 **Real-time scanning** - Camera continuously captures frames
- 📊 **Progress tracking** - Visual progress bars for both sending and receiving
- 🔄 **Smart reassembly** - Automatically reconstructs data when complete
- 💾 **File downloads** - Received files can be downloaded directly
- 🔒 **Offline first** - Works completely offline (uses CDN libraries)
- 📱 **Mobile optimized** - Responsive design works on all devices

## 🚀 Quick Start

### Try It Now

**Option 1: GitHub Pages (Recommended)**
1. Fork this repository
2. Go to Settings → Pages
3. Select "main" branch and save
4. Access at `https://yourusername.github.io/qr-data-transfer`

**Option 2: Netlify Drop**
1. Go to [Netlify Drop](https://app.netlify.com/drop)
2. Drag and drop the `index.html` file
3. Get instant HTTPS URL

**Option 3: Vercel**
```bash
npm i -g vercel
vercel --prod
```

### Local Development

**Important:** Mobile browsers require HTTPS for camera access. For local testing:

```bash
# Option 1: Simple HTTP server (sender only)
python3 -m http.server 8000

# Option 2: Use ngrok for HTTPS (both sender and receiver)
ngrok http 8000
```

## 📖 How It Works

### Sending Data
1. Open the app on the sender device
2. Click the **Send** tab
3. Enter text or select a file
4. Click **Generate QR Stream**
5. Animated QR codes will display on screen

### Receiving Data
1. Open the app on the receiver device
2. Click the **Receive** tab
3. Click **Start Camera** and allow permissions
4. Point camera at the sender's screen
5. Wait for all frames to be received
6. Download or copy the received data

## 🔧 Technical Details

### How Data Transfer Works

1. **Data Chunking**: Large data is split into ~1.8KB chunks
2. **Frame Format**: Each QR code contains:
   ```json
   {
     "v": 1,           // Version
     "i": 0,           // Frame index
     "t": 10,          // Total frames
     "d": "base64..."  // Chunk data (base64)
   }
   ```
3. **Transmission**: QR codes rotate at 3 fps, looping until stopped
4. **Reception**: Camera scans continuously, collecting unique frames
5. **Reassembly**: When all frames received, data is reconstructed

### Technical Specifications

- **Encoding**: Base64 for binary data, UTF-8 for text
- **QR Error Correction**: Low (L) for maximum data capacity
- **Chunk Size**: 1800 bytes per frame
- **Frame Rate**: ~3 FPS (333ms per frame)
- **Max Recommended Size**: ~5MB (depends on patience!)

### Libraries Used

- [qrcode.js](https://github.com/davidshimjs/qrcodejs) - QR code generation
- [html5-qrcode](https://github.com/mebjas/html5-qrcode) - Camera scanning

## 🎯 Use Cases

- Transfer photos between phones without cloud
- Share documents in offline environments
- Send passwords/keys securely (no internet)
- Transfer files in air-gapped systems
- Share data at conferences/events
- Backup small files via QR codes

## 📱 Browser Compatibility

### Sender (QR Generation)
- ✅ All modern browsers
- ✅ Works without HTTPS
- ✅ Desktop and mobile

### Receiver (Camera Scanning)
- ✅ Chrome (Android) - Best support
- ✅ Safari (iOS) - Best support
- ⚠️ Firefox - Limited mobile camera support
- ❌ Requires HTTPS on mobile (except localhost)

## 🛠️ Configuration

You can modify these settings in the code:

```javascript
// Chunk size (bytes per QR code)
const chunkSize = 1800; // Line 244

// Frame rate (milliseconds between frames)
transmissionInterval = setInterval(displayNextQR, 333); // Line 281

// QR code size
width: 350,
height: 350, // Lines 302-303

// Camera frame rate
fps: 10, // Line 363
```

## 🔐 Security Considerations

- ✅ **No Internet Required**: Data never leaves the devices
- ✅ **No Storage**: Data not saved to any server
- ⚠️ **Visual Security**: Anyone with line of sight can capture the QR codes
- ⚠️ **No Encryption**: Data is base64 encoded, not encrypted
- 💡 **Recommendation**: Add your own encryption layer for sensitive data

## 🚧 Limitations

- **File Size**: Larger files (>10MB) take considerable time
- **Line of Sight**: Requires clear view of screen
- **Lighting**: Poor lighting affects camera scanning
- **Device Movement**: Keep devices stable during transfer
- **HTTPS Required**: Mobile camera access needs HTTPS

## 🤝 Contributing

Contributions are welcome! Ideas for improvements:

- [ ] Add encryption/password protection
- [ ] Implement fountain codes for better reliability
- [ ] Add compression (gzip)
- [ ] Support for multiple QR codes on screen simultaneously
- [ ] Pause/resume functionality
- [ ] Transfer history
- [ ] Adjustable frame rate
- [ ] Dark mode

## 📄 License

MIT License - feel free to use this in your projects!

## 🙏 Acknowledgments

Built with inspiration from:
- [qrloop](https://github.com/cozmo/jsqrcode) - QR code scanning
- Animated QR transfer techniques used in air-gapped systems
- Various offline file transfer implementations

## 📬 Support

Having issues? Check these common problems:

**Camera won't start on mobile:**
- Ensure you're using HTTPS (not HTTP)
- Check browser camera permissions
- Try Chrome (Android) or Safari (iOS)
- Close other apps using the camera

**QR codes not scanning:**
- Ensure good lighting
- Keep devices stable
- Adjust camera distance (15-30cm works best)
- Clean camera lens

**Transfer is slow:**
- This is normal! Each frame takes ~333ms
- Larger files take longer
- Consider compressing files first

