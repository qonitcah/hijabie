//
//  MainCamera+AR.swift
//  Hijabie App
//
//  Created by Qonitah Faridah on 27/10/23.
//

import SwiftUI

struct MainCamera_AR: View {
    var body: some View {
        NavigationView{
            ZStack{
                ARViewContainer()
                VStack{
                    ZStack{
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .frame(width: 170, height: 42)
                            .opacity(0.25)
                        HStack{
                            NavigationLink(destination: MainCamera_AR()){
                                Text("Try On")
                                    .frame(width: 69, height: 32)
                                    .background(Color.black.opacity(0.8))
                                    .clipShape(Capsule(style: .continuous))
                                    .foregroundStyle(Color.yellow)
                                    .fontWeight(.bold)
                            }
                            NavigationLink(destination: MainCamera_AR()){
                                Text("Tutorial")
                                    .frame(width: 79, height: 32)
                                    .background(Color.black.opacity(0.8))
                                    .clipShape(Capsule(style: .continuous))
                                    .foregroundStyle(Color.white)
                                    .fontWeight(.light)
                            }
                        }
                        .padding()
                    }
                    
                    Text("Hijab Model:")
                        .background(RoundedRectangle(cornerRadius: 20, style: .continuous).fill(Color.white).frame(width: 309,height: 28).opacity(0.6))
                }
                .padding(.top, 530)
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    MainCamera_AR()
}
