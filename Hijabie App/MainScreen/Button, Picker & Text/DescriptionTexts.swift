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

struct stepDescription: View {
    @Binding var videos: [Videos]
    @Binding var index: Int
    @Binding var indexText: Int
    
    var body: some View {
        
            Text(videos[index].step[indexText].text)
                .multilineTextAlignment(.center)
        .padding()
//        .frame(height: 76)
        .background(.ultraThinMaterial,
                    in: RoundedRectangle(cornerRadius: 20, style: .continuous))
        .foregroundColor(.black)
        .opacity(0.7)
    }
    
}
