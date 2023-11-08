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
    @State var player = [
        AVPlayer(url: Bundle.main.url(forResource: "tutor1video", withExtension: "mp4")!),
        AVPlayer(url: Bundle.main.url(forResource: "tutor1video", withExtension: "mp4")!)]
    @State var isPlaying: Bool = false
    @State var isAppear: Bool = true
    
    var body: some View {
        ZStack{
            
            VideoPlayer(player: player[index])
            //                .frame(maxWidth: .infinity, alignment: .top)
                .safeAreaInset(edge: .bottom, spacing: 0) {
                    Color.clear
                        .frame(height: 0)
                        .background(Material.bar)
                }
                .ignoresSafeArea(.all)
            
            Button {
                isPlaying ? player[index].pause() : player[index].play()
                isPlaying.toggle()
                player[index].seek(to: .zero)
            } label: {
                Image(systemName: isPlaying ? "stop" : "play")
                    .padding()
            }
            
            
            ChooseHijabModel(selectedFilterIndex: $selectedFilterIndex, index: $index, models: $models, isAppear: $isAppear)
                .opacity(isPlaying ? 0 : true && isAppear ? 1 : 0)
            
            
            Spacer()
            
            Button {
                isAppear.toggle()
            } label: {
                VStack {
                    Image(systemName: "chevron.up")
                        .font(.system(size: 40))
                    Text("HIJAB MODEL")
                        .font(.system(size: 17))
                }
                .foregroundColor(Color.white)
                .opacity(isPlaying ? 1 : false || isAppear ? 0 : 1)
                .padding(.top, 650)
            }
            
            
            
        }
        .ignoresSafeArea(.all, edges: .top)
        //        .padding()
    }
}

struct stepVideo: View {
    @Binding var models: [Model]
    @Binding var index: Int
    
    var body: some View {
        VStack{
            
            Text("Step:")
            
            Text(models[index].name)
                .bold()
        }
        .background(.ultraThinMaterial,
                    in: RoundedRectangle(cornerRadius: 5, style: .continuous))
        .foregroundColor(.black)
    }
}
