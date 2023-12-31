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
        //        ZStack {
        ////        FaceDetection(faceData: faceData)
        ////            Text(faceData.faceLabel)
        //            FirstHijabModel(faceData: faceData, selectedHijab: $selectedHijab)
        //
        //
        //        }
        //        .padding()
        //    }
        EmptyView()
    }
}

class FaceShapeData: ObservableObject{
//    @Published var faceLabel: String = ""
    @Published var faceLabel : String = UserDefaults.standard.string(forKey: "faceLabel") ?? "Oval"
    @Published var faceConfidence: Double = 0.0
}

#Preview {
    ContentView()
}
