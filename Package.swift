// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "FaceCapture",
    platforms: [
        .iOS(.v14) // Specify minimum platform version
    ],
    products: [
        .library(
            name: "FaceCapture",
            targets: ["FaceCapture"]),
    ],
    dependencies: [
        // List of external packages upon which your package depends.
        .package(url: "https://github.com/Ekhoo/Device.git", from: "3.6.0"),
        .package(url: "https://github.com/bustoutsolutions/siesta.git", from: "1.0.0"),
        .package(url: "https://github.com/d-date/google-mlkit-swiftpm", from: "3.2.1"),
        .package(url: "https://github.com/airbnb/lottie-spm.git", from: "4.4.1")

    ],
    targets: [
        .target(
            name: "FaceCapture",
            dependencies: [
                "Device", // This works if the package name matches the product name.
                .product(name: "Siesta", package: "siesta"),
                .product(name: "MLKitFaceDetection", package: "google-mlkit-swiftpm"),
                .product(name: "Lottie", package: "lottie-spm"),// Hypothetical product name
            ]),
        .testTarget(
            name: "FaceCaptureTests",
            dependencies: ["FaceCapture"]),
    ]
)
