//
//  StateExample.swift
//  SwiftUI-Bugs
//
//  Created by Ilya Cherkasov on 19.07.2022.
//

import SwiftUI

struct StateExample: View {
    @State var number: Int = 0
    var body: some View {
        VStack {
            Button("Tap me!") {
                number += 1
            }
            NestedView(number: $number)
        }
    }
}

struct NestedView: View {
    @Binding var number: Int
    var body: some View {
        VStack {
            Image(systemName: "lightbulb")
            Text("Number \(number)")
        }
    }
}



struct StateExample_Previews: PreviewProvider {
    static var previews: some View {
        StateExample()
    }
}
