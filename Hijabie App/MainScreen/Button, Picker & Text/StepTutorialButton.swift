//
//  StepTutorialButton.swift
//  Hijabie App
//
//  Created by Qonitah Faridah on 09/11/23.
//

import SwiftUI
import AVFoundation

var steps = ["1", "2", "3", "4", "5", "6", "7"]

struct StepTutorialButton: View {
    @Binding var videos: [Videos]
    @Binding var stepIndex: Int
    @Binding var selectedStepIndex: Int
    @Binding var isStepSelected: Int
    @Binding var player: AVPlayer?
    
    let startTime: [Int: CMTime] = [
        0: CMTime(seconds: 0, preferredTimescale: 1),
        1: CMTime(seconds: 7, preferredTimescale: 1),
        2: CMTime(seconds: 13, preferredTimescale: 1),
        3: CMTime(seconds: 17, preferredTimescale: 1),
        4: CMTime(seconds: 32, preferredTimescale: 1),
        5: CMTime(seconds: 54, preferredTimescale: 1),
        6: CMTime(seconds: 65, preferredTimescale: 1)
        // Add more steps as needed
     ]
    
    var body: some View {
        
            ScrollViewReader { scrollView in
                
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack(spacing: 1) {
                        
                        ForEach(steps.indices, id: \.self) { index in
                            
                                Text(steps[index])
                                .font(isStepSelected == index ? .system(size: 23, weight: .bold) : .system(size: 17))
                                    .padding(.horizontal)
                                    .padding(.vertical)
                                    .foregroundColor(isStepSelected == index ? .yellow : .white)
                                    .background(Circle().fill(.black).opacity(0.5).frame(width: isStepSelected == index ? 50 : 30))
                                    .onTapGesture {
                                        withAnimation(.interactiveSpring) {
                                            isStepSelected = index
                                            
                                            if let player = player, let time = startTime[index] {
                                                player.seek(to: time)
                                            }
                                        }
                                    }
                        }
                    }
//                    .padding()
                    .frame(width: CGFloat(steps.count) * 70)
                    .padding(.top, 400)
                
            }
//            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
    }
}

//struct StepButtonView: View {
//    
//    let imageName:String
//    let isStepSelected: Bool
//    
//    
//    var body: some View {
//        ZStack(alignment: .bottom) {
//            Text(isStepSelected == index ? "\(stepss[index])" : "\(steps[index])")
//                .font(isStepSelected == index ? .system(size: 19, weight: .medium) : .system(size: 17))
//                .padding(.horizontal)
//                .padding(.vertical)
//                .foregroundColor(isStepSelected == index ? .yellow : .white)
//                .background(Circle().fill(/*isStepSelected == index ? .white : .clear.black).opacity(0.5))
//                .onTapGesture {
//                    withAnimation(.interactiveSpring) {
//                        isStepSelected = index
//                    }
//                }
//                )
//        }
//        
//    }
//}
//struct StepButtonView: View {
////    @Binding var videos: [Videos]
////    @Binding var player: AVPlayer?
//    //    let stepName: String
//    @Binding var isStepSelected: Int
//    var steps = ["Step 1", "Step 2", "Step 3", "Step 4", "Step 5", "Step 6", "Step 7"]
//
//    var body: some View {
//
//        ScrollViewReader { scrollView in
//            ScrollView(.horizontal, showsIndicators: false) {
//                HStack {
//                    ForEach(steps.indices, id: \.self) { index in
//
//                        Text(steps[index])
//                            .font(.subheadline)
//                            .padding(.horizontal)
//                            .padding(.vertical)
//                            .foregroundColor(isStepSelected == index ? .yellow : .white)
//                            .background(Capsule().stroke(isStepSelected == index ? .white : .clear))
//                            .onTapGesture {
//                                withAnimation(.easeInOut) {
//                                    isStepSelected = index
//                                }
//                            }
//                    }
//                }
//            }
//            .padding()
//            //            .background(Color(.systemGray6))
//            //            .cornerRadius(25)
//
//        }
//
//    }
}
