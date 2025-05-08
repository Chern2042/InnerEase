//
//  ContentView.swift
//  Inner Ease
//
//  Created by Christian Hernandez on 5/7/25.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 2 // indexes home to correct tab order(4.0)
    @State private var moodStorage = MoodStorage()
    @State private var journalStorage = JournalStorage()
    var body: some View {
//The basic ui tabs that the user will see
// ui tabs split into Home,Calendar,Journal,Tools, and Settings
//changed the order of the tabs to Journal, Social, calendar, tools, and settings (under more) 

        
        TabView(selection: $selectedTab){//Opens on home
          //4.0 update: rearanged the the tabs on the home screen so that the home tab is in the center of the screen. Also fixed any lag between using the buttons and the tags at the bottom of the screen 
            // the journal is for users to journal any thoughts down
            NavigationView {
                  JournalView(journalStorage: journalStorage)
              }
              .tabItem {
                  Label("Journal", systemImage: "book.closed")
              }
              .tag(0)
            // the social tab is for user to interact with other users this system
            // build connections and gain support
            SocialView()
                .tabItem{
                    Label("Social",systemImage: "person.2.fill")
                }
                .tag(1)
            
            
            //The home screen( what the user is going to see when the open the app
            // asks for overall mood and shows stats like progress
            HomeView(moodStorage: moodStorage, journalStorage: journalStorage)
                .tabItem{
                    Label("Home",systemImage: "house")
                }
                .tag(2)
            // the calendar is supposed to be a visual for the user so they can see
            // their day by day progress
            CalendarView(moodStorage: moodStorage)
                .tabItem{
                    Label("Calendar",systemImage: "calendar")
                    
                }
                .tag(3)
           
            //the tools tab is any tools that a person can use towards their mental health
            ToolsView()
                .tabItem{
                    Label("Tools",systemImage: "heart.text.square")
                }
                .tag(4)
            // The setttings tab deals with the account settings of the user
            // they can be customized here
            SettingsView()
                .tabItem{
                    Label("Settings", systemImage: "gear")
                }
                .tag(5)
        }
        
    }
}




//Moved all views into their own files









#Preview {
    ContentView()
}
