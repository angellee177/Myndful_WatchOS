//
//  BreathingActivityData.swift
//  Mindful_WatchApp WatchKit Extension
//
//  Created by Jovinca Claudia on 15/07/22.
//

import Foundation

import SwiftUI

struct Activities : Identifiable{
    var id = UUID()
    var title : String
    var image : Image
    var time :String
    var repeating : Int
    var breathingTime : [Int]
    
    init(title:String, image : Image, time:String, repeating : Int, breathingTime : [Int]){
        self.title = title
        self.image = image
        self.time = time
        self.repeating = repeating
        self.breathingTime = breathingTime
    }
}

let activitiesLess60 : [Activities] = [Activities(title: "Quick Breathing", image: Image("quickBreathing"), time: "15 SECS", repeating: 1, breathingTime: [5,5,5,0]),
                                       Activities(title: "Emergency Breathing", image: Image("emergency"), time: "21 Seconds", repeating: 1, breathingTime: [7,7,7,0]),
                                       Activities(title: "Before Sleep Breathing", image: Image("beforeSleep"), time: "57 SECS", repeating: 3, breathingTime: [4, 7, 8, 0]),
                                       Activities(title: "Calm Breathing", image: Image("breathingCalm"), time: "60 SECS", repeating: 10, breathingTime: [3,3,3,0])]

let activitiesMore60 : [Activities] = [Activities(title: "Wake Up Breathing", image: Image("wakeUp"), time: "120 SECS", repeating: 12, breathingTime: [8, 1, 2, 0]),
                                       Activities(title: "Productivity Breathing", image: Image("productivity"), time: "192 SECS", repeating: 16, breathingTime: [3,3,3,3])]

