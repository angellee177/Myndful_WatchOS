//
//  BreathingTimerView.swift
//  Mindful_WatchApp WatchKit Extension
//
//  Created by Jovinca Claudia on 14/07/22.
//

import SwiftUI

struct BreathingTimerView: View {
    @Environment(\.dismiss) var dismiss
    
    @State var breathingSeconds : [Int] = [4, 7, 8, 0]
    @State var breathingRepeat : Int = 3
    
    //setted
    @State var countdownTimer = 1
    @State var timerRunning = true
    @State var moveToNextScreen = false
    @State var finish = false
    @State var scalePoint : Double = 1.0
    @State var breathDescription : String = "Inhale"
    @State var breathState : Int = 0
    @State var opacityAppear = false
    
    @State var animationDuration : Double = 0
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack{
            ZStack{
                NavigationLink(destination: FinishBreathing(), isActive: $moveToNextScreen) {
                    EmptyView()
                }.opacity(0)
                
                LinearGradient(
                    colors: [Color(red: 180/255, green: 194/255, blue: 253/255), Color(red: 122/255, green: 181/255, blue: 252/255)],
                    startPoint: .top,
                    endPoint: .bottom
                ).frame(width: 130, height: 130, alignment: .center)
                    .mask(
                        Circle()
                            .frame(width: 60, height: 60, alignment: .center)
                            .blur(radius: 5)
                    )
                    .scaleEffect(scalePoint)
                    .animation(.linear(duration: animationDuration), value: scalePoint)
                
                Text("\(countdownTimer)")
                    .foregroundColor(.black)
                    .font(.title)
                
                    .onReceive(timer){ _ in
                        if countdownTimer>1 && timerRunning{
                            countdownTimer -= 1
                        }
                        else{
                            if finish {
                                timerRunning = false
                                moveToNextScreen = true
                                return
                            }
                            //breathingSeconds[3] != 3 ? 2:1
                            updateTimer()
                            
                            switch(breathState){
                            case 0:
                                scalePoint = 1.5
                                breathState = 1
                                breathDescription = "Inhale"
                            case 1:
                                scalePoint = 1.5
                                breathState = 2
                                breathDescription = "Hold"
                            case 2:
                                scalePoint = 1
                                breathDescription = "Exhale"
                                if breathingSeconds[3] == 0{
                                    breathState = 0
                                    breathingRepeat-=1
                                    finish = breathingRepeat==0 ? true : false
                                }else{
                                    breathState = 3
                                }
                            case 3:
                                scalePoint = 1
                                breathState = 0
                                breathingRepeat-=1
                                breathDescription = "Hold"
                                finish = breathingRepeat==0 ? true : false
                            default:
                                print("fail")
                            }
//                            let impact = UIImpactFeedbackGenerator(style: .heavy)
//                            impact.impactOccurred()
                            WKInterfaceDevice.current().play(.failure)
                        }
                    }
                
            }
            .padding(.bottom, 2)
            .onAppear{
                withAnimation(Animation.spring().speed(0.06)) {
                    opacityAppear.toggle()
                }
            }
            .opacity(opacityAppear ? 1:0)
            
            Text(breathDescription)
                .opacity(opacityAppear ? 1:0.1)
                .font(.title3)
            //)
        }.navigationTitle("Time")
    }
    
    func updateTimer(){
        switch(breathState){
        case 0:
            countdownTimer = breathingSeconds[0]
        case 1:
            countdownTimer = breathingSeconds[1]
        case 2:
            countdownTimer = breathingSeconds[2]
        case 3:
            countdownTimer = breathingSeconds[3]
        default:
            print("fail")
        }
        animationDuration = Double(countdownTimer)
    }
}

struct BreathingTimerView_Previews: PreviewProvider {
    static var previews: some View {
        BreathingTimerView()
    }
}
