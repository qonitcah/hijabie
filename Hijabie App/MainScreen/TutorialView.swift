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
    @Binding var ARViewToShow: Bool
    @Binding var tutorViewToShow: Bool
    
    var body: some View {
        ZStack{
            VideoPlayer(player: AVPlayer(url:  Bundle.main.url(forResource: "tutorvideo", withExtension: "mp4")!))
                .ignoresSafeArea(.all)
            VStack(){
                ButtonTryTutorial(models: $models,selectedFilterIndex: $selectedFilterIndex, index: $index, ARViewToShow: $ARViewToShow, tutorViewToShow: $tutorViewToShow)
                
                namaModel(models: $models, index: $index)
                
                ChooseHijabModel(selectedFilterIndex: $selectedFilterIndex, index: $index, models: $models)
            }
            .padding(.top, 585)
        }
    }
}
