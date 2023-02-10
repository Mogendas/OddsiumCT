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
//                SelectView()
//                    .background(Color("DarkGray"))
//                    .frame(maxHeight: 110)
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack {
                        ForEach(0..<viewModel.dates.count, id: \.self) { index in
//                            SelectViewButton(date: viewModel.dates[index], amount: 34)
//                                .frame(minWidth: 120)
//
                            SelectViewButton(date: viewModel.dates[index], amount: 34) { date in
                                viewModel.selectedDate = date
                            }
                            .frame(minWidth: 120)
                        }
                    }
                }
                .frame(height: 110)
                
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
            }
            .background(Color("DarkGray"))
        }
    }
}


struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
