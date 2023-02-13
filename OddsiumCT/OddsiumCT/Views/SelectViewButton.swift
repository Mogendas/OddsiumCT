//
//  SelectViewButton.swift
//  OddsiumCT
//
//  Created by Johan Wejdenstolpe on 2023-02-06.
//

import Foundation
import SwiftUI

struct SelectViewButton: View {
    //    var title: String
    //    var subTitle: String
    @Binding var selection: Selection {
        didSet {
            
        }
    }
    
    var amount: Int
    
    var buttonAction: ((Selection) -> Void)?
    
    var body: some View {
        ZStack {
            Button(action: {
                buttonAction?(selection)
            }, label: {
                VStack {
                    Text("\(amount)")
                        .padding()
                        .foregroundColor(.white)
                        .background(.blue)
                        .clipShape(Circle())
                    
                    Text("title")
                        .foregroundColor(.white)
                    
                    Text(selection.date.dateAsString)
                        .foregroundColor(Color("LightGray"))
                }
                .padding()
            })
            
            Rectangle()
                .foregroundColor(.blue)
                .opacity(selection.isSelected ? 1 : 0)
                .frame(height: 8)
                .offset(y: 62)
        }
        //        .background(
        //            Rectangle()
        //                .foregroundColor(.blue)
        //                .opacity(selection.isSelected ? 1 : 0)
        //                .frame(height: 8, alignment: .bottom)
        //        )
    }
}

//struct SelectViewButton_Previews: PreviewProvider {
//    static var previews: some View {
//        SelectViewButton(selection: Selection(date: Date(), isSelected: true), amount: 2)
//            .background(.gray)
//    }
//}
