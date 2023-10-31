//
//  OnBoarding3View.swift
//  Hijabie App
//
//  Created by Qonitah Faridah on 22/10/23.
//

import SwiftUI


struct OnBoarding3View: View {
    @StateObject var faceData: FaceShapeData = FaceShapeData()
    
    var body: some View {
        NavigationView{
            ZStack{
                
                FaceDetection(faceData: faceData)
                
                Rectangle()
                    .fill(Color.black)
                    .opacity(0.5)
                
                VStack{
                    Text("The Result")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.bottom, 67)
                        .foregroundColor(.white)
                    
                    
                    Text("Your facial shape\nis likely to identified as..")
                        .fontWeight(/*@START_MENU_TOKEN@*/.light/*@END_MENU_TOKEN@*/)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.white)
                        .padding(.bottom, 20)
                        .font(.custom("SF Pro Text", size: 20))
                    
                    Text(faceData.faceLabel)
                        .font(.custom("SF Compact", size: 38))
                        .foregroundColor(.white)
                        .fontWeight(.heavy)
                        .padding(.bottom, 54)
                    
                    Image("ceklis")
                        .padding(.bottom, 100)
                    
                    NavigationLink(destination: MainHijabModels(faceData: faceData)){
                    Text("Next")
                        .frame(width: 309.0, height: 50.0)
                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                        .background(Color.white)
                        .clipShape(Capsule(style: .continuous))
                        .foregroundStyle(Color.black)
                    }
                }
                .padding(.bottom, 40)
            }
            .ignoresSafeArea()
        }
        .navigationBarBackButtonHidden()
        
    }
}

#Preview {
    OnBoarding3View()
}
