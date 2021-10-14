//
//  ExerciseViewModel.swift
//  Unwind_v3
//
//  Created by Hugo de Groot on 14/10/2021.
//

import Foundation

class ExerciseViewModel: ObservableObject {
    @Published var countdown = 4
    @Published var exerciseTime = 50
    @Published var title = "ontspan".localized
    @Published var description = "sessie".localized + " \(5)"
    @Published var exercise: Exercise = .breatheOut
    
    func startExercise() {
        if countdown > 0 {
            description = "sessie".localized + " \(countdown)"
            countdown -= 1
        } else {
            if exerciseTime % 5 == 0 {
                changeBreath()
            }
            exerciseTime -= 1
        }
    }
    
    func changeBreath() {
        switch exercise {
        case .breatheIn:
            exercise = .breatheOut
        case .breatheOut:
            exercise = .breatheIn
        }
        
        title = exercise.title
        description = exercise.description
    }
}
