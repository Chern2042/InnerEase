//
//  MoodStorage .swift
//  Inner Ease
//
//  Created by Christian Hernandez on 5/8/25.
//

import Foundation
// where the moods are stored for the app
class MoodStorage: ObservableObject {
    @Published var moods: [moodEntry] = []

    private let filename = "moods.json"

    init() {
        load()
    }
// saves the users current mood
    func saveMood(_ mood: String) {
        let newEntry = moodEntry(mood: mood, timestamp: Date())
        moods.insert(newEntry, at: 0)
        save()
    }
//function that saves the mood to a file and says if it worked or not
    private func save() {
        do {
            let data = try JSONEncoder().encode(moods)
            let url = getDocumentsDirectory().appendingPathComponent(filename)
            try data.write(to: url)
            print("✅ Mood saved to JSON file.")
        } catch {
            print("❌ Failed to save moods: \(error)")
        }
    }
    //loads mood data 
    private func load() {
        let url = getDocumentsDirectory().appendingPathComponent(filename)
        guard let data = try? Data(contentsOf: url) else { return }

        if let decoded = try? JSONDecoder().decode([moodEntry].self, from: data) {
            moods = decoded
        } else {
            print("❌ Failed to decode saved moods.")
        }
    }

    private func getDocumentsDirectory() -> URL {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
}
