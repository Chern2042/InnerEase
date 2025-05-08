//
//  CalendarPage.swift
//  Inner Ease
//
//  Created by Christian Hernandez on 5/7/25.
//

import SwiftUI
// this sets up the calendar view for the app and any heavy lifting for the calendar will be done here

struct CalendarView: View{
    @StateObject private var moodStorage = MoodStorage()
    var body: some View{
        // title text (placeholder for now)
        // Tells the user to do their check ins which 
        VStack(alignment: .leading, spacing:16){
            Text("Calendar Progress")
                .font(.title)
                .padding()
            //Calendar Updates (3.0)
            // In this verison the Calendar page does not show any activity unless the user
            //enters their mood check in. Once they've filled out their check in it will
            //be displayed on the "calendar" of Check ins.
            
            //Future Goals:
            // display a actual calendar with a mood graph (weekly and monthly and yearly) 
            if moodStorage.moods.isEmpty {
                         Text("No mood entries yet. Start tracking today!")
                             .foregroundColor(.gray)
                     } else {
                         List(moodStorage.moods) { entry in
                             HStack {
                                 Text(entry.mood)
                                 Spacer()
                                 Text(entry.timestamp.formatted(date: .abbreviated, time: .shortened))
                                     .font(.caption)
                                     .foregroundColor(.gray)
                    }
                }
            }
            Spacer()
        }
        .padding()
        
        
    }
       
}

