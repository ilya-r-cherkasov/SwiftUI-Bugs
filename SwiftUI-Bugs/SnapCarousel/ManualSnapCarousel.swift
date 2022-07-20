//
//  ManualSnapCarousel.swift
//  SwiftUI-Bugs
//
//  Created by Ilya Cherkasov on 19.07.2022.
//

import SwiftUI
import UIKit

struct ManualSnapCarousel: View {
    
    @State var color: UIColor = .random
    
    var body: some View {
        VStack {
            Button("Tap me!") {
                color = .random
            }
            CustomScrollView(color: $color)
                .frame(width: 200, height: 100)
        }
    }
}

struct ManualSnapCarousel_Previews: PreviewProvider {
    static var previews: some View {
        ManualSnapCarousel()
    }
}

extension UIColor {
    static var random: UIColor {
        return UIColor(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            alpha: 1.0
        )
    }
}

extension Color {
    static var random: Color {
        return Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1)
        )
    }
}
