//
//  ContentView.swift
//  Sample
//
//  Created by CUBOX on 2/20/25.
//

import SwiftUI

struct ContentView: View {
    @State var resultImage: UIImage?
    
    var body: some View {
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
                
            }, label: {
                Text("Live Capture")
                    .foregroundStyle(Color.black)
                    .frame(width: 180, height: 54)
            })
            .background(Color.green)
            .clipShape(RoundedRectangle(cornerRadius: 12))

            
            Button(action: {
                
            }, label: {
                Text("Face Recognition")
                    .foregroundStyle(Color.white)
                    .frame(width: 180, height: 54)
            })
            .background(Color.brown)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            
            Button(action: {
                
            }, label: {
                Text("Liveness")
                    .foregroundStyle(Color.black)
                    .frame(width: 180, height: 54)
            })
            .background(Color.cyan)
            .clipShape(RoundedRectangle(cornerRadius: 12))
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
