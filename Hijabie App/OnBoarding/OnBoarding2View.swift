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
                    
                    FaceDetection(faceData: faceData)
                    
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
                    
                    VStack{
                        Text("Face Scanning")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.top, 60)
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        Text("Identifying your face..")
                            .fontWeight(/*@START_MENU_TOKEN@*/.light/*@END_MENU_TOKEN@*/)
                            .foregroundStyle(.white)
                            .font(.custom("SF Pro Text", size: 20))
                            .padding()
                            .background(.ultraThinMaterial,
                                        in: RoundedRectangle(cornerRadius: 50, style: .continuous))
                        
                        Spacer()
                        
                        Circle()
                            .inset(by: 7)
                            .stroke(Color.white, lineWidth: 3)
                            .frame(width: 329, height: 329)
                            
                        Spacer()
                        
                        
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
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding(.bottom, 110)
                    
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
