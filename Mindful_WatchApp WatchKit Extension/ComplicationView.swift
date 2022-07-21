//
//  ComplicationView.swift
//  Mindful_WatchApp WatchKit Extension
//
//  Created by Jovinca Claudia on 19/07/22.
//
/*
import SwiftUI
import ClockKit

class mindfulTime: ObservableObject{
    @Published var exactTime = 5
    init(){
        
    }
    
}

struct CircularComplicationView: View{
    var timer2 = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var mindfulImage : String = "wakeUp"
    @StateObject var timeSetted: mindfulTime = mindfulTime()
    
    public var body: some View {
        Image(mindfulImage)
            .onReceive(timer2) { _ in
                if timeSetted.exactTime != 0 {
                    timeSetted.exactTime -= 1
                    mindfulImage = "beforeSleep"
                }
            }
    }
}


struct ComplicationsView_Previews: PreviewProvider{
    static var previews: some View {
        CLKComplicationTemplateGraphicCircularView(CircularComplicationView())
            .previewContext()
        
    }
}
*/
