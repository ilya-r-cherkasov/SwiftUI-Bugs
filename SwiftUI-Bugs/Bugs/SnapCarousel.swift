//
//  SnapCarousel.swift
//  BeautyQR
//
//  Created by Ilya Cherkasov on 09.12.2021.
//

import SwiftUI

struct SnapCarousel: View {
    
    var spacing: CGFloat = 15.0
    var trailingSpace: CGFloat = 150
    @GestureState var offset: CGFloat = 0
    @State var currentIndex: Int = 0
    @State var names = ["Ilya", "Vova", "Anna", "Nastya"]
    
    var body: some View {
        VStack {
            GeometryReader { proxy in
                let width = proxy.size.width - (trailingSpace - spacing)
                let adjustMentWidth = (trailingSpace / 2) - spacing
                HStack(spacing: spacing){
                    ForEach(names, id: \.self) { name in
                        GeometryReader { proxy in
                            let scale = getScale(proxy: proxy)
                            Text(name)
                                .frame(width: 200, height: 200)
                                .background(.blue)
                                .cornerRadius(20)
                                .scaleEffect(scale)
                        }
                        .padding()
                        .frame(
                            width: max(proxy.size.width - trailingSpace, 0),
                            height: max(proxy.size.width - trailingSpace, 0)
                        )
                    }
                }
                .frame(maxHeight: .infinity, alignment: .center)
                .padding(.horizontal, spacing)
                .offset(x: (CGFloat(currentIndex) * -width) + adjustMentWidth + offset)
                .gesture(
                    DragGesture()
                        .updating($offset, body: { value, out, _ in
                            out = value.translation.width
                        })
                        .onEnded({ value in
                            let offsetX = value.translation.width
                            let progress = -offsetX / width
                            let roundIndex = progress.rounded()
                            currentIndex = max(min(currentIndex + Int(roundIndex), names.count - 1), 0)
                        })
                )
            }
            .animation(.easeInOut, value: offset == 0)
            .cornerRadius(20)
            .shadow(radius: 5)
        }
    }
    
    private func getScale(proxy: GeometryProxy) -> CGFloat {
        
        let mid = UIScreen.main.bounds.width / 2
        let left = mid * 0.2
        let right = mid * 1.8
        
        var scale: CGFloat = 1
        
        let x = proxy.frame(in: .global).midX
        
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
