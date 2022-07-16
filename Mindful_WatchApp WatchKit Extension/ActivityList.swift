//
//  ActivityList.swift
//  Mindful_WatchApp WatchKit Extension
//
//  Created by Jovinca Claudia on 13/07/22.
//

import SwiftUI

struct ActivityList: View {
    @State var listOfActivity : [Activities] = activitiesLess60
    
    var body: some View {
        ScrollView{
            LazyVStack(spacing: 9){
                ForEach(listOfActivity) { item in
                    NavigationLink(destination : BeginBreathing( beginBreathingSeconds: item.breathingTime, beginBreathingRepeat: item.repeating)){
                        HStack(spacing: 8){
                            
                            
                            item.image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20, alignment: .leading)
                                .padding(8)
                                .foregroundColor(Color(red: 132/255, green: 184/255, blue: 252/255))
                            
                            
                            VStack(alignment : .leading, spacing : 1){
                                Text(item.title)
                                    .font(.caption2)
                                    .multilineTextAlignment(.leading)
                                
                                Text(item.time)
                                    .font(.system(size: 12))
                                    .foregroundColor(Color(red: 132/255, green: 184/255, blue: 252/255))
                                    .bold()
                                
                            }
                            Spacer()
                        }
                    }
                }
            }
        }.navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Time")
    }
}


struct BeginBreathing: View {
    @State var beginBreathingSeconds : [Int]
    @State var beginBreathingRepeat : Int
    
    var body: some View {
        VStack{
            Spacer()
            Text("Take a moment.\nAre you ready?")
                .bold()
                .font(.title3)
                .multilineTextAlignment(.center)
            
            Spacer()
            NavigationLink("Begin", destination: BreathingTimerView(breathingSeconds: beginBreathingSeconds, breathingRepeat: beginBreathingRepeat, countdownTimer: 0, timerRunning: true, moveToNextScreen: false, finish: false, scalePoint: 1.0, breathDescription: "Inhale", breathState: 0, opacityAppear: false, animationDuration: 0))
            
        }.navigationTitle("Time")
    }
}

struct ActivityList_Previews: PreviewProvider {
    static var previews: some View {
        ActivityList()
    }
}

struct BeginBreathing_Previews: PreviewProvider {
    static var previews: some View {
        BeginBreathing(beginBreathingSeconds: [4, 7, 8], beginBreathingRepeat: 1)
    }
}
