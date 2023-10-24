//
//  FirstHijabModel.swift
//  Hijabie App
//
//  Created by Qonitah Faridah on 23/10/23.
//

import ARKit
import SceneKit

class FirstHijabModel: NSObject, VirtualContentController {
    
    var contentNode: SCNNode?
    
    var occlusionNode: SCNNode!
    
    /// - Tag: OcclusionMaterial
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        guard let sceneView = renderer as? ARSCNView,
            anchor is ARFaceAnchor else { return nil }

        #if targetEnvironment(simulator)
        #error("ARKit is not supported in iOS Simulator. Connect a physical iOS device and select it as your Xcode run destination, or select Generic iOS Device as a build-only destination.")
        #else
        /*
         Write depth but not color and render before other objects.
         This causes the geometry to occlude other SceneKit content
         while showing the camera view beneath, creating the illusion
         that real-world objects are obscuring virtual 3D objects.
         */
        let faceGeometry = ARSCNFaceGeometry(device: sceneView.device!)!
        faceGeometry.firstMaterial!.colorBufferWriteMask = []
        occlusionNode = SCNNode(geometry: faceGeometry)
        occlusionNode.renderingOrder = -1

        // Add 3D asset positioned to appear as "glasses".
        let urlPath = Bundle.main.url(forResource: "helmet", withExtension: "usdz")
        let faceOverlayContent = SCNReferenceNode(url: urlPath!)
        
        // Assign a random color to the text.
        let material = SCNMaterial.materialWithColor(anchor.identifier.toRandomColor())
        faceOverlayContent!.childNode(withName: "text", recursively: true)?.geometry?.materials = [material]

        contentNode = SCNNode()
        contentNode!.addChildNode(occlusionNode)
        contentNode!.addChildNode(faceOverlayContent!)
        #endif
        return contentNode
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
        guard let faceGeometry = occlusionNode.geometry as? ARSCNFaceGeometry,
            let faceAnchor = anchor as? ARFaceAnchor
            else { return }
        
        faceGeometry.update(from: faceAnchor.geometry)
    }

}

extension SCNMaterial {
    static func materialWithColor(_ color: UIColor) -> SCNMaterial {
        let material = SCNMaterial()
        material.lightingModel = .physicallyBased
        material.diffuse.contents = color
        return material
    }
}

extension UUID {
    /**
    Pseudo-randomly return one of the 14 fixed standard colors, based on this UUID.
    */
    func toRandomColor() -> UIColor {
        let colors: [UIColor] = [.red, .green, .blue, .yellow, .magenta, .cyan, .purple,
                                 .orange, .brown, .lightGray, .gray, .darkGray, .black, .white]
        let randomNumber = abs(self.hashValue % colors.count)
        return colors[randomNumber]
    }
}
