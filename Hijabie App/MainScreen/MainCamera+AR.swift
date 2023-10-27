//
//  MainCamera+AR.swift
//  Hijabie App
//
//  Created by Qonitah Faridah on 27/10/23.
//

import SwiftUI

struct MainCamera_AR: View {
    var body: some View {
        ZStack{
            ARViewContainer()
            VStack{
                ZStack{
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .frame(width: 170, height: 42)
                        .opacity(0.25)
                    HStack{
                        Button("Try On") {
                            /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                        }
                        .frame(width: 69, height: 32)
                        .background(Color.black.opacity(0.8))
                        .clipShape(Capsule(style: .continuous))
                        .foregroundStyle(Color.yellow)
                        .fontWeight(.bold)
                        
                        
                        Button("Tutorial") {
                            /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                        }
                        .frame(width: 79, height: 32)
                        .background(Color.black.opacity(0.8))
                        .clipShape(Capsule(style: .continuous))
                        .foregroundStyle(Color.white)
                        .fontWeight(.light)
                        
                    }
                    .padding()
                }
                
                Text("Hijab Model:")
                    .background(RoundedRectangle(cornerRadius: 20, style: .continuous).fill(Color.white).frame(width: 309,height: 28).opacity(0.6))
            }
            .padding(.top, 530)
        }
    }
}

#Preview {
    MainCamera_AR()
}
