//
//  MatchDetailView.swift
//  OddsiumCT
//
//  Created by Johan Wejdenstolpe on 2023-02-08.
//

import SwiftUI
import Kingfisher

struct MatchDetailView: View {
    @StateObject var viewModel: MatchDetailViewModel
    
    var body: some View {
        VStack {
            HStack {
                KFImage(URL(string: "http://zeus.oddsium.com/i/\(viewModel.matchDetails?.htFlagUrl ?? "")"))
                    .resizable()
                    .frame(width: 50, height: 50)
                
                Text(viewModel.matchDetails?.htName ?? "n/a")
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: 110, alignment: .leading)
                    .foregroundColor(Color("LightGray"))
                    
                
                Spacer()

                Text("\(viewModel.matchDetails?.score.htScore ?? "") - \(viewModel.matchDetails?.score.atScore ?? "")")
                    .foregroundColor(.white)
                
                Spacer()
                
                Text(viewModel.matchDetails?.atName ?? "n/a")
                    .foregroundColor(Color("LightGray"))
                    .multilineTextAlignment(.trailing)
                    .frame(maxWidth: 110, alignment: .trailing)
                
                KFImage(URL(string: "http://zeus.oddsium.com/i/\(viewModel.matchDetails?.atFlagUrl ?? "")"))
                    .resizable()
                    .frame(width: 50, height: 50)
            }
            .padding(8)
            .background(Color.gray)
            .frame(minHeight: 100)
            
            ScrollView(.vertical, showsIndicators: false) {
//                LazyVStack {
                    if let operatorOdds = viewModel.matchDetails?.operatorOdds {
                        VStack {
                            ForEach(operatorOdds) { oddsOperator in
                                let ViewModel = OddsOperatorViewModel(operatorOdds: oddsOperator)
                                OddsOperatorView(viewModel: ViewModel)
                                    .listRowInsets(EdgeInsets())
                                    .padding()
                            }
                        }
                    } else {
                        Text("No odds")
                    }
//                }
            }
        }
    }
}

struct MatchDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = MatchDetailViewModel(matchId: 376866)
        MatchDetailView(viewModel: viewModel)
    }
}
