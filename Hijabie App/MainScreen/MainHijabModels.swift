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
    
    @ObservedObject var faceData: FaceShapeData
    
//    @State private var faceLabel : String = UserDefaults.standard.string(forKey: "faceLabel") ?? "Default"
    @State private var selectedHijab : Int = 0
    @State private var isPresented = false
    
    @State var index = 0
    @State var selectedTab = 0
    @State var degree = 90.0
    @State var isAppear: Bool = false
    @State var player: AVPlayer?
    @State var currentVideoIndex: Int = 0
    @State var videos = [Videos]()
    @State var modelName: String = "Hijab1"
    
    
    @State var models = [
        Model(id: 0, name: "Pashmina", modelName: "hijab1.usdz", details: "1"),
        Model(id: 1,name: "Instant Jersey", modelName: "helmet_blender.usdz", details: "2"),
        Model(id: 2,name: "Square", modelName: "helmet_blender.usdz", details: "3"),
        Model(id: 3,name: "Coming Soon", modelName: "helmet_blender.usdz", details: "4"),
        Model(id: 4,name: "Coming Soon", modelName: "helmet_blender.usdz", details: "5")]
    
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
    
    var UDData = UserDefaults.standard
    
    var body: some View {
        
        //        ZStack{
        //
        //            BackgroundView()
        
        ZStack(alignment: .bottom){
            
           
            
            TabView(selection: $selectedTab) {
                
                
                ZStack{
                    
                    
                    // conditional untuk RealityKit AR model view
                    if (selectedHijab == 0 || selectedHijab == 1 || selectedHijab == 2){
                        
                        FirstHijabModel(faceData: faceData, selectedHijab: $selectedHijab)
                        //                        SecondHijabModel()
                            .safeAreaInset(edge: .bottom, alignment: .center, spacing: 0) {
                                Color.clear
                                    .frame(height: 0)
                                    .background(Material.bar)
                            }
                    } else{
                        EmptyView()
                    }
                    
                    //                    else if (selectedHijab == 1){
                    ////                        FirstHijabModel(faceData: faceData, modelName: "Hijab3")
                    //                        SecondHijabModel()
                    //                            .safeAreaInset(edge: .bottom, alignment: .center, spacing: 0) {
                    //                                Color.clear
                    //                                    .frame(height: 0)
                    //                                    .background(Material.bar)
                    //                            }
                    //                    }
                    //                    else if (selectedHijab == 2){
                    //                        FirstHijabModel(faceData: faceData, selectedHijab: $selectedHijab)
                    //                            .safeAreaInset(edge: .bottom, alignment: .center, spacing: 0) {
                    //                                Color.clear
                    //                                    .frame(height: 0)
                    //                                    .background(Material.bar)
                    //                            }
                    //                    }
                    //                    else if (selectedHijab == 3){
                    //                        FourthHijabModels()
                    //                            .safeAreaInset(edge: .bottom, alignment: .center, spacing: 0) {
                    //                                Color.clear
                    //                                    .frame(height: 0)
                    //                                    .background(Material.bar)
                    //                            }
                    //                    }
                    //                    else if (selectedHijab == 4){
                    //                        FifthHijabModels()
                    //                            .safeAreaInset(edge: .bottom, alignment: .center, spacing: 0) {
                    //                                Color.clear
                    //                                    .frame(height: 0)
                    //                                    .background(Material.bar)
                    //                            }
                    //                    }
                    //                    else {
                    //                        ZStack{
                    //                            Text("Coming Soon")
                    //                                .font(.system(size: 20, weight: .light))
                    //                                .foregroundStyle(.white)
                    //                                .multilineTextAlignment(.center)
                    //                                .padding()
                    //                            .background(.ultraThinMaterial)}
                    //                    }
                    

//                    Button(action: {
//                       UDData.removeObject(forKey: "faceLabel")
//                       UDData.removeObject(forKey: "isOnboardingComplete")
//                       showOnboarding = true
//                    }) {
//                       Text("Reset")
//                    }
//
//                    if showOnboarding {
//                       OnBoarding1View()
//                    }
                    
                    namaModel(models: $models, index: $index)
                        .offset(y:245)
                    
                    ChooseHijabModel(index: $index, models: $models, isAppear: $isAppear, selectedHijab: $selectedHijab, player: $player, videos: $videos, currentVideoIndex: $currentVideoIndex)
                        .position(.init(x: 195, y: 695))
                    
                    
                }
                .ignoresSafeArea(.all, edges: .top)
                .tag(0)
                
                
                TutorialView(models: $models, selectedHijab: $selectedHijab, index: $index)
                //                    .ignoresSafeArea(.all, edges: .top)
                    .tag(1)
                //
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
        .onAppear{
            isPresented = true
        }
        .sheet(isPresented: $isPresented, content: {OnBoarding4View()
        })
        //        .alert(isPresented: $showAlert) {
        //            Alert(title: Text("Tip:"), message: Text("Tie your hair\nor use an inner hijab\nto achieve a better hijab visualization"), dismissButton: .default(Text("OK")))
        //        }
        //    }
    }
    
//    func clearUserDefaults() {
//        let defaults = UserDefaults.standard
//        let dictionary = defaults.dictionaryRepresentation()
//        dictionary.keys.forEach { key in
//            defaults.removeObject(forKey: "faceLabel")
//        }
//    }
    
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
            
            
        }
    }
}
