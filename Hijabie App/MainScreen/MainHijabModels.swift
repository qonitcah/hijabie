//
//  MainHijabModels.swift
//  Hijabie App
//
//  Created by Qonitah Faridah on 27/10/23.
//

import SwiftUI

struct MainHijabModels: View {
    var body: some View {
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
                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                    .background(Color.black)
                    .clipShape(Capsule(style: .continuous))
                    .foregroundStyle(Color.white)
                    .fontWeight(.semibold)
                    
                    Button("Tutorial") {
                        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                    }
                    .frame(width: 79, height: 32)
                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                    .background(Color.black)
                    .clipShape(Capsule(style: .continuous))
                    .foregroundStyle(Color.white)
                    .fontWeight(.semibold)
                }
                .padding()
            }
            
                Text("Hijab Model:")
                .background(RoundedRectangle(cornerRadius: 20, style: .continuous).fill(Color.red).frame(width: 309,height: 28).opacity(0.6))
            
        }
    }
}

#Preview {
    MainHijabModels()
}
