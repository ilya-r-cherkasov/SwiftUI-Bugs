//
//  SwiftUI_BugsApp.swift
//  SwiftUI-Bugs
//
//  Created by Ilya Cherkasov on 15.07.2022.
//

import SwiftUI

@main
struct SwiftUI_BugsApp: App {
    
    @ObservedObject var secureStore = SecureStore()
    
    var body: some Scene {
        WindowGroup {
            RandomNumberView()
        }
    }
}

class SecureStore: ObservableObject {
    var number = 5
}
