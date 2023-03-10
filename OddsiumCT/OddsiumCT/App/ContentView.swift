//
//  ContentView.swift
//  OddsiumCT
//
//  Created by Johan Wejdenstolpe on 2023-02-04.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            CalendarView()
                .tabItem {
                    Label("Calendar", systemImage: "calendar")
                }
                .toolbarBackground(Color("DarkGray"), for: .tabBar)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
