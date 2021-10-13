//
//  ExerciseView.swift
//  Unwind_v3
//
//  Created by Hugo de Groot on 13/10/2021.
//

import SwiftUI

struct ExerciseView: View {
    @Binding var startExercise: Bool
    @State var countdown = 5
    @State var exerciseTime = 50
    @State var title = "Ontspan"
    @State var description = "Sessie begint over 5"
    @State var breatheIn = true
    
    let timerOneSecond = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        HomeView(title: title, description: description)
            .onReceive(timerOneSecond) { time in
                if countdown > 0 {
                    countdown -= 1
                    description = "Sessie begint over \(countdown)"
                } else {
                    if breatheIn {
                        title = "Adem in"
                        description = "Door je neus"
                        exerciseTime -= 1
                        if exerciseTime % 5 == 0 {
                            breatheIn = false
                        }
                    } else {
                        title = "Adem uit"
                        description = "Door je mond"
                        exerciseTime -= 1
                        if exerciseTime % 5 == 0 {
                            breatheIn = true
                        }
                    }
                    if exerciseTime == 0 {
                        timerOneSecond.upstream.connect().cancel()
                        startExercise = false
                    }
                }
            }
        
        Spacer()
        
        Button {
            startExercise = false
        } label: {
            Image(systemName: "stop")
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.white)
                .padding(22)
                .background(
                    Circle()
                    .fill(Color.purple)
                    .shadow(color: Color.purple.opacity(0.15), radius: 5, x: 0, y: 8))
        }.padding()
    }
}

struct ExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
