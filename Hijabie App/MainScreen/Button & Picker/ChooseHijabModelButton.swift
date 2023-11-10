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
    @Binding var isAppear: Bool
    @Binding var selectedHijab : Int
    
    let filters = ["Filter 1", "Filter 2", "Filter 3", "Filter 4", "Filter 5"]
    let hijabModels = ["firstHijab","secondHijab","firstHijab", "firstHijab", "firstHijab"] // nama - nama image hijab
    
    var body: some View {
        
        
        
        GeometryReader { geometry in
            
            VStack{
                Button {
                    isAppear.toggle()
                } label: {
                    Image(systemName: "chevron.down")
                        .font(.system(size: 40))
                    //                        .foregroundColor(Color.white)
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack(spacing: 20) {
                        Spacer().frame(width: 180 * CGFloat(selectedHijab))
                        
                        ForEach(0..<hijabModels.count, id: \.self) { filterIndex in
                            
                            FilterItemView(
                                imageName: hijabModels[filterIndex],
                                isSelected: filterIndex == selectedHijab
                            )
                            .onTapGesture {
                                withAnimation {
                                    selectedHijab = filterIndex
                                    index = filterIndex
//                                    selectedHijab = filterIndex
                                    
                                    let _ = print(selectedHijab)
                                    let _ = print(filterIndex)
                                }
                            }
                        }
                    }
                    .padding()
                    .frame(width: CGFloat(hijabModels.count) * 120)
                }
                
                
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity, alignment: .bottom)
            .padding(.bottom, 20)
            
            
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
                    .frame(width: 86, height: 86)
                    .shadow(color: .black, radius: 50, x: 5.0, y: 10.0)
                    .cornerRadius(86)
                    .shadow(color: .black, radius: 5, x: 5.0, y: 5.0)
                    .overlay(
                        RoundedRectangle(cornerRadius: 86)
                            .stroke(Color.red, lineWidth: isSelected ? 4 : 0)
                    )
            }
            
        }
    }


//struct namaModel: View {
//    @Binding var models: [Model]
//    @Binding var index: Int
//
//    var body: some View {
//        HStack{
//
//
//            Text("Hijab Model:")
//
//            Text(models[index].name)
//                .bold()
//        }
//        .background(RoundedRectangle(cornerRadius: 20, style: .continuous).fill(Color.white).frame(width: 250,height: 28).opacity(0.7))
//        .foregroundColor(.black)
//    }
//}
