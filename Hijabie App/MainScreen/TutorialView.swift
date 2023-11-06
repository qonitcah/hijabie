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

    var body: some View {
        ZStack{
            
            VideoPlayer(player: AVPlayer(url:  Bundle.main.url(forResource: "tutorvideo", withExtension: "mp4")!))
                .ignoresSafeArea(.all)
            
            VStack(){
                
                ChooseHijabModel(selectedFilterIndex: $selectedFilterIndex, index: $index, models: $models)
            }
            
        }
        .ignoresSafeArea(.all, edges: .top)
    }
}
