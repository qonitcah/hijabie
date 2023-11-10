//
//  FirstHijabModel.swift
//  Hijabie App
//
//  Created by Qonitah Faridah on 23/10/23.
//
import SwiftUI
import RealityKit
import ARKit

//enum Objects : String, CaseIterable {
//    case oval = "Oval"
//    case square = "Square"
//    case round = "Round"
//    case heart = "Heart"
//    case oblong = "Oblong"
//}
//
//var object = ["Hijab1oval", "Hijab1square", "Hijab1round", "Hijab1heart", "Hijab1oblong"]

struct FirstHijabModel: UIViewRepresentable {
    
    @ObservedObject var faceData: FaceShapeData
//    @State private var selectedObject = 0
    
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        
        if !ARFaceTrackingConfiguration.isSupported{
            print("Your phone not supported")
        }else{
            
            let configuration = ARFaceTrackingConfiguration()
            arView.session.run(configuration)
            
            
            if faceData.faceLabel == "Oval"{
                guard let anchor = try? Entity.loadAnchor(named: "Hijab1oval", in: nil) else { return arView }
                    arView.scene.addAnchor(anchor)
            }
            else if faceData.faceLabel == "Square"{
                guard let anchor = try? Entity.loadAnchor(named: "Hijab1square", in: nil) else { return arView }
                    arView.scene.addAnchor(anchor)
            }
            else if faceData.faceLabel == "Round"{
                guard let anchor = try? Entity.loadAnchor(named: "Hijab1round", in: nil) else { return arView}
                    arView.scene.addAnchor(anchor)
            }
            else if faceData.faceLabel == "Oblong"{
                guard let anchor = try? Entity.loadAnchor(named: "Hijab1oblong", in: nil) else { return arView}
                    arView.scene.addAnchor(anchor)
            }
            else if faceData.faceLabel == "Heart"{
                guard let anchor = try? Entity.loadAnchor(named: "Hijab1heart", in: nil) else { return arView }
                    arView.scene.addAnchor(anchor)
            }
            
            
            
            
            
        }
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    

}
