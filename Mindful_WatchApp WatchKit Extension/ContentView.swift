//
//  ContentView.swift
//  Mindful_WatchApp WatchKit Extension
//
//  Created by Angel Ria Purnamasari on 12/07/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            VStack(spacing: 10){
                Text("Choose Your Time")
                
                NavigationLink(destination : ActivityList(listOfActivity: activitiesLess60)){
                Text("Under a minute")
                }
                
                NavigationLink(destination : ActivityList(listOfActivity: activitiesMore60)){
                Text("More than a minute")
                }
                
            }
        }.navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
