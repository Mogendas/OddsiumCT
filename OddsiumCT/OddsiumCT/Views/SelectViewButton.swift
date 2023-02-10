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
    var date: Date
    var amount: Int
    
    var buttonAction: ((Date) -> Void)?
    
    var body: some View {
        Button(action: {
            buttonAction?(date)
        }, label: {
            VStack {
                Text("\(amount)")
                    .padding()
                    .foregroundColor(.white)
                    .background(.blue)
                    .clipShape(Circle())
                
                Text("title")
                    .foregroundColor(.white)
                
                Text(date.dateAsString)
                    .foregroundColor(Color("LightGray"))
            }
            .padding()
        })
    }
}

struct SelectViewButton_Previews: PreviewProvider {
    static var previews: some View {
        SelectViewButton(date: Date(), amount: 2)
            .background(.gray)
    }
}
