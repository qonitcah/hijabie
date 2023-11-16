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
    @Binding var selectedHijab: Int
    @Binding var index: Int
    @State private var selectedStepIndex: Int = 0
//    @State var stepIndex = 0
    @State var isStepSelected: Int = 0
    @State var isPlaying: Bool = true
    @State var isAppear: Bool = true
    @State private var currentVideoIndex = -1
    @State var player: AVPlayer? = {
        if let bundle = Bundle.main.path(forResource: "tutor1video", ofType: "mp4") {
            return .init(url: URL(fileURLWithPath: bundle))
        }
        return nil
    }()
    
    @State var videos = [
        Videos(id: 0, name: "tutor1video", step: [StepsVideos(id: 0, text: "STEP 1\nSatu sisi hijab lebih pendek dari lainnya"),
                                                 StepsVideos(id: 1, text: "STEP 2\nTarik ke bagian samping kepala,\nlalu sematkan jarum pentul"),
                                                  StepsVideos(id: 2, text: "STEP 3\nUjung sisa kainnya tarik ke belakang"),
                                                  StepsVideos(id: 3, text: "STEP 4\nUjung kain yang lebih panjang\njuga tarik ke belakang"),
                                                  StepsVideos(id: 4, text: "STEP 5\nAngkat bagian belakang,\n lalu ikat sisi panjang dan pendek"),
                                                  StepsVideos(id: 5, text: "STEP 6\nSematkan jarum pentul \ndi sisi samping kepala bagian depan"),
                                                  StepsVideos(id: 6, text: "STEP 7\nTerakhir rapikan pashmina, jadi deh!")])
    ]
//    @State var videos = [
//        Videos(id: 0, name: "tutor1video",
//               stepOne: "STEP 1\nSatu sisi hijab lebih pendek dari lainnya",
//               stepTwo: "STEP 2\nTarik ke bagian samping kepala,\nlalu sematkan jarum pentul",
//               stepThree: "STEP 3\nUjung sisa kainnya tarik ke belakang",
//               stepFour: "STEP 4\nUjung kain yang lebih panjang juga tarik ke belakang",
//               stepFive: "STEP 5\nAngkat bagian belakang,\n lalu ikat sisi panjang dan pendek",
//               stepSix: "STEP 6\nSematkan jarum pentul \ndi sisi samping kepala bagian depan",
//               stepSeven: "STEP 7\nTerakhir rapikan pashmina, jadi deh!"),
//        
//        Videos(id: 1, name: "tutor1video",
//               stepOne: "STEP 1\nSatu sisi hijab lebih pendek dari lainnya",
//               stepTwo: "STEP 2\nTarik ke bagian samping kepala,\nlalu sematkan jarum pentul",
//               stepThree: "STEP 3\nUjung sisa kainnya tarik ke belakang",
//               stepFour: "STEP 4\nUjung kain yang lebih panjang juga tarik ke belakang",
//               stepFive: "STEP 5\nAngkat bagian belakang,\n lalu ikat sisi panjang dan pendek",
//               stepSix: "STEP 6\nSematkan jarum pentul \ndi sisi samping kepala bagian depan",
//               stepSeven: "STEP 7\nTerakhir rapikan pashmina, jadi deh!")]
    @State var chosenVideo : Videos?
    @State var indexText: Int = 0
    
    
    
    
    var body: some View {
        ZStack{
            if let player = player {
                CustomVideoController(player: player, startTime: 0.0)
                    .ignoresSafeArea(.all)
                    .frame(width: 480/*, height: 800*/)
                    .safeAreaInset(edge: .bottom, alignment: .center, spacing: 0) {
                        Color.clear
                            .frame(height: 0)
                            .background(Material.bar)
                    }
                
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

            
            StepTutorialButton(videos: $videos, selectedStepIndex: $selectedStepIndex, isStepSelected: $isStepSelected, player: $player)
                .position(.init(x: 240, y: 80))
            
            
            namaModel(models: $models, index: $index)
                .offset(y:220)
            
            ChooseHijabModel(index: $index, models: $models, isAppear: $isAppear, selectedHijab: $selectedHijab)
                .position(.init(x: 280, y: 637))
            
        }
    }
}

struct Videos : Identifiable {
    var id: Int
    var name: String
    var step: [StepsVideos]
//    var stepOne: String
//    var stepTwo: String
//    var stepThree: String
//    var stepFour: String
//    var stepFive: String
//    var stepSix: String
//    var stepSeven: String
}

struct StepsVideos : Identifiable {
    var id: Int
    var text: String
}

//#Preview {
//    TutorialView(models: <#T##Binding<[Model]>#>, selectedFilterIndex: <#T##Binding<Int>#>, index: <#T##Binding<Int>#>)
//}
