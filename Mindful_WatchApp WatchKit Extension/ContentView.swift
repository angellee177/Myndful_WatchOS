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
                Text("Punya waktu berapa lama?")
                
                NavigationLink(destination : ActivityList(listOfActivity: activitiesLess60)){
                Text("< 60 Seconds")
                }
                
                NavigationLink(destination : ActivityList(listOfActivity: activitiesMore60)){
                Text("> 60 Seconds")
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
