//
//  ContentView.swift
//  SwiftUI-Bugs
//
//  Created by Ilya Cherkasov on 15.07.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            Text("Hello, world!")
                .padding()
                .navigationTitle("Главная")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
