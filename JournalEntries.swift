//
//  JournalEnteries.swift
//  Inner Ease
//
//  Created by Christian Hernandez on 5/7/25.
//
import SwiftUI


//Placeholder until more work is done 
struct JournalEntry: Identifiable {
    let id = UUID()  // Gives each entry a unique identifier
    var text: String
    var timestamp: Date
}

struct JournalView: View{
    //keeps track of what is typed in the journal entry
    // stored in an array that time stamps the journal entry
    @State private var journalText = ""
    @State private var entries: [JournalEntry] = []
    
    var body: some View{
        //text heading
        VStack(alignment: .leading, spacing: 16){
            Text("Daily Journal ")
                .font(.title2)
                .fontWeight(.bold)
            
            // the input text box for the user to type in their journal
            TextEditor(text: $journalText)
                .frame(height: 150)
                .overlay(
                RoundedRectangle(cornerRadius: 8)
                .stroke(Color.gray.opacity(0.5))
                           )
            
            Button(action:{
                //insert into entry array
                if !journalText.isEmpty{
                    let entry = JournalEntry(text: journalText, timestamp: Date())
                    entries.insert(entry, at: 0)
                    journalText = ""
                }
            }){
                // saves entry
                Text("Save Entry")
                    .font(.headline)
                    .frame(maxWidth: . infinity)
                    .padding()
                    .background(Color.blue.opacity(0.2))
                    .cornerRadius(10)
            }
            
            Divider()
            // shows past entries for user to look back on
            Text("Past Entries")
                .font(.headline)
            //lists of previous entries 
            List(entries) { entry in
                VStack(alignment: .leading) {
                    Text(entry.text)
                        .lineLimit(2)
                    Text(entry.timestamp.formatted())
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
        
            Spacer()
        }
        .padding()
    }
}

