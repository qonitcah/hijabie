//
//  DescriptionTexts.swift
//  Hijabie App
//
//  Created by Qonitah Faridah on 14/11/23.
//
import SwiftUI

struct namaModel: View {
    @Binding var models: [Model]
    @Binding var index: Int
    
    var body: some View {
        HStack{
            
            
            Text("Hijab Model:")
            
            Text(models[index].name)
                .bold()
        }
        .padding()
        .frame(height: 28)
        .background(.ultraThinMaterial,
                    in: RoundedRectangle(cornerRadius: 30, style: .continuous))
        .foregroundColor(.white)
        
    }
}

//struct stepDescription: View {
//    let stepText: [StepText]
//    
//    var body: some View {
//        HStack{
//            
//            Text(stepText[index].name)
//                .multilineTextAlignment(.center)
//        }
//        .padding()
////            .frame(height: 28)
//            .background(.ultraThinMaterial,
//                        in: RoundedRectangle(cornerRadius: 10, style: .continuous))
//            .foregroundColor(.black)
//    }
//        
//}
