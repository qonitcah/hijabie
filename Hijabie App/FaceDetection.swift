//
//  FaceDetection.swift
//  Hijabie App
//
//  Created by Qonitah Faridah on 17/10/23.
//

import Foundation
import SwiftUI
import AVFoundation
import Vision
import UIKit

struct FaceDetection: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        let preview = FaceDetectionViewController()
        return preview
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
    
    public func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil){}
    
    
}
