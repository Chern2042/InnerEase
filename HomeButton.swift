//
//  HomeButton.swift
//  Inner Ease
//
//  Created by Christian Hernandez on 5/7/25.
//

import SwiftUI

struct HomeButton: View{
    var title: String
    var systemImage: String
    
    
    var body: some View{
        HStack{
            Image(systemName: systemImage)
                .font(.title2)
            Text(title)
                .font(.headline)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.blue.opacity(0.15))
        .cornerRadius(12)
    }
}

struct HomeView: View {
    var body: some View {
        NavigationView {
            ScrollView{
                //welcome user to the app
                VStack(alignment: .leading, spacing: 16) {
                    Text("Welcome to InnerEase")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        
                    // app moto
                    Text("Reaching our inner peace ")
                        .font(.headline)
                    // Daily mood/mental health check in
                    // this will be charted on the calnedar page and progress for the home page
                    Text("How are you feeling today?")
                        .font(.headline)

                    Divider()
                    
                    VStack(alignment: .leading, spacing: 4){
                        Text("Words of the day")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        //uplifing words that the user can open the app to
                        // have these on notifications everyday
                        Text("Resilience – The ability to bounce back from challenges.")
                            .font(.footnote)
                            .italic()
                    }
                
            }
                // overall mood progress chart and hype up user for the progress their mental health
                // placeholder
                VStack(alignment: .leading, spacing: 4){
                    Text("Your progress")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    Text("You've checked in 3 times this week, keep it up!")
                        .font(.footnote)
                }
                Divider()
                
                // buttons for the user to click to navigate the app
                // might remove the tabs
                VStack(spacing: 16) {
                    NavigationLink(destination: CalendarView()) {
                        HomeButton(title: "Calendar", systemImage: "calendar")
                    }
                    NavigationLink(destination: JournalView()) {
                        HomeButton(title: "Journal", systemImage: "book")
                    }
                    NavigationLink(destination: ToolsView()) {
                        HomeButton(title: "Tools", systemImage: "heart.text.square")
                    }
                    NavigationLink(destination: SocialView()) {
                        HomeButton(title: "Social", systemImage: "person.2.fill")
                    }
                    NavigationLink(destination: SettingsView()) {
                        HomeButton(title: "Settings", systemImage: "gearshape")
                    }
                }

                Spacer()
            }
            .padding()
        }
    }
}



