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
    @State var isActive: Bool = false
    
    
    var body: some View {
        VStack{
            
            if self.isActive {
                OnBoarding3View()
                
            } else {
            ZStack{
                GeometryReader { geometry in
                    Rectangle()
                        .fill(LinearGradient(gradient: Gradient(colors: [Color.black, Color.clear]), startPoint: .bottom, endPoint: .top))
                        .frame(width: geometry.size.width, height: geometry.size.height / 2)
                        .position(x: geometry.size.width / 2, y: geometry.size.height)
                    Rectangle()
                        .fill(LinearGradient(gradient: Gradient(colors: [Color.black, Color.clear]), startPoint: .top, endPoint: .center))
                        .frame(width: geometry.size.width, height: geometry.size.height / 2)
                        .position(x: geometry.size.width / 2, y: geometry.size.height / 5)
                }
                
                //            FaceDetection(faceData: faceData)
                //                Text(faceData.faceLabel)
                
                VStack{
                    Text("Face Scanning")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.bottom, 67)
                        .padding(.top, -20)
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
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .fill(Color(.systemGray))
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color(.black))
                            .frame(width: drawingWidth ? 329 : 0, alignment: .leading)
                            .animation(.easeInOut(duration: 2.5).repeatForever(autoreverses: false), value: drawingWidth)
                        
                    }
                    .frame(width: 329, height: 7)
                    .onAppear(){
                        drawingWidth.toggle()
                    }
                }
            
        }
    }
            }
        .ignoresSafeArea()
        .onAppear {
                  
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                   
                        withAnimation {
                            self.isActive = true
                        }
                    }
            }

        }
}



#Preview {
    OnBoarding2View()
}
