//
//  TutorialView.swift
//  Hijabie App
//
//  Created by Qonitah Faridah on 30/10/23.
//

import SwiftUI
import AVKit

struct TutorialView: View {
    @Binding var models: [Model]
    @Binding var selectedFilterIndex: Int
    @Binding var index: Int
    @State private var selectedStepIndex: Int = 0
    @State var stepIndex = 0
    @State var isPlaying: Bool = true
    @State var isAppear: Bool = true
    @State private var currentVideoIndex = -1
    @State var player: AVPlayer? = {
        if let bundle = Bundle.main.path(forResource: "tutor1video", ofType: "mp4") {
            return .init(url: URL(fileURLWithPath: bundle))
        }
        return nil
    }()
    @State var videos: [Videos] = [
        Videos(id: 0, name: "tutor1video", step1: "", step2: "", step3: "", step4: "", step5: "", step6: "", step7: ""),
        Videos(id: 1, name: "tutor1video", step1: "", step2: "", step3: "", step4: "", step5: "", step6: "", step7: "")]
    @State var chosenVideo : Videos?
    
    @State var isStepSelected: Int = 0
    
    var body: some View {
        ZStack{
            if let player = player {
                CustomVideoController(player: player)
                    .ignoresSafeArea(.all)
                    .frame(width: 500/*, height: 800*/)
                    .safeAreaInset(edge: .bottom, alignment: .center, spacing: 0) {
                        Color.clear
                            .frame(height: 0)
                            .background(Material.bar)
                    }
                //                    .overlay(content: {
                //                        Button(action: {
                //
                //                        }, label: {
                //
                //                        })
                //                    })
                    .onAppear() {
                        currentVideoIndex += 1
                        player.play()
                    }
                
                
            }
            else {
                Spacer()
                HStack(alignment: .center, content: {
                    Spacer()
                    Text("Error No Video Found")
                    Spacer()
                })
                Spacer()
            }
            
            
            StepTutorialButton(videos: $videos, stepIndex: $stepIndex, selectedStepIndex: $selectedStepIndex, isStepSelected: $isStepSelected)
            
//            ChooseHijabModel(selectedFilterIndex: $selectedFilterIndex, index: $index, models: $models, isAppear: $isAppear, selectedHijab: <#Binding<String>#>)
//                .opacity(/*isPlaying ? 0 : true || */isAppear ? 1 : 0)
////                .frame(width: 600)
            
            Spacer()
            
            Button {
                withAnimation(.spring) {
                    isAppear.toggle()
                }
            } label: {
                VStack {
                    Image(systemName: "chevron.up")
                        .font(.system(size: 40))
                    Text("HIJAB MODEL")
                        .font(.system(size: 17))
                }
                .foregroundColor(Color.white)
                .opacity(isAppear ? 0 : 1)
                .padding(.top, 675)
            }
        }
//        .ignoresSafeArea(.all, edges: .top)
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
        //            VideoPlayer(player: player[currentVideoIn])
        //                .ignoresSafeArea(.all)
        //                .onAppear() {
        //                    //if player[0].currentItem == n
        //                    for play in player {
        //                        if play.currentItem == nil {
        //                            let item = AVPlayerItem(url:  Bundle.main.url(forResource: "tutor1video", withExtension: "mp4")!)
        //                            play.replaceCurrentItem(with: item)
        //                        }
        //                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
        //                            play.play()
        //                        })
        //                        }
        //                    }
        //                    if player[0].currentItem == nil {
        //                                let item = AVPlayerItem(url: URL(string: "")!)
        //                                player.replaceCurrentItem(with: item)
        //                            }
        //                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
        //                                player.play()
        //                            })
        //                }
        //                .safeAreaInset(edge: .bottom, spacing: 0) {
        //                    Color.clear
        //                        .frame(height: 0)
        //                        .background(Material.bar)
        //                }
        
        //        Button(action: {
        //
        //        }, label: {
        //
        //        })
        //            Button {
        //                isPlaying ? player[index].pause() : player[index].play()
        //                isPlaying.toggle()
        //                player[index].seek(to: .zero)
        //            } label: {
        //                Image(systemName: isPlaying ? "stop" : "play")
        //                    .padding()
        //            }
        //
        //
        //            ChooseHijabModel(selectedFilterIndex: $selectedFilterIndex, index: $index, models: $models, isAppear: $isAppear)
        //                .opacity(isPlaying ? 0 : true && isAppear ? 1 : 0)
        //
        //
        //            Spacer()
        //
        //            Button {
        //                withAnimation(.spring) {
        //                    isAppear.toggle()
        //                }
        //            } label: {
        //                VStack {
        //                    Image(systemName: "chevron.up")
        //                        .font(.system(size: 40))
        //                    Text("HIJAB MODEL")
        //                        .font(.system(size: 17))
        //                }
        //                .foregroundColor(Color.white)
        //                .opacity(isPlaying ? 1 : false || isAppear ? 0 : 1)
        //                .padding(.top, 650)
        //            }
        //
        //
        //
        //        }
        //        .ignoresSafeArea(.all, edges: .top)
        //        //        .padding()
    }
}

struct Videos : Identifiable {
    let id: Int
    let name: String
    let step1: String
    let step2: String
    let step3: String
    let step4: String
    let step5: String
    let step6: String
    let step7: String
}

//#Preview {
//    TutorialView(models: <#T##Binding<[Model]>#>, selectedFilterIndex: <#T##Binding<Int>#>, index: <#T##Binding<Int>#>)
//}
