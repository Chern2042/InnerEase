//
//  ToolsPage.swift
//  Inner Ease
//
//  Created by Christian Hernandez on 5/7/25.
//

import SwiftUI
// the tools page is an informitive page to help people find things to calm them down
struct ToolsView: View{
    //Tools 3.0:
    //Within this version I changed the texts to labels to give it a cleaner look with icons
    //Goals:
    // I do want to turn these into buttons where they go to a secondary page where the user can get more info on each tab
    var body: some View{
        VStack(alignment: .leading, spacing: 16){
            Text("Mental Health Tools")
                .font(.title2)
                .fontWeight(.bold)
            // placeholder list 
            List{
                Label("Deep breathing excersice",systemImage: "lungs.fill")
                Label("Quick Journal Prompt",systemImage: "square.and.pencil")
                Label("Calmimng music playlist",systemImage: "music.note")
                Label("Walk challenge",systemImage: "figure.walk")
                Label("Drink Water ",systemImage: "drop.fill")
            }
        }
    }
}
