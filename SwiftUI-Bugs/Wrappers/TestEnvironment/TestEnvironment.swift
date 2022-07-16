//
//  TestEnvironment.swift
//  SwiftUI-Bugs
//
//  Created by Ilya Cherkasov on 16.07.2022.
//

import SwiftUI

struct TestEnvironment: View {
    
    @Environment(\.defaultMinListRowHeight) var defaultMinListRowHeight
    @StateObject var userProgress = UserProgress()
    
    var body: some View {
        VStack {
            List {
                Button("Increase User Progress") {
                    userProgress.score += 1
                }
                Dummy()
            }
            .environment(\.defaultMinListRowHeight, 80)
            Button("User Progress") {
                print(userProgress.score)
            }
        }
        .environmentObject(userProgress)
    }
}

class UserProgress: ObservableObject {
    @Published var score = 0
}

struct TestEnvironment_Previews: PreviewProvider {
    static var previews: some View {
        TestEnvironment()
    }
}
