//
//  MainHijabModels.swift
//  Hijabie App
//
//  Created by Qonitah Faridah on 27/10/23.
//

import SwiftUI
import SceneKit

struct MainHijabModels: View {
    
    
    @State var models = [
        Model(id: 0, name: "Model 1", modelName: "hijab model 1.usdz", details: "")]
              
   @State var index = 0
    
    
    
    var body: some View {
        NavigationView{
            ZStack{
                Rectangle()
                    .fill(Color.white)
                
                VStack{
                    SceneView(scene: SCNScene(named: models[index].modelName), options: [.autoenablesDefaultLighting, .allowsCameraControl])
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2)
                        .padding(.bottom, 100)
                    
                    ZStack{
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .frame(width: 170, height: 42)
                            .opacity(0.25)
                        HStack{
                            Button(action: {
                                //                                    CameraViewController()
                            }) {
                                Text("Try On")
                                    .frame(width: 69, height: 32)
                                    .background(Color.black.opacity(0.8))
                                    .clipShape(Capsule(style: .continuous))
                                    .foregroundStyle(Color.white)
                                    .fontWeight(.semibold)
                            }
                            
                            
                            NavigationLink(destination: MainCamera_AR()){
                                Text("Tutorial")
                                    .frame(width: 79, height: 32)
                                    .background(Color.black.opacity(0.8))
                                    .clipShape(Capsule(style: .continuous))
                                    .foregroundStyle(Color.white)
                                    .fontWeight(.semibold)
                            }
                        }
                        .padding()
                    }
                    
                    Text("Hijab Model:")
                        .background(RoundedRectangle(cornerRadius: 20, style: .continuous).fill(Color.white).frame(width: 309,height: 28).opacity(0.6))
                    
                }
            }
            .ignoresSafeArea()
        }
        
    }
}

struct Model : Identifiable {
    
    var id : Int
    var name : String
    var modelName : String
    var details : String
}


#Preview {
    MainHijabModels()
}
