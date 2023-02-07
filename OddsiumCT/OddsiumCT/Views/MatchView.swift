//
//  MatchView.swift
//  OddsiumCT
//
//  Created by Johan Wejdenstolpe on 2023-02-04.
//

import SwiftUI

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
                    
                    Image(systemName: "photo.circle.fill")
                }
                
                Image(systemName: "photo.circle.fill")
            }
            .padding()
            .background(Color("LightGray"))
            
            HStack {
                Image(systemName: "photo.circle.fill")
                
                Text(viewModel.match.htName)
                    .frame(maxWidth: 110)
                    .foregroundColor(Color("LightGray"))
                    .multilineTextAlignment(.leading)
                
                Spacer()
                
                Text("1 - 3")
                    .foregroundColor(.white)
                
                Spacer()
                
                Text(viewModel.match.atName)
                    .frame(maxWidth: 110)
                    .foregroundColor(Color("LightGray"))
                    .multilineTextAlignment(.trailing)
                
                Image(systemName: "photo.circle.fill")
            }
            .padding()
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
