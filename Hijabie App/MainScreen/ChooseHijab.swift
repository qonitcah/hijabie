//
//  PickerHijab.swift
//  Hijabie App
//
//  Created by Qonitah Faridah on 30/10/23.
//

import Foundation
import SwiftUI

struct ChooseHijabModel: View {
    
    @Binding var selectedFilterIndex: Int
    @Binding var index: Int
    @Binding var models: [Model]
    
    let filters = ["Filter 1", "Filter 2", "Filter 3", "Filter 4", "Filter 5"]
    
    var body: some View {
        
            GeometryReader { geometry in
                VStack{
                ScrollView(.horizontal, showsIndicators: false) {
                    
                        HStack(spacing: 20) {
                            ForEach(0..<filters.count, id: \.self) { filterIndex in
                                FilterItemView(
                                    filterName: filters[filterIndex],
                                    isSelected: filterIndex == selectedFilterIndex
                                )
                                .onTapGesture {
                                    withAnimation {
                                        selectedFilterIndex = filterIndex
                                        index = filterIndex
                                    }
                                }
                            }
                        }
                        .padding()
                        .frame(width: CGFloat(filters.count) * 120)
                    }
                    namaModel(models: $models, index: $index)
                        .frame(width: geometry.size.width)
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity, alignment: .bottom)
                .padding(.bottom, 30)
            }
            
        }
    }




struct FilterItemView: View {
    let filterName: String
    let isSelected: Bool
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Image("baju") // Replace with your filter image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
                .shadow(color: .black, radius: 50, x: 5.0, y: 10.0)
                .cornerRadius(100)
                .shadow(color: .black, radius: 5, x: 5.0, y: 5.0)
                .overlay(
                    RoundedRectangle(cornerRadius: 100)
                        .stroke(Color.red, lineWidth: isSelected ? 4 : 0)
                )
        }
    }
}

struct namaModel: View {
    @Binding var models: [Model]
    @Binding var index: Int
    
    var body: some View {
        HStack{
            Text("Hijab Model:")
            
            Text(models[index].name)
                .bold()
        }
        .background(RoundedRectangle(cornerRadius: 20, style: .continuous).fill(Color.white).frame(width: 250,height: 28).opacity(0.7))
        .foregroundColor(.black)
    }
}
