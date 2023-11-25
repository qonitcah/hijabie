//
//  OnBoarding3View.swift
//  Hijabie App
//
//  Created by Qonitah Faridah on 22/10/23.
//

import SwiftUI


struct OnBoarding3View: View {
    @StateObject var faceData: FaceShapeData = FaceShapeData()
    //    @AppStorage("isOnboardingComplete") var isOnboardingComplete: Bool = false
    @State private var showOnboarding = false
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var UDData = UserDefaults.standard
    
    //    init() {
    //           if let faceLabel = UDData.string(forKey: "faceLabel") {
    //               faceData.faceLabel = faceLabel
    //           }
    //        isOnboardingComplete = UDData.bool(forKey: "isOnboardingComplete")
    //       }
    
    var body: some View {
        NavigationView{
            ZStack{
                
                if showOnboarding {
                    OnBoarding1View()
                }
                
                FaceDetection(faceData: faceData)
                    .blur(radius: 5.0)
                
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
                    //                    HStack{
                    //                        Button(action: {
                    //                          UDData.removeObject(forKey: "faceLabel")
                    //                          UDData.removeObject(forKey: "isOnboardingComplete")
                    //                          showOnboarding = true
                    //                        }) {
                    //                          Text("Reset")
                    //                                .padding(.top, 60)
                    //                        }
                    //
                    //                        NavigationLink(destination: OnBoarding1View(), isActive: $showOnboarding) {
                    //                          EmptyView()
                    //                        }
                    
                    Text("The Result")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.top, 60)
                    //                    }
                    
                    Spacer()
                    
                    Text("Your facial shape\nis likely to identified as..")
                        .fontWeight(/*@START_MENU_TOKEN@*/.light/*@END_MENU_TOKEN@*/)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.white)
                        .font(.custom("SF Pro Text", size: 20))
                    
                    
                    Spacer()
                    
                    Text(faceData.faceLabel)
                        .fontWeight(.bold)
                        .font(.custom("SF Compact", size: 38))
                        .foregroundColor(.white)
                        .onChange(of: faceData.faceLabel){
                            UDData.set(faceData.faceLabel, forKey: "faceLabel")
                        }
                    
                    
                    Spacer()
                    
                    Image("ceklis")
                        .padding(.bottom, 178)
                    
                    
                    NavigationLink(destination: MainHijabModels(faceData: faceData), label: {
                        Text("Next")
                            .frame(width: 309.0, height: 50.0)
                            .background(Color.white)
                            .clipShape(Capsule(style: .continuous))
                            .foregroundStyle(Color.black)
                            .padding(.bottom, 80)
                            .onAppear(perform: {
                                UDData.set(true, forKey: "isOnboardingComplete")
                            })
                    })
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
            }
            .ignoresSafeArea()
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    // Erase UserDefaults
                    UDData.removeObject(forKey: "faceLabel")
                    UDData.removeObject(forKey: "isOnboardingComplete")
                    
                    // Return to onboarding view
                    presentationMode.wrappedValue.dismiss()
                    
                    // Turn off the camera
                    // Add your code here
                }) {
                    HStack {
                        Text("Reset")
                    }
                }
            }
        }
                }
            }
            
            #Preview {
                OnBoarding3View()
            }
