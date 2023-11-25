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
    @State var isStepSelected: Int = 0
    @State var isPlaying: Bool = true
    @State var isAppear: Bool = true
//    @State private var currentVideoIndex = -1
    @State var currentVideoIndex: Int = 0
    @State var player: AVPlayer?
//    = {
//        if let bundle = Bundle.main.path(forResource: "tutor1video", ofType: "mp4") {
//            return .init(url: URL(fileURLWithPath: bundle))
//        }
//        return nil
//    }()
    
    @State var videos = [
        Videos(id: 0, name: "tutor1video", step: [StepsVideos(id: 0, text: "STEP 1\nSatu sisi hijab lebih pendek dari lainnya"),
                                                  StepsVideos(id: 1, text: "STEP 2\nTarik ke bagian samping kepala,\nlalu sematkan jarum pentul"),
                                                  StepsVideos(id: 2, text: "STEP 3\nUjung sisa kainnya tarik ke belakang"),
                                                  StepsVideos(id: 3, text: "STEP 4\nUjung kain yang lebih panjang\njuga tarik ke belakang"),
                                                  StepsVideos(id: 4, text: "STEP 5\nAngkat sisi bagian belakang,\nlalu ikat ujung sisi panjang dan pendek"),
                                                  StepsVideos(id: 5, text: "STEP 6\nSematkan jarum pentul di sisi samping kepala bagian depan"),
                                                  StepsVideos(id: 6, text: "STEP 7\nTerakhir rapikan pashmina, jadi deh!")],
               startTimes: [CMTime(seconds: 0, preferredTimescale: 1),
                            CMTime(seconds: 5, preferredTimescale: 1),
                            CMTime(seconds: 10, preferredTimescale: 1),
                            CMTime(seconds: 12, preferredTimescale: 1),
                            CMTime(seconds: 16, preferredTimescale: 1),
                            CMTime(seconds: 26, preferredTimescale: 1),
                            CMTime(seconds: 30, preferredTimescale: 1)]),
        Videos(id: 1, name: "tutor2video",step: [StepsVideos(id: 0, text: "STEP 1\nPakai hijab instan berbahan jersey\nlalu ikat rapi"),
                                                  StepsVideos(id: 1, text: "STEP 2\nTarik bagian atas kepala\nlalu labuhkan di atas kepala"),
                                                  StepsVideos(id: 2, text: "STEP 3\nRapikan sisi kanan dan kiri\nlalu sematkan peniti/jarum pentul di bagian bawah dagu"),
                                                  StepsVideos(id: 3, text: "STEP 4\nTarik satu sisi\nke arah belakang"),
                                                  StepsVideos(id: 4, text: "STEP 5\nRapikan sisi yang lain\ndengan menarik sisinya menutupi dada"),
                                                  StepsVideos(id: 5, text: "STEP 6\nSiapkan 2 buah peniti\nlalu sematkan di setiap sudutnya"),
                                                  StepsVideos(id: 6, text: "STEP 7\nTerakhir rapikan & jadi deh!")],
               startTimes: [CMTime(seconds: 0, preferredTimescale: 1),
                            CMTime(seconds: 8, preferredTimescale: 1),
                            CMTime(seconds: 13, preferredTimescale: 1),
                            CMTime(seconds: 24, preferredTimescale: 1),
                            CMTime(seconds: 33, preferredTimescale: 1),
                            CMTime(seconds: 35, preferredTimescale: 1),
                            CMTime(seconds: 40, preferredTimescale: 1)]),
        Videos(id: 2, name: "tutor3video", step: [StepsVideos(id: 0, text: "STEP 1\nLipat kain segi empat menjadi segitiga"),
                                                  StepsVideos(id: 1, text: "STEP 2\nTaruh di atas kepala, tarik ke bagian belakang,\ndan sematkan peniti"),
                                                  StepsVideos(id: 2, text: "STEP 3\nTarik sedikit kain dari belakang ke atas kepala"),
                                                  StepsVideos(id: 3, text: "STEP 4\nRapikan kerudung dan\nsematkan peniti di bagian bawah dagu"),
                                                  StepsVideos(id: 4, text: "STEP 5\nTarik setiap ujung kain secara berlawanan ke arah belakang"),
                                                  StepsVideos(id: 5, text: "STEP 6\nPutar melingkari leher ke arah depan\ndan tarik ujung belakang keluar"),
                                                  StepsVideos(id: 6, text: "STEP 7\nTerakhir rapikan, jadi deh!")],
               startTimes: [CMTime(seconds: 0, preferredTimescale: 1),
                            CMTime(seconds: 3, preferredTimescale: 1),
                            CMTime(seconds: 6, preferredTimescale: 1),
                            CMTime(seconds: 11, preferredTimescale: 1),
                            CMTime(seconds: 18, preferredTimescale: 1),
                            CMTime(seconds: 23, preferredTimescale: 1),
                            CMTime(seconds: 31, preferredTimescale: 1)])
    ]
    
    @State var chosenVideo : Videos?
    @State var indexText: Int = 0
    
    
    
    
    var body: some View {
        ZStack{
            if let player = player {
                CustomVideoController(player: $player, startTime: 0.0)
                    .ignoresSafeArea(.all)
                    .frame(width: 480/*, height: 800*/)
                    .safeAreaInset(edge: .bottom, alignment: .center, spacing: 0) {
                        Color.clear
                            .frame(height: 0)
                            .background(Material.bar)
                    }
                
                   
                    .onChange(of: currentVideoIndex) { oldValue, newValue in
                        
                        if let bundle = Bundle.main.path(forResource: videos[newValue].name ?? "tutor1video", ofType: "mp4") {
                            self.player = AVPlayer(url: URL(fileURLWithPath: bundle))
                            print(videos[newValue].name,newValue)

                            self.player?.play()
                        }
                    }
                    .onChange(of: isStepSelected) { oldValue, newValue in
                        if let bundle = Bundle.main.path(forResource: videos[currentVideoIndex].name ?? "tutor1video", ofType: "mp4") {
                            self.player = AVPlayer(url: URL(fileURLWithPath: bundle))
                            print(videos[currentVideoIndex].name,currentVideoIndex)
                            self.player?.seek(to: videos[currentVideoIndex].startTimes[newValue])
                            self.player?.play()
                        }                    }
                
                
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
            
            ChooseHijabModel(index: $index, models: $models, isAppear: $isAppear, selectedHijab: $selectedHijab, player: $player, videos: $videos, currentVideoIndex: $currentVideoIndex)
                .position(.init(x: 280, y: 637))
            
        } .onAppear() {
            if player == nil{
                if let bundle = Bundle.main.path(forResource: videos[currentVideoIndex].name ?? "tutor1video", ofType: "mp4") {
                    self.player = AVPlayer(url: URL(fileURLWithPath: bundle))
                    self.player?.seek(to: videos[currentVideoIndex].startTimes[isStepSelected])
                    self.player?.play()
                }
            }
            
        }
    }
    
    
}

struct Videos : Identifiable {
    var id: Int
    var name: String
    var step: [StepsVideos]
    var startTimes: [CMTime]
}

struct StepsVideos : Identifiable {
    var id: Int
    var text: String
}



//#Preview {
//    TutorialView(models: <#T##Binding<[Model]>#>, selectedFilterIndex: <#T##Binding<Int>#>, index: <#T##Binding<Int>#>)
//}
