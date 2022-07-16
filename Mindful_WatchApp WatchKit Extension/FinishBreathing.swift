//
//  FinishBreathing.swift
//  Mindful_WatchApp WatchKit Extension
//
//  Created by Jovinca Claudia on 15/07/22.
//

import SwiftUI

struct FinishBreathing: View {
//    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack{
            Spacer()
            ZStack{
                Circle()
                    .frame(width: 60, height: 60, alignment: .center)
                    .foregroundColor(.green)
                
                Circle()
                    .frame(width: 80, height: 80, alignment: .center)
                    .foregroundColor(.green)
                    .opacity(0.2)
                
                Image(systemName: "checkmark")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30, alignment: .center)
                    .foregroundColor(.white)
                
            }.padding()
            Spacer()
            Text("You Did It!🥳")
                .padding()
            Spacer()
//            Button("Done") {
//                dismiss()
//            }
            NavigationLink("Done", destination: ContentView())
        }.navigationBarTitleDisplayMode(.inline)
        .navigationBarHidden(true)
        
    }
}

struct FinishBreathing_Previews: PreviewProvider {
    static var previews: some View {
        FinishBreathing()
    }
}
