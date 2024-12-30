# PassportPhotoReader

An iOS app that allows users to read their passport photo using NFC technology. The app uses the NFCPassportReader library to securely read and extract the photo from NFC-enabled passports.

## Features

- Read passport photos via NFC
- Simple and intuitive user interface
- Secure passport data reading
- Support for modern passports with NFC chips

## Requirements

- iOS 14.0 or later
- iPhone 7 or newer (with NFC capability)
- Xcode 14.0 or later
- Valid passport with NFC chip (look for this symbol: 📡)

## Setup

1. Clone the repository
```bash
git clone https://github.com/vacekj/idbuddy.git
```

2. Open the project in Xcode
```bash
cd PassportPhotoReader
open PassportPhotoReader.xcodeproj
```

3. Configure signing
- Open the project settings in Xcode
- Select the PassportPhotoReader target
- In the "Signing & Capabilities" tab:
  - Enable "Automatically manage signing"
  - Select your development team
  - The bundle identifier will be automatically updated

4. Run the app
- Select your iPhone as the run destination
- Press Cmd+R or click the Play button

## Usage

1. Launch the app on your iPhone
2. Enter your passport details:
   - Passport number
   - Date of birth (YYMMDD format)
   - Expiry date (YYMMDD format)
3. Click "Scan Passport"
4. Hold your iPhone near the passport's NFC chip (usually on the back cover)
5. Wait for the scan to complete
6. Your passport photo will be displayed on screen

## Security

This app uses the official passport NFC reading protocols (BAC/PACE) to securely access your passport data. No passport data is stored or transmitted outside of your device.

## Credits

This project uses the [NFCPassportReader](https://github.com/andrea-deluca/NFCPassportReader) library by Andrea Deluca. 