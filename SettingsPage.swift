//
//  SettingsPage.swift
//  Inner Ease
//
//  Created by Christian Hernandez on 5/7/25.
//

import SwiftUI
// This page is the account settings page where the user can change
// aspects of their account

struct SettingsView: View{
    //sets notifications to one and shows their choosen username
    @State private var notificationsOn = true
    @State private var displayName = "User123"
    //code to display the display texts for the settings page
    var body: some View{
        Form{
            Section(header: Text("Profile")){
                TextField("Display Name", text: $displayName)
            }
            // the toggle  to set notifications on and off
            Section(header: Text("Preferences")){
                Toggle("Enable Notifications", isOn: $notificationsOn)
            }
            // delete account section 
            Section {
                     Button(role: .destructive) {
                         // Log out or delete account action
                     } label: {
                         Text("Delete Account")
                     }
                 }
             }
             .navigationTitle("Settings")
         }
     }
   
  
