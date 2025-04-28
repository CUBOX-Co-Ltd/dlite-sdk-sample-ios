## iOS SDK
Last modified: 2025.04.22 

<br/> <br/>


## SDK Requirements.

The minimum requirements for UIKit for iOS are:

- iOS 15+
- Swift 5.0+
- Xcode 16.1(16B40)

![이미지](https://ekyc-idis-dev.cuboxservice.com:3001/images/998258151336703694b74a8-791d-4c01-b11c-ea3475611d99)

<br/> <br/>

## SDK 설정

1. 세 가지의 라이브러리 .xcframework 파일을 Frameworks, Libraries, and Embedded Content에 추가해 주세요.
![이미지](https://ekyc-idis-dev.cuboxservice.com:3001/images/9982581511683789e2f018c-09a9-4b65-9438-bb40846a957c)

<br/> <br/>

2. Dlite Core Module은 Alamofire을 사용합니다.  Dynamic 형태인 AlamofireDynamic을 추가해주세요.
![이미지](https://ekyc-idis-dev.cuboxservice.com:3001/images/9982581510605110ea0eb3d-7670-47b5-98dd-40def15470c9)

<br/> <br/>


## SDK 초기화
1. <span style="color:red; font-weight:bold;">[!] You must provide a license key in setLicenseKey during initialization.</span>

```swift
    private func initialize() {
        let option = DliteOption.Builder()
            .setLicenseKey(“your license key”)
            .build()
        
        DliteSdk.with.initialize(option: option) { (completed, error) in
            if completed {
                isCompleted = true
                print("Initialization successful")
            } else {
                print("Initialization failed: \(error)")
            }
        }
    }
```

<br/> <br/>

## Using Camera View
1. The camera view runs once, returns the result, and then terminates.
2. You can modify the UI using the provided functions.
3. Result handling: Success - `CameraResult.result`, Failure - `CameraResult.error`
4. Create one of the following options: LiveCapture, FaceRecognition, or ActiveLiveness

```swift
private func createCameraView() -> CameraView {
    return CameraView(
        mode: .liveCapture(option: .init())
//          mode: .faceRecognition(option: .init(faceId: "fong", isCheckValidation: true))
//          model: .liveness(option: .init())
    ) { result in
        switch result {
        case let .result(succeedStatus, image, faceId):
            if let image = image {
                self.resultImage = image
            }
            break
        case let .error(errorStatus, errorMessage, exception):
            break
            
        default: break
        }
    }
}
```