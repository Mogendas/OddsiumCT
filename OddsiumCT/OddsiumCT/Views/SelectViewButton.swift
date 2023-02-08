//
//  SelectViewButton.swift
//  OddsiumCT
//
//  Created by Johan Wejdenstolpe on 2023-02-06.
//

import SwiftUI

struct SelectViewButton: View {
    var title: String
    var subTitle: String
    var amount: Int
    
    var body: some View {
        Button(action: {
            // DWkd
        }, label: {
            VStack {
                Text("\(amount)")
                    .padding()
                    .foregroundColor(.white)
                    .background(.blue)
                    .clipShape(Circle())
                
                Text(title)
                    .foregroundColor(.white)
                
                Text(subTitle)
                    .foregroundColor(Color("LightGray"))
            }
            .padding()
        })
    }
}

struct SelectViewButton_Previews: PreviewProvider {
    static var previews: some View {
        SelectViewButton(title: "Title", subTitle: "SubTitle", amount: 2)
            .background(.gray)
    }
}
