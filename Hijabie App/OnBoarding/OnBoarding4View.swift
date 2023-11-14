//
//  OnBoarding4View.swift
//  Hijabie App
//
//  Created by Qonitah Faridah on 12/11/23.
//

import Foundation
import SwiftUI

struct OnBoarding4View: View {
    @State var isAppear: Bool = true
    
    var body: some View {
        if isAppear{
            Text("Tip:\nTie your hair to achieve\na better hijab visualization")
                .font(.system(size: 20, weight: .light))
                .foregroundStyle(.white)
                .multilineTextAlignment(.center)
                .padding()
                .background(.ultraThinMaterial,
                            in: RoundedRectangle(cornerRadius: 20, style: .continuous))
                .onAppear {
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.5){
                        withAnimation {
                            self.isAppear = false
                        }
                    }
                }
        }
    }
}
