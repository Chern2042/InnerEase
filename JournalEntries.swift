//
//  JournalEnteries.swift
//  Inner Ease
//
//  Created by Christian Hernandez on 5/7/25.
//
import SwiftUI
import Foundation


//goals for 4.0:
//The ability to view old journals and to edit make comments on them
//4.0 update: Journal page sees a massive update. Journal entries now save and can be viewed later on top of that Journals are given a mood tag based on how the user is feeling this is something the user selects.

//Placeholder until more work is done
//Sets JournalEntry as an object
struct JournalEntry: Identifiable, Codable {
    var id = UUID()  // Gives each entry a unique identifier
    var text: String
    var timestamp: Date
    let tag: String
}


//The class journal storage stores journal entries to be viewed later on
class JournalStorage: ObservableObject{

    @Published var entries: [JournalEntry] = []
    private let filename = "journal.json"
    
    init() {
     load()
    }
    //saves the entry
    func saveEntry(_ text:String, tag: String){
        let newEntry = JournalEntry(text:text,timestamp:Date(),tag: tag)
        entries.insert(newEntry, at: 0)
        save()
    }
    //saves the file
    private func save (){
        let url = getDocumentsDirectory().appendingPathComponent(filename)
            do {
              let data = try JSONEncoder().encode(entries)
              try data.write(to: url)
              print("✅ Saved \(entries.count) journal entries to: \(url.path)")
            } catch {
              print("❌ Failed to save journal: \(error)")
          }
       }
    //loads up previous saved fil
    private func load (){
        let url = getDocumentsDirectory().appendingPathComponent(filename)
        print("📂 Loading from: \(url.path)")
        guard let data = try? Data(contentsOf: url) else{
            print("⚠️ No existing journal file found.")
            return
        }
        if let decoded = try? JSONDecoder().decode([JournalEntry].self, from: data){
            entries = decoded
            print("✅ Loaded \(entries.count) journal entries.")
        }else {
            print("❌ Failed to decode journal entries.")
        }
    }
    
    private func getDocumentsDirectory() -> URL {
            FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        }
   }

struct JournalView: View{
    //keeps track of what is typed in the journal entry
    // stored in an array that time stamps the journal entry
    @State private var journalText = ""
    @ObservedObject var journalStorage: JournalStorage
    @State private var selectedTag = "None"
    @State private var searchText = ""
    let tagOptions = ["None", "Happy", "Anxious", "Grateful", "Angry"]
    
    var body: some View{
        //text heading
        VStack(alignment: .leading, spacing: 16){
            Text("Daily Journal 📝")
                .font(.title2)
                .fontWeight(.bold)
            
            // the input text box for the user to type in their journal
            TextEditor(text: $journalText)
                .frame(height: 150)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray.opacity(0.5))
                )
            //tags for the journal entry for the user for organization based on moood
            Picker("Tag", selection: $selectedTag) {
                ForEach(tagOptions, id: \.self) { tag in
                    Text(tag)
                }
            }
            .pickerStyle(.segmented)
            //buton that the user will press to save their entry 
            Button("Save Entry") {
                if !journalText.trimmingCharacters(in: .whitespaces).isEmpty {
                    journalStorage.saveEntry(journalText, tag: selectedTag)
                    journalText = ""
                    selectedTag = "None"
                }
            }
            .font(.headline)
            .frame(maxWidth: . infinity)
            .padding()
            .background(Color("CardBackground"))
            .cornerRadius(10)
            
            
            Divider()
            // shows past entries for user to look back on
            Text("Past Entries")
                .font(.headline)
            
            TextField("Search entries...", text: $searchText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            // filters based on text within the entry, maybe later I'll make it so you have to title entries and go based on that
            var filteredEntries: [JournalEntry] {
                if searchText.isEmpty {
                    return journalStorage.entries
                } else {
                    return journalStorage.entries.filter {
                        $0.text.localizedCaseInsensitiveContains(searchText) ||
                        $0.tag.localizedCaseInsensitiveContains(searchText)
                    }
                }
            }
            //lists of previous entries
            //scroll through past entries
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 12) {
                    ForEach(filteredEntries) { entry in
                        NavigationLink(destination: JournalDetailView(entry: entry)) {
                            VStack(alignment: .leading, spacing: 4) {
                                Text(entry.text.prefix(50) + "…")
                                HStack {
                                    Text(entry.timestamp.formatted(date: .abbreviated, time: .shortened))
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                    Spacer()
                                    //none tag
                                    if entry.tag != "None" {
                                        Text(entry.tag)
                                            .font(.caption)
                                            .foregroundColor(.blue)
                                            .padding(.horizontal, 6)
                                            .padding(.vertical, 2)
                                            .background(Color("CardBackground"))
                                            .cornerRadius(6)
                                    }
                                }
                            }
                            .padding()
                            .background(Color("CardBackground"))
                            .cornerRadius(10)
                        }
                    }
                }
                .padding()
            }
            }
            
            Spacer()
        }
        
        
    }



struct JournalDetailView: View {
    let entry: JournalEntry
// visual view for the past entries that opens another page for users to see more of the entries 
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("📝 Journal Entry")
                .font(.title2)
                .fontWeight(.bold)

            Text(entry.timestamp.formatted(date: .abbreviated, time: .shortened))
                .font(.subheadline)
                .foregroundColor(.gray)

            Divider()

            ScrollView {
                Text(entry.text)
                    .font(.body)
            }

            Spacer()
        }
        .padding()
        .navigationTitle("Entry")
        .navigationBarTitleDisplayMode(.inline)
    }
}


