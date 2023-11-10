//
//  ContentView.swift
//  Hijabie App
//
//  Created by Qonitah Faridah on 17/10/23.
//

import SwiftUI
import RealityKit

struct ContentView: View {
//    @ObservedObject var faceData: FaceShapeData
    @StateObject var faceData: FaceShapeData = FaceShapeData()
    
    var body: some View {
        ZStack {
//        FaceDetection(faceData: faceData)
//            Text(faceData.faceLabel)
            FirstHijabModel(faceData: faceData)
            
            
        }
        .padding()
    }
}

class FaceShapeData: ObservableObject{
    @Published var faceLabel: String = ""
    @Published var faceConfidence: Double = 0.0
}

#Preview {
    ContentView()
}
