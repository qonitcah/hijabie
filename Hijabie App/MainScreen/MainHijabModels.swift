//
//  MainHijabModels.swift
//  Hijabie App
//
//  Created by Qonitah Faridah on 27/10/23.
//

import SwiftUI
import RealityKit
import ARKit

enum TabbedItems: Int, CaseIterable{
    case tryOn = 0
    case tutor
    
    var title: String{
        switch self {
        case .tryOn:
            return "TRY ON"
        case .tutor:
            return "HOW TO WEAR"
            
        }
    }
}

struct MainHijabModels: View {
    
    @State var models = [
        Model(id: 0, name: "Pashmina", modelName: "hijab1.usdz", details: "1"),
        Model(id: 1,name: "Coming Soon", modelName: "helmet_blender.usdz", details: "2"),
        Model(id: 2,name: "Coming Soon", modelName: "helmet_blender.usdz", details: "3"),
        Model(id: 3,name: "Coming Soon", modelName: "helmet_blender.usdz", details: "4"),
        Model(id: 4,name: "Coming Soon", modelName: "helmet_blender.usdz", details: "5")]
    @State var index = 0
    @State private var selectedFilterIndex: Int = 0
    @State var selectedTab = 0
    @ObservedObject var faceData: FaceShapeData
    @State var degree = 90.0
    
    
    let array : [MyColors] =  [MyColors(id: 0, name: "RED", color: Color.red),
                               MyColors(id: 1, name: "ORANGE",color: Color.orange),
                               MyColors(id: 2, name: "YELLOW", color: Color.yellow),
                               MyColors(id: 3, name: "GREEN", color: Color.green),
                               MyColors(id: 4, name: "BLUE", color: Color.blue),
                               MyColors(id: 5, name: "BLACK", color: Color.black),
                               MyColors(id: 6, name: "GRAY", color: Color.gray),
                               MyColors(id: 7, name: "PINK", color: Color.pink),
                               MyColors(id: 8, name: "BROWN", color: Color.brown),
                               MyColors(id: 9, name: "LILAC", color: Color.purple)]
    
    
    var body: some View {
        ZStack(alignment: .bottom){
            TabView(selection: $selectedTab) {
                ZStack{
                    
                    ARViewContainer(faceData: faceData)
                        .safeAreaInset(edge: .bottom, alignment: .center, spacing: 0) {
                            Color.clear
                                .frame(height: 0)
                                .background(Material.bar)
                        }
                    
                    ZStack{
                        
                        ColorWheelPicker(degree: $degree, array: array, circleSize: 393)
                            .offset(y: 350)
//                            .shadow(color: .white, radius: 2, x: 0, y: 0)
                        
                        ChooseHijabModel(selectedFilterIndex: $selectedFilterIndex, index: $index, models: $models)
                    }
                }
                .ignoresSafeArea(.all, edges: .top)
                .tag(0)
                
                TutorialView(models: $models, selectedFilterIndex: $selectedFilterIndex, index: $index)
                    .tag(1)
            }
            
            
            ForEach((TabbedItems.allCases), id: \.self){ item in
                Button{
                    selectedTab = item.rawValue
                } label: {
                    
                    TabBarView(selectedTab: $selectedTab).previewDisplayName("TabBarView")
                    
                }
            }
            .padding(.leading, 75)
            .frame(height: 70)
            .background(Color(.systemGray6))
            
            
        }
        .navigationBarBackButtonHidden()
    }
}


struct MyColors : Identifiable {
    let id: Int
    let name: String
    let color: Color
}


struct Model : Identifiable {
    
    var id : Int
    var name : String
    var modelName : String
    var details : String
}

struct TabBarView: View {
    //    var tabbarItems: [String]
    
    @Binding var selectedTab: Int
    var tabbedItems = ["TRY ON", "HOW TO WEAR"]
    
    
    var body: some View {
        ScrollViewReader { scrollView in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(tabbedItems.indices, id: \.self) { index in
                        
                        Text(tabbedItems[index])
                            .font(.subheadline)
                            .padding(.horizontal)
                            .padding(.vertical)
                            .foregroundColor(selectedTab == index ? .white : .gray)
                            .background(Capsule().stroke(selectedTab == index ? .white : .clear))
                            .onTapGesture {
                                withAnimation(.easeInOut) {
                                    selectedTab = index
                                }
                            }
                    }
                }
            }
            .padding()
            //            .background(Color(.systemGray6))
            //            .cornerRadius(25)
            
        }
    }
}

//
//extension MainHijabModels{
//    func CustomTabItem(title: String, isActive: Bool) -> some View{
//
//        ScrollViewReader { scrollView in
//            ScrollView(.horizontal, showsIndicators: false) {
//
//                ZStack{
//
////                    Text(title)
////                        .font(.system(size: 14))
////                        .foregroundColor(isActive ? .white : .gray)
//
//                    if isActive{
//                        Text(title)
//                            .font(.system(size: 17))
//                            .padding(.horizontal)
//                            .padding(.vertical, 2)
//                            .foregroundColor(isActive ? .white : .gray)
//
//                        //                            .background(Capsule().foregroundColor(isActive ? .blue : .clear))
//
//                    }
//                }
//
//            }
//            //            .frame(width: isActive ? .infinity : 38, height: 38)
//            //                            .background()
//            //            .background(isActive ? .purple.opacity(0.4) : .clear)
//            //            .cornerRadius(30)
//
//        }
//        .padding()
//        .background(Color(.systemGray6))
//        .cornerRadius(25)
//    }
//}
