//
//  OnBoarding4View.swift
//  Hijabie App
//
//  Created by Qonitah Faridah on 12/11/23.
//

import AVKit
import SwiftUI

struct OnBoarding4View: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var player: AVPlayer?
    
    
    var body: some View {
        VStack{
            
            CustomVideoController(player: AVPlayer(url: URL(string: "inner")!), startTime: 0.0)
                .frame(height: 320)
                .onTapGesture{
                    presentationMode.wrappedValue.dismiss()
                }
            
            Text("Tip:\nTie your hair or use inner hijab\nto achieve a better hijab visualization")
                .font(.system(size: 20, weight: .light))
                .foregroundStyle(.white)
                .multilineTextAlignment(.center)
                .padding()
                .background(.ultraThinMaterial,
                            in: RoundedRectangle(cornerRadius: 20, style: .continuous))
                .onTapGesture{
                    presentationMode.wrappedValue.dismiss()
                }
            
            
        }
    }
}

