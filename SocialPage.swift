//
//  SocialPage.swift
//  Inner Ease
//
//  Created by Christian Hernandez on 5/7/25.
//

import SwiftUI
// the social page is meant for users to connect with others
//Social Page 3.0:
// turned the place holder posts into an array that will be displayed in a neat manner
//Goals:
//my goals for this page is to add dms and the ability for the user to post
struct SocialView: View{
    let posts = [
        ("Alex", "Feeling anxious today. Any advice?"),
        ("Jamie", "Tried deep breathing—it really helped."),
        ("Taylor", "Mood tracking keeps me grounded."),
        ("Sam", "Anyone journaling tonight?")
    ]
    
    var body: some View{
        //title text
        VStack(alignment: .leading, spacing: 16) {
            Text("🌍 Community Posts")
                .font(.title2)
                .fontWeight(.bold)
            
            List {
                ForEach(posts, id: \.1) { user, message in
                    VStack(alignment: .leading, spacing: 4) {
                        Text(user)
                            .fontWeight(.bold)
                        Text(message)
                    }
                    .padding(.vertical, 4)
                }
            }
        }
    }
}
