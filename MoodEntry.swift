//
//  MoodEntry.swift
//  Inner Ease
//
//  Created by Christian Hernandez on 5/8/25.
//
import Foundation
//Mood entry object used for storing moods of users 

struct moodEntry:Identifiable, Codable{
    var id = UUID()
    let mood: String
    let timestamp: Date
}
