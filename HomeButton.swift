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
        HStack(spacing: 10){
            Image(systemName: systemImage)
                .font(.subheadline)
            Text(title)
                .font(.subheadline)
        }
        .frame(maxWidth: .infinity)
        .padding(8)
        .background(Color("CardBackground"))
        .cornerRadius(10)
    }
}

struct HomeView: View {
    //added moodstorage and journal storage to keep all the data up to date 
    @State private var quoteOfTheDay = ""
    @ObservedObject var moodStorage: MoodStorage
    @ObservedObject var journalStorage: JournalStorage
    var body: some View {
        NavigationView {
            ScrollView{
                //welcome user to the app
                VStack(alignment: .leading, spacing: 16) {
                    Text("Welcome to InnerEase")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    //Added an array of quotes to be displayed 
                    let quotes = [
                        "You are stronger than you think.",
                        "Take it one day at a time.",
                        "Progress, not perfection.",
                        "Breathe in calm, breathe out stress.",
                        "Your feelings are valid.",
                        "Keep going—you’re doing your best.",
                        "Healing is not linear."
                    ]
                    
                 
                    
                    // app moto
                    Text("Reaching our inner peace ")
                        .font(.headline)
                    // Daily mood/mental health check in
                    // this will be charted on the calnedar page and progress for the home page
                    Text("How are you feeling today?")
                        .font(.headline)
                    NavigationLink(destination: MoodTrackerView()) {
                        HomeButton(title: "Mood Check-In", systemImage: "face.smiling")
                    }
                    
                    Divider()
                    // Home screen 3.0:
                    // In this version I added an array of quotes that will randomily display on the screen. Along with that the option for a user to change the random quote
                    //Goals for 4.0:
                    //My goals for 4.0 is to add a progress widget and goals for the user to set for themselves. Also to clean up the overall look of the home screen 
                    VStack(alignment: .leading, spacing: 8){
                     Text("Quote Of The Day")
                            .font(.headline)
                            .fontWeight(.semibold)
                        
                        Text(quoteOfTheDay)
                            .font(.footnote)
                            .italic()
                            .multilineTextAlignment(.leading)
                            .padding(.bottom,4)
                        
                        Button("New quote"){
                            quoteOfTheDay = quotes.randomElement() ?? ""
                        }
                        .font(.caption)
                        .foregroundColor(.blue)
                    }
                    .onAppear{
                        quoteOfTheDay = quotes.randomElement() ?? ""
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
                    NavigationLink(destination: CalendarView(moodStorage: moodStorage)) {
                        HomeButton(title: "Calendar", systemImage: "calendar")
                    }
                    NavigationLink(destination: JournalView(journalStorage: journalStorage)) {
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



