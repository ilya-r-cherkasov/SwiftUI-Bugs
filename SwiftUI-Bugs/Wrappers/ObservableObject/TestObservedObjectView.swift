//
//  SwiftUIView.swift
//  SwiftUI-Bugs
//
//  Created by Ilya Cherkasov on 16.07.2022.
//

import SwiftUI

struct TestObservedObjectView: View {
    @ObservedObject var viewModel = ViewModel()
    var body: some View {
        VStack {
            Text(viewModel.number.description)
            Tapper()
                .environmentObject(viewModel)
        }
    }
}

struct Tapper: View {
    @EnvironmentObject var viewModel: ViewModel
    var body: some View {
        VStack {
            Button("Tap me!") {
                viewModel.number += 1
                viewModel.objectWillChange.send()
            }
            Text(viewModel.number.description)
        }
        .environmentObject(viewModel)
    }
}

final class ViewModel: ObservableObject {
    var number = 0
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        TestObservedObjectView()
    }
}
