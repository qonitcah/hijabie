//
//  MainCamera+AR.swift
//  Hijabie App
//
//  Created by Qonitah Faridah on 27/10/23.
//

import SwiftUI

struct MainCamera_AR: View {
    
    @Binding var models: [Model]
    @Binding var selectedFilterIndex: Int
    @Binding var index: Int
    @Binding var ARViewToShow: Bool
    @Binding var tutorViewToShow: Bool

    
    let filters = ["Filter 1", "Filter 2", "Filter 3"]
    
    var body: some View {
            ZStack{
                ARViewContainer()
                
                VStack{
                    
                    ButtonTryTutorial(models: $models, selectedFilterIndex: $selectedFilterIndex, index: $index, ARViewToShow: $ARViewToShow, tutorViewToShow: $tutorViewToShow)
                    
                    HStack{
                        Text("Hijab Model:")
                        
                        Text(models[index].name)
                            .bold()
                    }
                    .background(RoundedRectangle(cornerRadius: 20, style: .continuous).fill(Color.gray).frame(width: 250,height: 28).opacity(0.75))
                    .foregroundColor(.black)
                    
                    ChooseHijabModel(selectedFilterIndex: $selectedFilterIndex, index: $index)
                    }
                .padding(.top, 585)
                
                
                }
                
                
        }
      
    }


//#Preview {
//    MainCamera_AR(models: [.constant(0)], selectedFilterIndex: .constant(0), index: .constant(0))
//}
