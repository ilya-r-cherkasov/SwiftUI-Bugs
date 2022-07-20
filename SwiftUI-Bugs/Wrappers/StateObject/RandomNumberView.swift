//
//  RandomNumberView.swift
//  SwiftUI-Bugs
//
//  Created by Ilya Cherkasov on 19.07.2022.
//

import SwiftUI

struct RandomNumberView: View {
    @State var randomNumber = 0

    var body: some View {
        VStack {
            Text("Random number is: \(randomNumber)")
            Button("Randomize number") {
                randomNumber = (0..<1000).randomElement()!
            }
            CounterView()
        }.padding(.bottom)
    }
}

struct CounterView: View {
    
    @ObservedObject var viewModel = CounterViewModel()
    //@StateObject var viewModel = CounterViewModel()

    var body: some View {
        VStack {
            Text("Count is: \(viewModel.count)")
            Button("Increment Counter") {
                viewModel.incrementCounter()
            }
        }
    }
}

final class CounterViewModel: ObservableObject {
    @Published var count = 0

    func incrementCounter() {
        count += 1
    }
}

struct RandomNumberView_Previews: PreviewProvider {
    static var previews: some View {
        RandomNumberView()
    }
}
