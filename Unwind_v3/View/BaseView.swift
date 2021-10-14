//
//  BaseView.swift
//  Unwind_v3
//
//  Created by Hugo de Groot on 13/10/2021.
//

import SwiftUI

struct BaseView: View {
    @StateObject var viewModel = BaseViewModel()
    @State private var showingPopover = false
    
    let title = "home-title".localized
    let description = "home-description".localized
    
    var body: some View {
        VStack {
            if viewModel.startExercise {
                ExerciseView(startExercise: $viewModel.startExercise)
            } else {
                HomeView(title: title, description: description)
                Spacer()
                HStack {
                    #if !APPCLIP
                    TabButton(image: "clock.arrow.circlepath", content: "Geschiedenis")
                    TabButton(image: "slider.vertical.3", content: "Statistieken")
                    #endif
                    
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
                    
                    #if !APPCLIP
                    TabButton(image: "leaf.fill", content: "Sfeer")
                    TabButton(image: "gearshape.fill", content: "Sfeer")
                    #endif
                }
                    .padding(.top, -10)
                    .frame(maxWidth: .infinity)
            }
        }.background(Image("background_day")
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea())
    }
    
    @ViewBuilder
    func TabButton(image: String, content: String) -> some View {
        Button {
            showingPopover.toggle()
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
