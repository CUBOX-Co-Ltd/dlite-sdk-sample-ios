//
//  ContentView.swift
//  Sample
//
//  Created by CUBOX on 2/20/25.
//

import SwiftUI
import Cameramodule
import Dlite

struct ContentView: View {
    enum CameraType {
        case liveCapture
        case liveness
        case faceRecognition
    }
    
    @State private var isCompleted: Bool = false
    
    @State private var resultImage: UIImage? = nil
    
    // show
    @State private var currentType: CameraType = .liveness
    @State private var isShowView: Bool = false
    @State private var isShowSmartCapture: Bool = false
    
    var body: some View {
        ZStack {
            if isShowSmartCapture {
                SmartCaptureView(
                    option: .init(frontalPassedFrameCount: 30),
                    startRightAway: true,
                    onFrameState: { state in
                        
                    },
                    onCaptureResult: { result in
                        switch result {
                        case let .result(status, image, faceId):
                            if let image = image {
                                DispatchQueue.main.async {
                                    self.resultImage = image
                                    self.isShowSmartCapture = false
                                }
                            }
                            print("success, status: \(status) / faceId: \(faceId)")
                            
                        case let .error(errorStatus, errorMessage, exception):
                            print("error, exception: \(exception) / errorMessage: \(errorMessage)")
                        }
                    }
                )
            } else {
                VStack(spacing: 15) {
                    if let resultImage = resultImage {
                        Image(uiImage: resultImage)
                            .resizable()
                            .frame(width: 180, height: 220)
                    } else {
                        RoundedRectangle(cornerRadius: 12)
                            .frame(width: 180, height: 220)
                            .foregroundStyle(Color.gray.opacity(0.5))
                    }
                    
                    Button(action: {
                        isShowSmartCapture = true
                    }, label: {
                        Text("Live Capture")
                            .foregroundStyle(Color.black)
                            .frame(width: 180, height: 54)
                    })
                    .background(Color.green)
                    .clipShape(RoundedRectangle(cornerRadius: 12))

                    
                    Button(action: {
                        currentType = .faceRecognition
                        isShowView = true
                    }, label: {
                        Text("Face Recognition")
                            .foregroundStyle(Color.white)
                            .frame(width: 180, height: 54)
                    })
                    .background(Color.brown)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    
                    Button(action: {
                        currentType = .liveness
                        isShowView = true
                    }, label: {
                        Text("Liveness")
                            .foregroundStyle(Color.black)
                            .frame(width: 180, height: 54)
                    })
                    .background(Color.cyan)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                }
                .fullScreenCover(isPresented: $isShowView) {
                    createCameraView(type: currentType)
                }
            }
        }
        .ignoresSafeArea(.all)
    }
    
    private func createCameraView(type: CameraType) -> CameraView {
        var mode: CameraMode
        switch type {
        case .liveness:
            mode = .liveness(option: .init())
            
        case .faceRecognition:
            mode = .faceRecognition(option: .init())
            
        case .liveCapture:
            mode = .liveCapture(option: .init())
        }
        return CameraView(mode: mode) { result in
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
    
    private func initialize() {
        let option = DliteOption.Builder()
            .setLicenseKey("NCPAY-RNs4/WmL8Wl6qyt+PVYc4x6/XztI1ga9OdheqO/st7uuLSL0z3IP1AweWvNIlTh5")
//            .setFaceRecognitionBaseUrl("https://silver-frs-api.silverodyssey.kr/")
            .setModules(.inferenceModule)
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
}

#Preview {
    ContentView()
}
