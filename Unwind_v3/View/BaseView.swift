//
//  BaseView.swift
//  Unwind_v3
//
//  Created by Hugo de Groot on 13/10/2021.
//

import SwiftUI

struct BaseView: View {
    @ObservedObject var viewModel = ViewModel()
    @State private var showingPopover = false
    var title = "Verse start"
    var description = "Deze ademhalingsoefening bereidt je voor op de dag met een verfrist, ontspannen gevoel en schudt ook eventuele slaapresten van je af."
    var body: some View {
        VStack {
            if !viewModel.startExercise {
                HomeView(title: title, description: description)
                Spacer()
                HStack {
                    TabButton(image: "clock.arrow.circlepath")
                    TabButton(image: "slider.vertical.3")
                    
                    Button {
                        viewModel.startExercise = true
                    } label: {
                        Image(systemName: "play")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.white)
                            .padding(22)
                            .background(
                                Circle()
                                .fill(Color.purple)
                                .shadow(color: Color.purple.opacity(0.15), radius: 5, x: 0, y: 8))
                    }.padding()
                    
                    TabButton(image: "leaf.fill")
                    TabButton(image: "gearshape.fill")
                }
                    .padding(.top, -10)
                    .frame(maxWidth: .infinity)
            } else {
                ExerciseView(startExercise: $viewModel.startExercise)
            }
            
            
        }.background(Image("background_day").resizable().scaledToFill().ignoresSafeArea())
    }
    
    @ViewBuilder
    func TabButton(image: String) -> some View {
        Button {
            showingPopover = true
        } label: {
            Image(image)
                .resizable()
                .renderingMode(.template)
                .aspectRatio(contentMode: .fit)
                .frame(width: 25, height: 25)
                .foregroundColor(Color.gray.opacity(0.8))
                .padding()
        }.popover(isPresented: $showingPopover) {
            Text("Your content here")
                .font(.headline)
                .padding()
        }
    }
}

struct BaseView_Previews: PreviewProvider {
    static var previews: some View {
        BaseView()
    }
}
