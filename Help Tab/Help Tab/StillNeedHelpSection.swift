//
//  StillNeedHelpView.swift
//  Help Tab
//
//  Created by Eric Barnes - iOS on 11/26/23.
//

import SwiftUI

struct StillNeedHelpSection: View {
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack {
                Text("Still need some help?")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.vertical)
            }
            
            HelpButton(systemImageName: "text.bubble", buttonText: "Chat With Us")
                .padding(.bottom, 10)
            
            HelpButton(systemImageName: "phone", buttonText: "Request a Call")
                .padding(.bottom, 10)
            
        }
    }
}

#Preview {
    StillNeedHelpSection()
}

struct HelpButton: View {
    var systemImageName: String
    var buttonText: String
    
    var body: some View {
        Button(action: {print("tapped")}, label: {
            HStack {
                Image(systemName: systemImageName)
                    .foregroundStyle(AppColors.appBlue)
                Text(buttonText)
                    .font(.headline)
                    .bold()
                    .foregroundStyle(AppColors.appBlue)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(AppColors.helpBtnBackground)
            .clipShape(RoundedRectangle(cornerRadius: 12))
        })

    }
}
