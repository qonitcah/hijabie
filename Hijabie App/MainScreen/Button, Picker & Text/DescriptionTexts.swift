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
//        .background(RoundedRectangle(cornerRadius: 20, style: .continuous).fill(Color.white).frame(width: 250,height: 28).opacity(0.7))
        .frame(height: 28)
        .background(.ultraThinMaterial,
                    in: RoundedRectangle(cornerRadius: 30, style: .continuous))
        .foregroundColor(.white)
        
    }
}
