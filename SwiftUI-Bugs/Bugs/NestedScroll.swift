//
//  NestedScroll.swift
//  SwiftUI-Bugs
//
//  Created by Ilya Cherkasov on 17.07.2022.
//

import SwiftUI

struct NestedScroll: View {
    var body: some View {
        VStack {
            Text("Предложения")
                .font(.system(size: 50))
                .bold()
            ScrollView(.horizontal) {
                HStack(spacing: 20) {
                    ForEach(0..<10) { _ in
                        CardView()
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            .frame(width: 200, height: 200)
                            .background(.blue)
                            .cornerRadius(10)
                    }
                }
            }
        }
    }
}

struct CardView: View {
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 20) {
                ForEach(0..<3) { _ in
                    VStack {
                        Image(systemName: "cart")
                        Text("Покупай")
                    }
                }
            }
        }
    }
}

struct NestedScroll_Previews: PreviewProvider {
    static var previews: some View {
        NestedScroll()
    }
}
