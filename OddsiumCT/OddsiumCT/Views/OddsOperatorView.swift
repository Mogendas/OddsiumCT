//
//  OddsOperatorView.swift
//  OddsiumCT
//
//  Created by Johan Wejdenstolpe on 2023-02-09.
//

import SwiftUI
import Kingfisher

struct OddsOperatorView: View {
    @StateObject var viewModel: OddsOperatorViewModel
    
    var body: some View {
        GeometryReader { geometry in
            HStack {
                HStack {
                    if let url = URL(string: viewModel.operatorImage) {
                        KFImage(url)
                            .resizable()
                            .frame(maxWidth: 80, maxHeight: 40)
                    }
                }
                .frame(width: geometry.size.width / 2, alignment: .leading)
                
                HStack {
                    ForEach(viewModel.operatorOdds.odds) { odds in
                        ZStack {
                            Circle()
                                .foregroundColor(.blue)
                                .frame(width: 50, height: 50)
                            Text(odds.oddsValue)
                                .foregroundColor(.white)
                        }
                    }
                }
            }
            .padding()
            .background(.clear)
            .frame(minHeight: 80)
        }
    }
}

struct OddsOperatorView_Previews: PreviewProvider {
    static var previews: some View {
        let oddsOperatorViewModel = OddsOperatorViewModel(operatorOdds: OperatorOdds(operatorName: "Test", operatorId: 2, operatorFlagUrl: "www", isOpen: true, operatorMatchId: "3", operatorTournamentId: "4", odds: [Odds(oddsValue: "3", oddsId: "34", oddsValueReq: "45"), Odds(oddsValue: "3", oddsId: "34", oddsValueReq: "45"), Odds(oddsValue: "3", oddsId: "34", oddsValueReq: "45")]))
        OddsOperatorView(viewModel: oddsOperatorViewModel)
    }
}
