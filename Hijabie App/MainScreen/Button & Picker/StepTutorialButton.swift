//
//  StepTutorialButton.swift
//  Hijabie App
//
//  Created by Qonitah Faridah on 09/11/23.
//

import SwiftUI
import AVFoundation

struct StepTutorialButton: View {
    @Binding var videos: [Videos]
    @Binding var stepIndex: Int
    @Binding var selectedStepIndex: Int
    @Binding var isStepSelected: Int
    
    var steps = ["1", "2", "3", "4", "5", "6", "7"]
    
    var stepss = ["Step 1", "Step 2", "Step 3", "Step 4", "Step 5", "Step 6", "Step 7"]
    
    var body: some View {
        
        GeometryReader { geometry in
            ScrollViewReader { scrollView in
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(steps.indices, id: \.self) { index in
                            Button(action: {
                                
                                self.videos
                                
                            }, label: {
                                Text(isStepSelected == index ? "\(stepss[index])" : "\(steps[index])")
                                .font(isStepSelected == index ? .system(size: 19, weight: .medium) : .system(size: 17))
                                    .padding(.horizontal)
                                    .padding(.vertical)
                                    .foregroundColor(isStepSelected == index ? .yellow : .white)
                                    .background(Circle().fill(/*isStepSelected == index ? .white : .clear*/.black).opacity(0.5))
                                    .onTapGesture {
                                        withAnimation(.interactiveSpring) {
                                            isStepSelected = index
                                        }
                                    }
                            
                            })
                        }
                    }
                    
                    .padding(.top, 500)
                }
                
                //            .background(Color(.systemGray6))
                //            .cornerRadius(25)
                
            }
//            ScrollView(.horizontal, showsIndicators: false) {
//                
//                HStack(spacing: 20) {
//                    Spacer().frame(width: 180)
//                    ForEach(0..<videos.count, id: \.self) { videosIndex in
//                        StepButtonView(
//                           isStepSelected: Binding<Int>(
//                               get: { videosIndex == selectedStepIndex ? 1 : 0 },
//                               set: { newValue in
//                                   if newValue == 1 {
//                                       selectedStepIndex = videosIndex
//                                       stepIndex = videosIndex
//                                   }
//                               }
//                           )
//                        )
//
//                        
//                        .onTapGesture {
//                            withAnimation {
//                                selectedStepIndex = videosIndex
//                                stepIndex = videosIndex
//                            }
//                        }
//                    }
//                }
//                .padding()
//            }
        }
    }
}

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
//}
