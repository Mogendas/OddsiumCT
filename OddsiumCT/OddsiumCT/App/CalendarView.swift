//
//  CalendarView.swift
//  OddsiumCT
//
//  Created by Johan Wejdenstolpe on 2023-02-04.
//

import SwiftUI

struct CalendarView: View {
    @StateObject var viewModel = CalendarViewModel()
    
    var body: some View {
        VStack {
            SelectView()
                .background(Color("DarkGray"))
                .frame(maxHeight: 110)
            
            ScrollView(.vertical, showsIndicators: false) {
                
                
                ForEach(viewModel.matches) { match in
                    
                    let viewModel = MatchViewModel(match: match)
                    MatchView(viewModel: viewModel)
                        .listRowInsets(EdgeInsets())
                        .padding(.bottom, 8)
                        .background(.gray)
                    
                }
                .listStyle(.plain)
                .background(Color.gray)
            }
        }
        .background(Color("DarkGray"))
    }
}


struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
