////
////  MainScreenView.swift
////  Hijabie App
////
////  Created by Qonitah Faridah on 20/11/23.
////
//
//import SwiftUI
//
//enum TabbedItems: Int, CaseIterable{
//    case tryOn = 0
//    case tutor
//    
//    var title: String{
//        switch self {
//        case .tryOn:
//            return "TRY ON"
//        case .tutor:
//            return "HOW TO WEAR"
//            
//        }
//    }
//}
//
//
//struct MainScreenView: View {
//    
//    @ObservedObject var faceData: FaceShapeData
//    
//    @State var selectedTab = 0
//    @State private var selectedHijab : Int = 0
//    @State var index = 0
//    @State var models = [
//        Model(id: 0, name: "Pashmina", modelName: "hijab1.usdz", details: "1"),
//        Model(id: 1,name: "Instant Pashmina", modelName: "helmet_blender.usdz", details: "2"),
//        Model(id: 2,name: "Coming Soon", modelName: "helmet_blender.usdz", details: "3"),
//        Model(id: 3,name: "Coming Soon", modelName: "helmet_blender.usdz", details: "4"),
//        Model(id: 4,name: "Coming Soon", modelName: "helmet_blender.usdz", details: "5")]
//    
//    var body: some View {
//        
//        VStack/*(alignment: .bottom)*/{
//            
//            TabView(selection: $selectedTab) {
//                MainHijabModels(faceData: faceData)
//                    .ignoresSafeArea(.all, edges: .top)
//                    .tag(0)
//                
//                TutorialView(models: $models, selectedHijab: $selectedHijab, index: $index)
//                    .tag(1)
//            }
//            
//            ForEach((TabbedItems.allCases), id: \.self){ item in
//                Button{
//                    selectedTab = item.rawValue
//                } label: {
//                    
//                    TabBarView(selectedTab: $selectedTab).previewDisplayName("TabBarView")
//                    
//                }
//            }
//            .padding(.leading, 75)
//            .frame(height: 150)
//            .background(Color(.systemGray6))
//            
//        }
//        .navigationBarBackButtonHidden()
//        
//    }
//}
//
//
//struct TabBarView: View {
//    //    var tabbarItems: [String]
//    
//    @Binding var selectedTab: Int
//    var tabbedItems = ["TRY ON", "HOW TO WEAR"]
//    
//    
//    var body: some View {
//        ScrollViewReader { scrollView in
//            ScrollView(.horizontal, showsIndicators: false) {
//                HStack {
//                    ForEach(tabbedItems.indices, id: \.self) { index in
//                        
//                        Text(tabbedItems[index])
//                            .font(.subheadline)
//                            .padding(.horizontal)
//                            .padding(.vertical)
//                            .foregroundColor(selectedTab == index ? .white : .gray)
//                            .background(Capsule().stroke(selectedTab == index ? .white : .clear))
//                            .onTapGesture {
//                                withAnimation(.easeInOut) {
//                                    selectedTab = index
//                                }
//                            }
//                    }
//                }
//            }
//            .padding()
//           
//            
//        }
//    }
//}
