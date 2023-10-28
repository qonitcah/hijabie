//
//  OnBoarding1View.swift
//  Hijabie App
//
//  Created by Qonitah Faridah on 22/10/23.
//

import SwiftUI

struct OnBoarding1View: View {
    var body: some View {
        NavigationView{
            ZStack{
                Rectangle()
                VStack{
                    Image("face.id")
                        .padding(.bottom, 25)
                        .frame(width: 193.0, height: 193.0)
                    
                    Text("How to Identify\nYour Facial Shape")
                        .font(.title2)
                        .multilineTextAlignment(.center)
                        .bold()
                        .padding(.bottom, 25)
                        .padding()
                        .foregroundColor(.black)
                    
                    HStack{
                        Image("hijab")
                            .resizable()
                            .frame(width: 40.0, height: 40.0)
                        Text("Remove your hijab/hat/glasses/hair\nor anything that may cover your face\nfor an optimal identification.")
                            .font(.body)
                            .fontWeight(.light)
                            .foregroundColor(.black)
                    }
                    .padding(.bottom, 25)
                    
                    HStack{
                        Image("face.dashed")
                        Text("Position your face in the camera\nframe. Then hold your head position\nstraight for a few minutes.")
                            .font(.body)
                            .fontWeight(.light)
                            .foregroundColor(.black)
                    }
                    .padding(.bottom, 75)
                    
                    NavigationLink(destination: OnBoarding2View()){
                        Text("Get Started")
                            .frame(width: 309.0, height: 50.0)
                            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                            .background(Color.black)
                            .clipShape(Capsule())
                            .foregroundStyle(Color.white)
                    }
                    
                }
                .padding(.top, 50)
            }
            .ignoresSafeArea()
        }
        .accentColor(.white)
        .navigationBarTitle("Cancel")
    }
}

#Preview {
    OnBoarding1View()
}
