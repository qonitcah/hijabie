//
//  MainCamera+AR.swift
//  Hijabie App
//
//  Created by Qonitah Faridah on 27/10/23.
//

import SwiftUI

struct MainCamera_AR: View {
    
    //    @Binding var models: [Model]
    //    @Binding var selectedFilterIndex: Int
    //    @Binding var index: Int
    //    @Binding var ARViewToShow: Bool
    //    @Binding var tutorViewToShow: Bool
    @State var models = [
        Model(id: 0, name: "Pashmina", modelName: "hijab1.usdz", details: "1"),
        Model(id: 1,name: "Coming Soon", modelName: "helmet_blender.usdz", details: "2"),
        Model(id: 2,name: "Coming Soon", modelName: "helmet_blender.usdz", details: "3"),
        Model(id: 3,name: "Coming Soon", modelName: "helmet_blender.usdz", details: "4"),
        Model(id: 4,name: "Coming Soon", modelName: "helmet_blender.usdz", details: "5")]
    
    @State var index = 0
    @State private var selectedFilterIndex: Int = 0
    @State var ARViewToShow: Bool = false
    @State var tutorViewToShow: Bool = false
    @ObservedObject var faceData: FaceShapeData
    
    let filters = ["Filter 1", "Filter 2", "Filter 3", "Filter 4", "Filter 5"]
    
    var body: some View {
        ZStack{
            ARViewContainer(faceData: faceData)
        
            ButtonTryTutorial(models: $models, selectedFilterIndex: $selectedFilterIndex, index: $index, ARViewToShow: $ARViewToShow, tutorViewToShow: $tutorViewToShow)
            
            ChooseHijabModel(selectedFilterIndex: $selectedFilterIndex, index: $index, models: $models)
            
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden()
        
        
    }
    
}



struct Model : Identifiable {
    
    var id : Int
    var name : String
    var modelName : String
    var details : String
}


//#Preview {
//    MainCamera_AR(models: [.constant(0)], selectedFilterIndex: .constant(0), index: .constant(0))
//}
