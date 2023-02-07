//
//  SelectView.swift
//  OddsiumCT
//
//  Created by Johan Wejdenstolpe on 2023-02-06.
//

import SwiftUI

struct SelectView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
                SelectViewButton(title: "Yesterday", subTitle: "Dec 12", amount: 34)
                    .frame(minWidth: 120)
                SelectViewButton(title: "Today", subTitle: "Dec 13", amount: 34)
                    .frame(minWidth: 120)
                SelectViewButton(title: "Tomorrow", subTitle: "Dec 14", amount: 34)
                    .frame(minWidth: 120)
                SelectViewButton(title: "Wednesday", subTitle: "Dec 15", amount: 34)
                    .frame(minWidth: 120)
            }
        }
    }
}

struct SelectView_Previews: PreviewProvider {
    static var previews: some View {
        SelectView()
            .background(.gray)
    }
}
