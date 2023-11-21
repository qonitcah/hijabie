//
//  CustomVideoController.swift
//  Hijabie App
//
//  Created by Qonitah Faridah on 09/11/23.
//

import Foundation
import SwiftUI
import AVKit

struct CustomVideoController: UIViewControllerRepresentable{
    @Binding var player: AVPlayer?
    
    let startTime: Double
    
    func makeUIViewController(context: Context) ->  AVPlayerViewController {
        let controller = AVPlayerViewController()
        controller.player = player
        controller.showsPlaybackControls = false
        controller.modalPresentationStyle = .fullScreen
        
        
        let cmTime = CMTime(seconds: startTime, preferredTimescale: 1)
        player?.seek(to: cmTime)
        
        
        return controller
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
        uiViewController.player = player
    }
}
