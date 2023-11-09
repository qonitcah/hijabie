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
    var player: AVPlayer
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let controller = AVPlayerViewController()
        controller.player = player
        controller.showsPlaybackControls = false
        controller.modalPresentationStyle = .fullScreen
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}
