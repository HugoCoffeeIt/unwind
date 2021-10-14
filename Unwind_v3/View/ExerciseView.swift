//
//  ExerciseView.swift
//  Unwind_v3
//
//  Created by Hugo de Groot on 13/10/2021.
//

import SwiftUI

struct ExerciseView: View {
    @StateObject var viewModel = ExerciseViewModel()
    @Binding var startExercise: Bool
    
    let timerOneSecond = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        HomeView(title: viewModel.title, description: viewModel.description)
            .onReceive(timerOneSecond) { time in
                viewModel.startExercise()
                if viewModel.exerciseTime == 0 {
                    timerOneSecond.upstream.connect().cancel()
                    startExercise = false
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
        }
        .padding()
    }
}

struct ExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseView(startExercise: .constant(true))
    }
}
