//
//  SnapCarousel.swift
//  SwiftUI-Bugs
//
//  Created by Ilya Cherkasov on 15.07.2022.
//

import SwiftUI

struct SnapCarousel: View {
    let padding: CGFloat = 0
    let spacing: CGFloat = 50.0
    let size: CGFloat = 200.0
    @State var buffer: CGFloat = 0
    @State var offset: CGFloat = 0
    @State var currentIndex: Int = 0
    @State var currentImageName: String = ""
    var body: some View {
        VStack {
            GeometryReader { proxy in
                HStack(spacing: spacing) {
                    ForEach(1...5, id: \.self) { num in
                        GeometryReader { imageProxy in
                            Image("placeholder\(num)")
                                .resizable()
                                .scaleEffect(getScale(parrentProxy: proxy, imageProxy: imageProxy))
                        }
                        .frame(width: size, height: size)
                        .padding(padding)
                    }
                }
                .offset(x: (proxy.size.width - size) / 2 + offset)
                .frame(maxHeight: .infinity)
                .gesture(
                    DragGesture()
                        .onChanged({ value in
                            offset = buffer + value.translation.width
                        })
                        .onEnded({ value in
                            currentIndex += -Int((value.translation.width / proxy.size.width).rounded())
                            offset = -(size + spacing) * CGFloat(currentIndex)
                            buffer = offset
                            currentIndex = min(currentIndex, 3)
                            currentImageName = "placeholder\(currentIndex + 1)"
                        })
                )
                .animation(.easeInOut, value: offset)
            }
        }
    }
    
    func getScale(parrentProxy: GeometryProxy, imageProxy: GeometryProxy) -> CGFloat {
        let mid = parrentProxy.size.width / 2
        let left = mid * 0.2
        let right = mid * 1.8
                
        var scale: CGFloat = 1
        
        let x = imageProxy.frame(in: .global).midX
        
        if (left...mid).contains(x) {
            scale =  1 + abs(x - left) * 0.002
        }
        
        if (mid...right).contains(x) {
            scale =  1 + abs(x - right) * 0.002
        }
        
        return scale
    }
    
}

struct SnapCarousel_Previews: PreviewProvider {
    static var previews: some View {
        SnapCarousel()
    }
}
