//
//  MoodTrackerView.swift
//  Inner Ease
//
//  Created by Christian Hernandez on 5/7/25.
//

import SwiftUI
// On the home page therea a "check in" or "how are you feeling?" question
//This page does all the heavy lifting when it comes to the moods
// First it displays the moods and the question and then the user clicks their answer
//then the mood gets added to the mood list and then gets display with any previous moods 
struct MoodTrackerView: View {
    @StateObject private var moodStorage = MoodStorage()
    let moods = ["😊", "😐", "😢", "😡", "🥳"]

    var body: some View {
        VStack(spacing: 16) {
            Text("How are you feeling today?")
                .font(.title2)

            HStack(spacing: 16) {
                ForEach(moods, id: \.self) { mood in
                    Button(action: {
                        moodStorage.saveMood(mood)
                    }) {
                        Text(mood)
                            .font(.largeTitle)
                    }
                }
            }

            Divider()

            Text("Recent Mood Logs")
                .font(.headline)

            List(moodStorage.moods) { entry in
                VStack(alignment: .leading) {
                    Text(entry.mood)
                        .font(.title3)
                    Text(entry.timestamp.formatted(date: .abbreviated, time: .shortened))
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }

            Spacer()
        }
        .padding()
    }
}
