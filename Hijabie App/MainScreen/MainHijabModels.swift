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
        Model(id: 0, name: "Pashmina", modelName: "hijab1.usdz", details: "1"),
        Model(id: 1,name: "Coming Soon", modelName: "helmet_blender.usdz", details: "2"),
        Model(id: 2,name: "Coming Soon", modelName: "helmet_blender.usdz", details: "3")]
    @State var index = 0
    @State private var selectedFilterIndex: Int = 0
    @State var ARViewToShow: Bool = false
    @State var tutorViewToShow: Bool = false
    
    let filters = ["Filter 1", "Filter 2", "Filter 3"]
    

    var body: some View {
        
        ZStack{
                if (!ARViewToShow){
                    Rectangle()
                    .fill(Color.white)
                    
                } else {
                    if (!tutorViewToShow) {
                        MainCamera_AR(models: $models, selectedFilterIndex: $selectedFilterIndex, index: $index, ARViewToShow: $ARViewToShow, tutorViewToShow: $tutorViewToShow)
                    } else {
                        TutorialView(models: $models, selectedFilterIndex: $selectedFilterIndex, index: $index, ARViewToShow: $ARViewToShow, tutorViewToShow: $tutorViewToShow)
                    }
                }
                
            if (!ARViewToShow){
                VStack(){
                    SceneView(scene: SCNScene(named: models[index].modelName), options: [.autoenablesDefaultLighting, .allowsCameraControl])
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2)
                    .padding(.bottom, 50)
                    
                    ButtonTryTutorial(models: $models,selectedFilterIndex: $selectedFilterIndex, index: $index, ARViewToShow: $ARViewToShow, tutorViewToShow: $tutorViewToShow)
                    
                    namaModel(models: $models, index: $index)
                    
                    ChooseHijabModel(selectedFilterIndex: $selectedFilterIndex, index: $index)
                }
                .padding(.top, 100)
                        
                    } else {
                        
                        EmptyView()
                            
                    }
                    
        }
            .ignoresSafeArea()
            .navigationBarBackButtonHidden()
    }
    
    
}

struct namaModel: View {
    @Binding var models: [Model]
    @Binding var index: Int
    
    var body: some View {
        HStack{
            Text("Hijab Model:")
            
            Text(models[index].name)
                .bold()
        }
        .background(RoundedRectangle(cornerRadius: 20, style: .continuous).fill(Color.gray).frame(width: 250,height: 28).opacity(0.25))
        .foregroundColor(.black)
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
