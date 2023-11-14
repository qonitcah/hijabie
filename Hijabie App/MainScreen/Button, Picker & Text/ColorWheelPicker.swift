//
//  ColorWheelPicker.swift
//  Hijabie App
//
//  Created by Qonitah Faridah on 06/11/23.
//

import SwiftUI

enum Direction {
    case left
    case right
}

struct ColorWheelPicker: View{
    
    @State var radius : Double = 150
    @State var direction = Direction.left
    @State var chosenIndex = 5
    @Binding var degree : Double
    @State var label: String = "HIJAB COLOR"
    
    let array : [MyColors]
    let circleSize : Double
    
    func moveWheel() {
        withAnimation(.spring()) {
            if direction == .left {
                degree -= Double(360/array.count)
                if chosenIndex == array.count-1 {
                    chosenIndex = 0
                } else {
                    chosenIndex += 1
                }
            } else {
                degree += Double(360/array.count)
                if chosenIndex == 0 {
                    chosenIndex = array.count-1
                } else {
                    chosenIndex -= 1
                }
            }
            
            label = array[chosenIndex].name
        }
    }
    
    var body: some View{
        
        ZStack {
            let anglePerCount = Double.pi * 2.0 / Double(array.count)
            let drag = DragGesture()
                .onEnded { value in
                    if value.startLocation.x > value.location.x + 10 {
                        direction = .left
                    } else if value.startLocation.x < value.location.x - 10 {
                        direction = .right
                    }
                    moveWheel()
                }
            
            // MARK: WHEEL STACK - BEGINNING
            VStack{
                Text(array[chosenIndex].name)
                    .padding(3)
                    .background(Color.yellow)/*RoundedRectangle(cornerRadius: 20, style: .continuous).fill(Color.white).frame(width: 250,height: 28).opacity(0.7)*/
                    .cornerRadius(4)
                    .foregroundColor(.black)
                    .font(Font.system(size: 17))
                
                ZStack {
                    //                Circle().fill(EllipticalGradient(colors: [.orange,.yellow]))
                    //                    .hueRotation(Angle(degrees: degree))
                    Circle()
                        .fill(.black)
                        .opacity(0.25)
                        .frame(width: 393, height: 393)
                    
                    ForEach(0 ..< array.count) { index in
                        let angle = Double(index) * anglePerCount
                        let xOffset = CGFloat(radius * cos(angle))
                        let yOffset = CGFloat(radius * sin(angle))
                        
                        Circle()
                            .fill(array[index].color)
                            .rotationEffect(Angle(degrees: -degree))
                            .offset(x: xOffset, y: yOffset )
                            .frame(width: 44)
                        
//                        Text("\(array[index].name)")
//                            .rotationEffect(Angle(degrees: -degree))
//                            .offset(x: xOffset, y: yOffset )
//                            .font(Font.system(chosenIndex == index ? .title : .body, design: .monospaced))
                        
                    }
                }
                .rotationEffect(Angle(degrees: degree))
                .gesture(drag)
                .onAppear() {
                    radius = circleSize/2 - 30 // 30 is for padding
                }
            }
            // MARK: WHEEL STACK - END
        }
        .frame(width: circleSize, height: circleSize)
        
        
    }
}


//struct ColorWheelPicker: View {
//    @State var degree = 90.0
//    let array : [myColor] =  [myColor(color: "RED"),
//                              myColor(color: "ORANGE"),
//                              myColor(color: "YELLOW"),
//                              myColor(color: "GREEN"),
//                              myColor(color: "BLUE"),
//                              myColor(color: "PINK"),
//                              myColor(color: "GRAY"),
//                              myColor(color: "PINK"),
//                              myColor(color: "BROWN"),
//                              myColor(color: "LILAC")]
//    
//    var body: some View {
//        ZStack (alignment: .center){
//            Color.black.opacity(0.4).ignoresSafeArea()
//            //                .hueRotation(Angle(degrees: degree))
//            
//            WheelViewContainer(degree: $degree, array: array, circleSize: 393)
//                .offset(y: 350)
//                .shadow(color: .white, radius: 2, x: 0, y: 0)
//        }
//    }
//}
