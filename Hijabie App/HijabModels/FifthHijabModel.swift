import SwiftUI
import SceneKit

struct FifthHijabModels: View {
    
    
    var body: some View {
        
        
        SceneView(scene: SCNScene(named: "hijab1.usdz"), options: [.autoenablesDefaultLighting, .allowsCameraControl])
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2)
            .padding(.bottom, 50)
        
        
    }
    
}
