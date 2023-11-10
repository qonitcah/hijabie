////
////  MainCamera+AR.swift
////  Hijabie App
////
////  Created by Qonitah Faridah on 27/10/23.
////
//
//import SwiftUI
//import RealityKit
//import ARKit
//
//struct MainCamera_AR: View {
////    @State var models = [
////        Model(id: 0, name: "Pashmina", modelName: "hijab1.usdz", details: "1"),
////        Model(id: 1,name: "Coming Soon", modelName: "helmet_blender.usdz", details: "2"),
////        Model(id: 2,name: "Coming Soon", modelName: "helmet_blender.usdz", details: "3"),
////        Model(id: 3,name: "Coming Soon", modelName: "helmet_blender.usdz", details: "4"),
////        Model(id: 4,name: "Coming Soon", modelName: "helmet_blender.usdz", details: "5")]
//    @Binding var models: [Model]
//    @Binding var index: Int
//    @Binding var selectedFilterIndex: Int
//    @Binding var isAppear: Bool
//    @ObservedObject var faceData: FaceShapeData
//    
//    
//    let filters = ["Filter 1", "Filter 2", "Filter 3", "Filter 4", "Filter 5"]
//    
//    var body: some View {
//            ZStack{
//                
//                ARViewContainer(faceData: faceData)
//                
//                ChooseHijabModel(selectedFilterIndex: $selectedFilterIndex, index: $index, models: $models, isAppear: $isAppear)
//                
//            }
//            .ignoresSafeArea()
//
//            }
//            
//}
//
////            Text("Tip:\nTie your hair to achieve\na better hijab visualization")
////                .font(.system(size: 20, weight: .light))
////                .foregroundStyle(.white)
////                .multilineTextAlignment(.center)
////                .padding()
////                .background(.ultraThinMaterial,
////                            in: RoundedRectangle(cornerRadius: 20, style: .continuous))
//
//
////struct Model : Identifiable {
////    
////    var id : Int
////    var name : String
////    var modelName : String
////    var details : String
////}
//
//
////#Preview {
////    MainCamera_AR(models: [.constant(0)], index: .constant(0), selectedFilterIndex: .constant(0))
////}
