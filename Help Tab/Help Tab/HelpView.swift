//
//  HomeView.swift
//  Help Tab
//
//  Created by Eric Barnes - iOS on 11/26/23.
//

import SwiftUI

struct HelpView: View {
    @State var searchText: String = ""
    @State var popularTopics: [String] = ["Member Benefit and Status", "Update Your personal Info", "Report Missing Points", "Change a Reservation", "Canceling a Reservation", "Find a Missing Stay", "Find Hotel Info", "Booking Special Rates", "Booking with Points", "Get a Hotel Receipt", "Report a Billing Mistake", "Find Your Hilton Honors Number", "Go Hilton Program"]
    @State var showingLess: Bool = true
    @State var showingTopicDetail: Bool = false
    var body: some View {
        NavigationStack {
            ZStack {
                // Background Color
                AppColors.appGray.ignoresSafeArea(.all, edges: .top)
                
                VStack {
                    
                    // Title Greeting
                    TitleGreeting
                        .padding(.top, 10)
                        .padding(.horizontal, 10)
                    
                    // Search Bar
                    SearchBar(searchText: $searchText)
                        .padding(.horizontal, 20)
                        .padding(.top, 4)
                    
                    
                    List {
                        // Popular Topics section
                        Section {
                            PopularTopicsSection
                        }
                        
                        // Still need help section
                        Section {
                            StillNeedHelpSection()
                        }
                    }
                    .contentMargins(.top, 10)
                    .listSectionSpacing(20)
                }
            }
        }
    }
    
    // UI Components
    var TitleGreeting: some View {
        HStack {
            Text("Hi, Member! How can we help you?")
                .font(.system(size: 22))
                .fontWeight(.semibold)
                .padding(.leading, 10)
            Spacer()
        }
    }
    
    var PopularTopicsSection: some View {
        Group {
            PopularTopicsHeader
            
            if showingLess { // show less articles
                ForEach(0..<5) { index in
                    TopicItem(title: popularTopics[index])
                }
            } else { // show more articles
                ForEach(popularTopics, id: \.self) { topic in
                    TopicItem(title: topic)
                }
            }
            
            showLessMoreButton
        }
    }
    
    var PopularTopicsHeader: some View {
        Text("Popular Topics")
            .listRowSeparator(.hidden)
            .font(.title3)
            .fontWeight(.semibold)
    }
    
    var showLessMoreButton: some View {
        HStack {
            Spacer()
            Button(action: {
                showingLess.toggle()
            }, label: {
                HStack {
                    Text(showingLess ? "Show more": "Show less")
                        .font(.system(size: 16))
                        .foregroundStyle(AppColors.appBlue)
                    Image(systemName: showingLess ? "chevron.down": "chevron.up")
                        .foregroundStyle(AppColors.appBlue)
                }
            })
            .buttonStyle(.plain)
            Spacer()
        }
    }
}

#Preview {
    HelpView()
}

// EXTRACTED SUBVIEWS
struct SearchBar: View {
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .fontWeight(.thin)
            TextField(text: $searchText) {
                Text("Search Help Articles")
                    .font(.system(size: 18, weight: .medium))
            }
        }
        .padding(.horizontal, 7)
        .padding(.vertical, 5)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 7))
    }
}

struct TopicItem: View {
    var title: String
    
    var body: some View {
        Button(action: {
        }, label: {
            HStack {
                Text(title)
                    .font(.system(size: 18, weight: .regular))
                    .padding(8)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .fontWeight(.thin)
            }
        })
        .tint(.black)
    }
}
