//
//  ButtonTryTutorial.swift
//  Hijabie App
//
//  Created by Qonitah Faridah on 30/10/23.
//

import Foundation
import SwiftUI

struct ButtonTryTutorial: View {
    @Binding var models: [Model]
    @Binding var selectedFilterIndex: Int
    @Binding var index: Int
    @Binding var ARViewToShow: Bool
    @Binding var tutorViewToShow: Bool
    
    @State var mainView: String = ""
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Color.black)
                .frame(width: 170, height: 42)
                .opacity(0.25)
            HStack{
                
                Button(action: {
//                    tutorViewToShow = false
                    ARViewToShow.toggle()
                    
                }) {
                    Text("Try On")
                        .frame(width: 69, height: 32)
                        .background(Color.black.opacity(0.8))
                        .clipShape(Capsule(style: .continuous))
                        .foregroundStyle(Color.white)
                        .fontWeight(.semibold)
                }
                
                Button(action: {
//                    ARViewToShow = false
                    tutorViewToShow.toggle()
                  
                }) {
                    Text("Tutorial")
                        .frame(width: 79, height: 32)
                        .background(Color.black.opacity(0.8))
                        .clipShape(Capsule(style: .continuous))
                        .foregroundStyle(Color.white)
                        .fontWeight(.semibold)
                }
            }
        }

        
    }
}
