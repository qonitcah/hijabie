//
//  Hijabie_AppApp.swift
//  Hijabie App
//
//  Created by Qonitah Faridah on 17/10/23.
//

import SwiftUI

@main
struct Hijabie_AppApp: App {
//    @AppStorage("isOnboardingComplete") var isOnboardingComplete: Bool = false
//    @ObservedObject var faceData: FaceShapeData = FaceShapeData()
    
    var UDData = UserDefaults.standard 

    var body: some Scene {
        WindowGroup(content: {
            if UDData.bool(forKey: "isOnboardingComplete") {
                MainHijabModels(faceData: FaceShapeData())
            } else {
                OnBoarding1View()
//                            ColorWheelPicker()
            }
        })
    }
}
