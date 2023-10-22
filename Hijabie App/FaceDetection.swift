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
    var faceData: FaceShapeData
    
    func makeUIViewController(context: Context) -> UIViewController {
        let preview = CameraFaceDetection(faceData: faceData)
        return preview
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        print("Data update")
    }
    
    public func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil){}
    
    
}
