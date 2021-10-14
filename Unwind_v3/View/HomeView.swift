//
//  HomeView.swift
//  Unwind_v3
//
//  Created by Hugo de Groot on 13/10/2021.
//

import SwiftUI

struct HomeView: View {
    private let title: String
    private let description: String
    
    init(title: String, description: String) {
        self.title = title
        self.description = description
    }
    
    var body: some View {
        Image(systemName: "sunrise.fill")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 50, height: 50)
            .padding(.top, 25)
        Text(title)
            .font(.title)
        Text(description)
            .padding(.top, 10)
            .padding(.leading, 25)
            .padding(.trailing, 25)
            .multilineTextAlignment(.center)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(title: "home-title".localized, description: "home-description".localized)
    }
}
