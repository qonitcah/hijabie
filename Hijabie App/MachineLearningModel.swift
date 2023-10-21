//
//  MachineLearningModel.swift
//  Hijabie App
//
//  Created by Qonitah Faridah on 19/10/23.
//

import Foundation
import SwiftUI
import UIKit
import ARKit

struct MachineLearningModel: View {
    
    let model = try! VNCoreMLModel(for: FacialShapeML().model)
    
    static let shapeName = ["round", "square", "other"]
    
    var body: some View {
        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Hello, world!@*/Text("Hello, world!")/*@END_MENU_TOKEN@*/
    }
}

