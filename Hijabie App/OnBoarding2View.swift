//
//  OnBoarding2View.swift
//  Hijabie App
//
//  Created by Qonitah Faridah on 22/10/23.
//

import SwiftUI

struct OnBoarding2View: View {
    @StateObject var faceData: FaceShapeData = FaceShapeData()
    @State private var drawingWidth = false
    
    var body: some View {
        ZStack{
            Rectangle()
//            FaceDetection(faceData: faceData)
//                Text(faceData.faceLabel)
            
            VStack{
                Text("Face Scanning")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.bottom, 67)
                    .foregroundColor(.white)
                
                ZStack{
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: 232.0, height: 34.0)
                        .opacity(0.5)
                    Text("Identifying your face..")
                        .fontWeight(/*@START_MENU_TOKEN@*/.light/*@END_MENU_TOKEN@*/)
                        .foregroundStyle(.white)
                        .font(.custom("SF Pro Text", size: 20))
                }
                .padding(.bottom, 67)
                
                Image("facescan")
                    .padding(.bottom, 150)
                
                ZStack(alignment: .leading){
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color(.systemGray))
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color(.black))
                        .frame(width: drawingWidth ? 329 : 0, alignment: .leading)
                        .animation(.easeInOut(duration: 10).repeatForever(autoreverses: false), value: drawingWidth)
                }
                .frame(width: 329, height: 7)
                .onAppear {drawingWidth.toggle()
                        
                }
                
        }
        }
    }
}

#Preview {
    OnBoarding2View()
}
