//
//  OnBoarding4View.swift
//  Hijabie App
//
//  Created by Qonitah Faridah on 12/11/23.
//

import AVKit
import SwiftUI

struct OnBoarding4View: View {
    
    @Environment(\.dismiss) var dismiss
//    @ObservedObject var faceData: FaceShapeData = FaceShapeData()
//    var UDData = UserDefaults.standard
    
    
    var body: some View {
        
//        NavigationView{
            ZStack{
                Color.white.ignoresSafeArea(.all)
//                Rectangle()
                VStack{
                    Spacer()
                    
                    Image("ponytail")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 200.0)
//                        .padding(.bottom, 25)
                    
//                    Spacer()
                    
                    Text("Tip:")
                        .font(.title2)
                        .multilineTextAlignment(.center)
                        .bold()
//                        .padding(.bottom, 25)
                        .padding()
                        .foregroundColor(.black)
                    
//                    Spacer()
                    
                    Text("Tie your hair\nor use an inner hijab\nto achieve a better hijab visualization")
                        .font(.system(size: 20, weight: .light))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                    Button("OK") {
                                    dismiss()
                                }
                    .frame(width: 309.0, height: 50.0)
                                                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                                                .background(Color.black)
                                                .clipShape(Capsule())
                                                .foregroundStyle(Color.white)
                    Spacer()
                    
//                    NavigationLink(destination: MainHijabModels(faceData: faceData)){
//                        Text("Next")
//                            .frame(width: 309.0, height: 50.0)
//                            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
//                            .background(Color.black)
//                            .clipShape(Capsule())
//                            .foregroundStyle(Color.white)
//                            .padding(.bottom, 80)
//                            .onAppear(perform: {
//                                UDData.set(true, forKey: "isOnboardingComplete")
//                            })
//                    }
                    
                }
                .padding(.top, 50)
            }
            .ignoresSafeArea()
        }
//        .accentColor(.white)
//        .navigationBarTitle("Cancel")
        
    }



#Preview {
    OnBoarding4View()
}
