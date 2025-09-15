// swift-tools-version:5.9
import PackageDescription

// 컴파일러 버전에 따라 타겟을 다르게 정의합니다.
#if compiler(>=6.0)
// MARK: - Swift 6.0 (Xcode 16.0+) Toolchain
let cameraModuleUrl = "https://github.com/CUBOX-Co-Ltd/dlite-sdk-sample-ios/releases/download/1.0.1/Cameramodule-xcode16.xcframework.zip"
let cameraModuleChecksum = "04cfd5a14ae206f4fdedeaf14c523fde690d353566b46a2b426b318e67bb6e33"
let dliteUrl = "https://github.com/CUBOX-Co-Ltd/dlite-sdk-sample-ios/releases/download/1.0.1/Dlite-xcode16.xcframework.zip"
let dliteChecksum = "e6ec64f6739dee9796224ada0bfd1d34dfe5cc1f2ca780d0af3f19f590548f04"
let inferenceUrl = "https://github.com/CUBOX-Co-Ltd/dlite-sdk-sample-ios/releases/download/1.0.1/Inferencemodule-xcode16.xcframework.zip"
let inferenceChecksum = "991a92f7e5dcb076cc50db36e0bfee09a1a062c35a2e32c313a7079a0f6aea1b"
#else
// MARK: - Swift 5.9 (Xcode 15.x) Toolchain
let cameraModuleUrl = "https://github.com/CUBOX-Co-Ltd/dlite-sdk-sample-ios/releases/download/1.0.1/Cameramodule-xcode15.xcframework.zip"
let cameraModuleChecksum = "40d6b561121c00fd1a867066b73b5f02149db98a0165b2dd18c0845fee9bdf29"
let dliteUrl = "https://github.com/CUBOX-Co-Ltd/dlite-sdk-sample-ios/releases/download/1.0.1/Dlite-xcode15.xcframework.zip"
let dliteChecksum = "ee70962248d99fd35144590a9f7c4194b452d874ba4673d5e2caeac20254b24b"
let inferenceUrl = "https://github.com/CUBOX-Co-Ltd/dlite-sdk-sample-ios/releases/download/1.0.1/Inferencemodule-xcode15.xcframework.zip"
let inferenceChecksum = "6d8dc2449c9e44d8641967588026671d5ed8ff12bfb09b620980fe4a44cbd487"
#endif

let package = Package(
    name: "DliteSDK",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        // 개별 모듈
        .library(name: "Cameramodule", targets: ["Cameramodule"]),
        .library(name: "Inferencemodule", targets: ["Inferencemodule"]),
        .library(name: "Dlite", targets: ["Dlite"]),
        
        // 통합 SDK (사용자 편의성)
        .library(name: "DliteSDK", targets: ["Dlite", "Cameramodule", "Inferencemodule"])
    ],
    targets: [
        .binaryTarget(
            name: "Cameramodule",
            url: cameraModuleUrl,
            checksum: cameraModuleChecksum
        ),
        .binaryTarget(
            name: "Dlite",
            url: dliteUrl,
            checksum: dliteChecksum
        ),
        .binaryTarget(
            name: "Inferencemodule",
            url: inferenceUrl,
            checksum: inferenceChecksum
        )
    ]
)