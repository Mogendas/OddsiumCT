//
//  MatchView.swift
//  OddsiumCT
//
//  Created by Johan Wejdenstolpe on 2023-02-04.
//

import SwiftUI
import Kingfisher

struct MatchView: View {
    @StateObject var viewModel: MatchViewModel
    
    var body: some View {
        VStack {
            ZStack {
                HStack {
                    Text(viewModel.match.date.dateFormatted())
                        .foregroundColor(.white)
                    
                    Spacer()
                                        
                    Text(viewModel.match.tournamentName)
                        .foregroundColor(.white)
                }
                
                KFImage(URL(string: "http://zeus.oddsium.com/i/\(viewModel.match.tournamentFlagUrl)"))
                    .resizable()
                    .frame(maxWidth: 30, maxHeight: 20)
                    .scaledToFit()
            }
            .padding()
            .background(Color("LightGray"))
            
            HStack {
                KFImage(URL(string: "http://zeus.oddsium.com/i/\(viewModel.match.htFlagUrl)"))
                    .resizable()
                    .frame(width: 50, height: 50)
                
                Text(viewModel.match.htName)
                    .foregroundColor(Color("LightGray"))
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: 110, alignment: .leading)
                
                Spacer()
                
                Text("\(viewModel.match.score.htScore) - \(viewModel.match.score.atScore)")
                    .foregroundColor(.white)
                
                Spacer()
                
                Text(viewModel.match.atName)
                    .foregroundColor(Color("LightGray"))
                    .multilineTextAlignment(.trailing)
                    .frame(maxWidth: 110, alignment: .trailing)
                
                KFImage(URL(string: "http://zeus.oddsium.com/i/\(viewModel.match.atFlagUrl)"))
                    .resizable()
                    .frame(width: 50, height: 50)
            }
            .padding(8)
            .background(Color.gray)
            .frame(minHeight: 100)
        }
        .background(Color.gray)
    }
}

struct MatchView_Previews: PreviewProvider {
    static var previews: some View {
        let matchViewModel = MatchViewModel(match: MatchModel(id: 1, name: "Name", date: "2022-02-25T00:00:00Z", tournamentId: 2, tournamentName: "T-Name", tournamentFlagUrl: "Flag", status: "Status", liveStatus: "L-Status", htName: "HT-Name", htId: 2, htFlagUrl: "HT-Flag", atName: "AT-Name", atId: 2, atFlagUrl: "AT-Flag", score: Score(htScore: "HT-Score", atScore: "AT-Score", scoreDetails: "Score-Details")))
        MatchView(viewModel: matchViewModel)
    }
}
