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

    let filters = ["Filter 1", "Filter 2", "Filter 3"]

    var body: some View {
        GeometryReader { geometry in
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
                .padding(20)
                .frame(width: geometry.size.width)
            }
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
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.red, lineWidth: isSelected ? 3 : 0)
                )
        }
    }
}
