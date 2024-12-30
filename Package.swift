// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "PassportPhotoReader",
    platforms: [
        .iOS(.v14),
        .macOS(.v11)
    ],
    products: [
        .executable(name: "PassportPhotoReader", targets: ["PassportPhotoReader"])
    ],
    dependencies: [
        .package(url: "https://github.com/andrea-deluca/NFCPassportReader.git", from: "0.1.1")
    ],
    targets: [
        .executableTarget(
            name: "PassportPhotoReader",
            dependencies: ["NFCPassportReader"],
            path: "Sources"
        )
    ]
) 