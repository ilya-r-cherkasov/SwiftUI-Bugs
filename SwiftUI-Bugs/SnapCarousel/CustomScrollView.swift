//
//  CustomScrollView.swift
//  SwiftUI-Bugs
//
//  Created by Ilya Cherkasov on 19.07.2022.
//

import SwiftUI

struct CustomScrollView: UIViewRepresentable {
    
    @Binding var color: UIColor
    
    typealias UIViewType = UIScrollView
    
    func makeUIView(context: Context) -> UIScrollView {
        let scrollView = UIScrollView()
        scrollView.contentSize = CGSize(width: 300, height: 100)
        scrollView.backgroundColor = .green
        scrollView.delegate = context.coordinator
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = true
        scrollView.decelerationRate = .fast
        
        let view = makeNestedCustomScrollView()
        scrollView.addSubview(makeNestedCustomScrollView())
        return scrollView
    }
    
    func makeNestedCustomScrollView() -> UIScrollView {
        let scrollView = UIScrollView()
        scrollView.contentSize = CGSize(width: 300, height: 100)
        scrollView.backgroundColor = .red
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = true
        scrollView.decelerationRate = .fast
        scrollView.frame = CGRect(x: 50, y: 0, width: 100, height: 100)
        return scrollView
    }
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {
        uiView.backgroundColor = color
    }
    
    func makeCoordinator() -> CustomScrollViewCoordinator {
        CustomScrollViewCoordinator()
    }
    
    var nestedScrollView: some View {
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
        .frame(width: 100, height: 50)
        .background(.red)
    }
    
}


class CustomScrollViewCoordinator: NSObject, UIScrollViewDelegate {
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        //targetContentOffset.pointee = .zero
    }
    
}

struct CustomScrollView_Previews: PreviewProvider {
    static var previews: some View {
        ManualSnapCarousel()
    }
}
