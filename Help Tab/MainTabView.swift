//
//  ContentView.swift
//  Help Tab
//
//  Created by Eric Barnes - iOS on 11/26/23.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            Text("Search")
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
            
            Text("Stays")
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Stays")
                }
            
            Text("Account")
                .tabItem {
                    Image(systemName: "person")
                    Text("Account")
                }
            
            HelpView() // replace with HelpView
                .tabItem {
                    Image(systemName: "questionmark.circle.fill")
                    Text("Help")
                }
        }
        .tint(AppColors.appBlue)
    }
}

#Preview {
    MainTabView()
}
