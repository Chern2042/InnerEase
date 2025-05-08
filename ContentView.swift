//
//  ContentView.swift
//  Inner Ease
//
//  Created by Christian Hernandez on 5/7/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//The basic ui tabs that the user will see
// ui tabs split into Home,Calendar,Journal,Tools, and Settings
//changed the order of the tabs to Journal, Social, calendar, tools, and settings (under more) 

        
        TabView{
          
            // the journal is for users to journal any thoughts down
            JournalView()
                .tabItem{
                    Label("Journal", systemImage:"book.closed")
                }
            // the social tab is for user to interact with other users this system
            // build connections and gain support
            SocialView()
                .tabItem{
                    Label("Social",systemImage: "person.2.fill")
                }
            
            
            //The home screen( what the user is going to see when the open the app
            // asks for overall mood and shows stats like progress
            HomeView()
                .tabItem{
                    Label("Home",systemImage: "house")
                }
            // the calendar is supposed to be a visual for the user so they can see
            // their day by day progress
            CalendarView()
        
                .tabItem{
                    Label("Calendar",systemImage: "calendar")
                    
                }
           
            //the tools tab is any tools that a person can use towards their mental health
            ToolsView()
                .tabItem{
                    Label("Tools",systemImage: "heart.text.square")
                }
            // The setttings tab deals with the account settings of the user
            // they can be customized here
            SettingsView()
                .tabItem{
                    Label("Settings", systemImage: "gear")
                }
        }
        
    }
}




//Moved all views into their own files









#Preview {
    ContentView()
}
