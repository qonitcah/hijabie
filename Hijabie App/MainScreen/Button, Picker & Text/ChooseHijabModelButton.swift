//
//  PickerHijab.swift
//  Hijabie App
//
//  Created by Qonitah Faridah on 30/10/23.
//

import Foundation
import SwiftUI

struct ChooseHijabModel: View {
    
    @Binding var index: Int
    @Binding var models: [Model]
    @Binding var isAppear: Bool
    @Binding var selectedHijab : Int
    
    let filters = ["Filter 1", "Filter 2", "Filter 3", "Filter 4", "Filter 5"]
    let hijabModels = ["firstHijab","secondHijab","coming", "coming", "coming"] // nama - nama image hijab
    
    var body: some View {
        
        
        
        //        GeometryReader { geometry in
        
//        VStack{
//            Button {
//                isAppear.toggle()
//            } label: {
//                Image(systemName: "chevron.down")
//                    .font(.system(size: 40))
//                //                        .foregroundColor(Color.white)
//            }
        
        VStack{
            ScrollView(.horizontal, showsIndicators: false) {
                
                HStack(spacing: 20) {
                    //                        Spacer().frame(width: 180 /** CGFloat(selectedHijab)*/)
                    
                    ForEach(0..<hijabModels.count, id: \.self) { filterIndex in
                        
                        FilterItemView(
                            imageName: hijabModels[filterIndex],
                            isSelected: filterIndex == selectedHijab
                        )
                        .onTapGesture {
                            withAnimation {
                                selectedHijab = filterIndex
                                index = filterIndex
                                
                                //                                    let _ = print(selectedHijab)
                                //                                    let _ = print(filterIndex)
                            }
                        }
                    }
                }
                
                .frame(width: CGFloat(hijabModels.count) * 120)
                .padding()
            }
            
            
            
        }
    }
    
}


struct FilterItemView: View {
    
    let imageName:String
    let isSelected: Bool
    
    var body: some View {
        ZStack(alignment: .bottom) {
            
            Image(imageName) // Replace with your filter image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 76, height: 76)
                .shadow(color: .black, radius: 50, x: 5.0, y: 10.0)
                .cornerRadius(86)
                .shadow(color: .black, radius: 5, x: 5.0, y: 5.0)
                .overlay(
                    RoundedRectangle(cornerRadius: 86)
                        .stroke(Color.white, lineWidth: isSelected ? 4 : 0)
                )
        }
        
    }
}


