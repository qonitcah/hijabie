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
    
    //    let startTime: [Steps] = [
    //       Steps(id: 0, step: [0: CMTime(seconds: 0, preferredTimescale: 1),
    //                           1: CMTime(seconds: 7, preferredTimescale: 1),
    //                           2: CMTime(seconds: 13, preferredTimescale: 1),
    //                           3: CMTime(seconds: 17, preferredTimescale: 1),
    //                           4: CMTime(seconds: 32, preferredTimescale: 1),
    //                           5: CMTime(seconds: 54, preferredTimescale: 1),
    //                           6: CMTime(seconds: 65, preferredTimescale: 1)]),
    //       Steps(id: 1, step: [0: CMTime(seconds: 0, preferredTimescale: 1),
    //                           1: CMTime(seconds: 7, preferredTimescale: 1),
    //                           2: CMTime(seconds: 13, preferredTimescale: 1),
    //                           3: CMTime(seconds: 17, preferredTimescale: 1),
    //                           4: CMTime(seconds: 32, preferredTimescale: 1),
    //                           5: CMTime(seconds: 54, preferredTimescale: 1),
    //                           6: CMTime(seconds: 65, preferredTimescale: 1)]),
    //       Steps(id: 2, step: [0: CMTime(seconds: 0, preferredTimescale: 1),
    //                           1: CMTime(seconds: 7, preferredTimescale: 1),
    //                           2: CMTime(seconds: 13, preferredTimescale: 1),
    //                           3: CMTime(seconds: 17, preferredTimescale: 1),
    //                           4: CMTime(seconds: 32, preferredTimescale: 1),
    //                           5: CMTime(seconds: 54, preferredTimescale: 1),
    //                           6: CMTime(seconds: 65, preferredTimescale: 1)])
    //
    //        // Add more steps as needed
    //    ]
    
    var stepDescriptionView: stepDescription {
        stepDescription(videos: $videos, index: $selectedStepIndex, indexText: $isStepSelected)
    }
    
    var body: some View {
        
        ScrollViewReader { scrollView in
            
            VStack{
                
                stepDescriptionView
                
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack(spacing: 1) {
                        
                        ForEach(steps.indices, id: \.self) { stepIndex in
                            
                            Text(steps[stepIndex])
                                .font(isStepSelected == stepIndex ? .system(size: 17, weight: .bold) : .system(size: 17))
                                .padding(.horizontal)
                                .padding(.vertical)
                                .foregroundColor(isStepSelected == stepIndex ? .white : .black)
                                .background(Circle().fill(isStepSelected == stepIndex ? .black : .white).opacity(0.7).frame(width: 34))
                                .onTapGesture {
                                    withAnimation(.interactiveSpring) {
                                        
                                        isStepSelected = stepIndex
                                        
//                                        if let player = player, let time = startTime[stepIndex] {
//                                            player.seek(to: time)
//                                        }
//                                        if let player = player{
//                                            let time = videos[stepIndex].startTimes[selectedStepIndex] 
//                                            self.player.seek(to: time)
//                                        }
                                    }
                                }
                        }
                    }
                }
                //                    .padding()
                .frame(width: CGFloat(steps.count) * 45)
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 48, style: .continuous))
//                .opacity(0.5)
                //                .padding(.top, 400)
                
            }
            //            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        }
    }
    
}
