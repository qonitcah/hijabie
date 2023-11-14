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
        Videos(id: 0, name: "tutor1video", step1: "STEP 1\nSatu sisi hijab lebih pendek dari lainnya", step2: "STEP 2\nTarik ke bagian samping kepala,\nlalu sematkan jarum pentul", step3: "STEP 3\nUjung sisa kainnya tarik ke belakang", step4: "STEP 4\nUjung kain yang lebih panjang juga tarik ke belakang", step5: "STEP 5\nAngkat bagian belakang,\n lalu ikat sisi panjang dan pendek", step6: "STEP 6\nSematkan jarum pentul \ndi sisi samping kepala bagian depan", step7: "STEP 7\nTerakhir rapikan pashmina, jadi deh!"),
        Videos(id: 1, name: "tutor1video", step1: "", step2: "", step3: "", step4: "", step5: "", step6: "", step7: "")]
    @State var chosenVideo : Videos?
    
    @State var isStepSelected: Int = 0
    
    
    
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
            
            
            
            StepTutorialButton(videos: $videos, stepIndex: $stepIndex, selectedStepIndex: $selectedStepIndex, isStepSelected: $isStepSelected, player: $player)
            
            
            Spacer()
            
            
            ChooseHijabModel(index: $index, models: $models, isAppear: $isAppear, selectedHijab: $selectedHijab)
                .position(.init(x: 280, y: 655))
            
            namaModel(models: $models, index: $index)
                .offset(y:340)
            
            //            if (isAppear == false){
            //
            //                VStack {
            //                    Image(systemName: "chevron.up")
            //                        .font(.system(size: 40))
            //                    Text("HIJAB MODEL")
            //                        .font(.system(size: 17))
            //                }
            //                .foregroundColor(Color.white)
            //                //                            .opacity(isAppear ? 0 : 1) //karena opacity cuma ngilangin warna, jadi mendingan pake conditional rendering
            //                .padding(.top, 675)
            //                .onTapGesture {
            //                    isAppear.toggle()
            //
            //
            //                }
            //            }else if (isAppear == true){
            //                ChooseHijabModel(index: $index, models: $models, isAppear: $isAppear, selectedHijab: $selectedHijab)
            //                //                            .opacity(isAppear ? 1 : 0)
            //            }else{
            //                EmptyView()
            //            }
        }
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
