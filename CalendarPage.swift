//
//  CalendarPage.swift
//  Inner Ease
//
//  Created by Christian Hernandez on 5/7/25.
//

import SwiftUI
// this sets up the calendar view for the app and any heavy lifting for the calendar will be done here

struct CalendarView: View{
    var body: some View{
        // title text (placeholder for now)
        // Tells the user to do their check ins which 
        VStack(alignment: .leading, spacing:16){
            Text("Calendar Progress")
                .font(.title)
                .padding()
            Text("Your moods will show her once you do your daily check ins")
                .font(.body)
                .foregroundColor(.gray)
                .padding(.bottom)
            Spacer()
        }
        .padding()
        
        
    }
       
}

