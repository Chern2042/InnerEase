//
//  SocialPage.swift
//  Inner Ease
//
//  Created by Christian Hernandez on 5/7/25.
//

import SwiftUI
// the social page is meant for users to connect with others
struct SocialView: View{
    var body: some View{
        //title text
        VStack(alignment: .leading, spacing: 16){
            Text("Social")
                .font(.title2)
                .fontWeight(.bold)
            // subheading for the the social page
            Text("Connect with others and gain support")
                .font(.body)
            // placeholder as an example 
            List{
                Section(header: Text("Recent posts")){
                    Text("From Alex: Exams are making me feel anxious, any advice? ")
                    Text("From Sarah: Journaling helped me , this is how")
                    Text("From Jamie: What are some physcial activities that help you calm down")
                }
            }
        }
    }
}
