//
//  ToolsPage.swift
//  Inner Ease
//
//  Created by Christian Hernandez on 5/7/25.
//

import SwiftUI
// the tools page is an informitive page to help people find things to calm them down
struct ToolsView: View{
    var body: some View{
        VStack(alignment: .leading, spacing: 16){
            Text("Mental Health Tools")
                .font(.title2)
                .fontWeight(.bold)
            // placeholder list 
            List{
                Text("Deep breathing excersice")
                Text("Quick Journal Prompt")
                Text("Calmimng music playlist")
                Text("Walk challenge")
            }
        }
    }
}
