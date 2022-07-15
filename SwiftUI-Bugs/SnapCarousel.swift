//
//  SnapCarousel.swift
//  BeautyQR
//
//  Created by Ilya Cherkasov on 09.12.2021.
//

import SwiftUI
import WidgetKit

struct SnapCarousel: View {
    
    var spacing: CGFloat = 15.0
    var trailingSpace: CGFloat = 150
    @GestureState var offset: CGFloat = 0
    @State var currentIndex: Int = 0
    @State var imageList = [UIImage]()
    
    var body: some View {
        NavigationView {
            VStack {
                GeometryReader { proxy in
                    let width = proxy.size.width - (trailingSpace - spacing)
                    let adjustMentWidth = (trailingSpace / 2) - spacing
                    HStack(spacing: spacing){
                        ForEach(imageList, id: \.self) { image in
                            GeometryReader { proxy in
                                let scale = getScale(proxy: proxy)
                                Image(uiImage: image)
                                    .resizable()
                                    .cornerRadius(20.0)
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
                                currentIndex = max(min(currentIndex + Int(roundIndex), imageList.count - 1), 0)
                            })
                    )
                }
                .animation(.easeInOut, value: offset == 0)
                .cornerRadius(20)
                .shadow(radius: 5)
            }
        }
        .onAppear {
            for num in 1...6 {
                imageList.append(UIImage(named: "placeholder\(num)")!)
            }
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

struct StyleChoosing_Previews: PreviewProvider {
    static var previews: some View {
        SnapCarousel()
    }
}
