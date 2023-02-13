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
        NavigationView {
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack {
                        ForEach(0..<viewModel.selections.count, id: \.self) { index in
                            SelectViewButton(selection: $viewModel.selections[index], amount: 34) { selection in
                                viewModel.selectedDate = selection.date
                            }
                            .frame(minWidth: 120)
                        }
                    }
                }
                .frame(height: 110)
                .background(Color("DarkGray"))
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack {
                        ForEach(viewModel.selectedMatches) { match in
                            
                            let viewModel = MatchViewModel(match: match)
                            let detailViewModel = MatchDetailViewModel(matchId: match.id)
                            
                            NavigationLink(destination: MatchDetailView(viewModel: detailViewModel)) {
                                MatchView(viewModel: viewModel)
                                    .listRowInsets(EdgeInsets())
                                    .background(.gray)
                            }
                        }
                        .listStyle(.plain)
                        .background(Color.gray)
                    }
                    
                }
                .background(Color("LightGray"))
            }
            .background(Color("LightGray"))
        }
    }
}


struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
