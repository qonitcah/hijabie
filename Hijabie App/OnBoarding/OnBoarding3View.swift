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
                    .blur(radius: 5.0)
                
                VStack{
                    Text("The Result")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.top, 60)
                    
                    Spacer()
                    
                    Text("Your facial shape\nis likely to identified as..")
                        .fontWeight(/*@START_MENU_TOKEN@*/.light/*@END_MENU_TOKEN@*/)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.white)
                        .font(.custom("SF Pro Text", size: 20))
                        
                    
                    Spacer()
                    
                    Text(faceData.faceLabel)
                        .fontWeight(.bold)
                        .font(.custom("SF Compact", size: 38))
                        .foregroundColor(.white)
                        
                        
                        
                        
                    Spacer()
                    
                    Image("ceklis")
                        .padding(.bottom, 178)
                
                    
                    NavigationLink(destination: MainHijabModels(faceData: faceData)){
                    Text("Next")
                        .frame(width: 309.0, height: 50.0)
                        .background(Color.white)
                        .clipShape(Capsule(style: .continuous))
                        .foregroundStyle(Color.black)
                        .padding(.bottom, 80)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
            }
            .ignoresSafeArea()
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    OnBoarding3View()
}
