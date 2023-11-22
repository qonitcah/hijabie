//
//  OnBoarding4View.swift
//  Hijabie App
//
//  Created by Qonitah Faridah on 12/11/23.
//

import AVKit
import SwiftUI

struct OnBoarding4View: View {
//    @Environment(\.presentationMode) var presentationMode
    @State var introPlayer = AVPlayer(url: URL(string: "inner")!)
    @State private var isPresenting = false
    
    var body: some View {
        Button("Present Full-Screen Cover") {
                    isPresenting.toggle()
                }
                .fullScreenCover(isPresented: $isPresenting,
                                 onDismiss: didDismiss) {
                    
        ZStack{
            
            VideoPlayer(player: introPlayer)
                .frame(height: 320)
//                .onTapGesture{
//                    presentationMode.wrappedValue.dismiss()
//                }
            
            VStack{
                
                Text("Tip:\nTie your hair or use inner hijab\nto achieve a better hijab visualization")
                    .font(.system(size: 20, weight: .light))
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                    .padding()
                    .background(.ultraThinMaterial,
                                in: RoundedRectangle(cornerRadius: 20, style: .continuous))
                //                    .onTapGesture{
                //                        presentationMode.wrappedValue.dismiss()
                //                    }
                
            }
            }
        }
    }
    
    func didDismiss() {
            // Handle the dismissing action.
        }
}

