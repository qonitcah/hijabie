//
//  FirstHijabModel.swift
//  Hijabie App
//
//  Created by Qonitah Faridah on 23/10/23.
//
import SwiftUI
import RealityKit
import ARKit

struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        
        if !ARFaceTrackingConfiguration.isSupported{
            print("Your phone not supported")
        }else{
            
            let configuration = ARFaceTrackingConfiguration()
            arView.session.run(configuration)
            
            
            if let anchor = try? Entity.loadAnchor(named: "helmetAR", in: nil) {
                arView.scene.addAnchor(anchor)
            }
            
            
        }
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    

}
