//
//  SecondHijabModel.swift
//  Hijabie App
//
//  Created by Qonitah Faridah on 14/11/23.
//
import SwiftUI
import RealityKit
import ARKit


struct SecondHijabModel: UIViewRepresentable {
 
//    @ObservedObject var faceData: FaceShapeData


    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        
        if !ARFaceTrackingConfiguration.isSupported{
            print("Your phone not supported")
        }else{
            
            let configuration = ARFaceTrackingConfiguration()
            arView.session.run(configuration)
            
            
            if let anchor = try? Entity.loadAnchor(named: "Hijab2", in: nil) {
                arView.scene.addAnchor(anchor)
            }
        }
            

        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    

}
