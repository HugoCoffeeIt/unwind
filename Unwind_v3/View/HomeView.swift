//
//  HomeView.swift
//  Unwind_v3
//
//  Created by Hugo de Groot on 13/10/2021.
//

import SwiftUI

struct HomeView: View {
    var title: String
    var description: String
    var body: some View {
        Image(systemName: "sunrise.fill")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 50, height: 50)
            .padding(.init(top: 25, leading: 0, bottom: 0, trailing: 0))
        Text(title)
            .font(.title)
        Text(description)
            .padding(.init(top: 10, leading: 25, bottom: 0, trailing: 25))
            .multilineTextAlignment(.center)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
