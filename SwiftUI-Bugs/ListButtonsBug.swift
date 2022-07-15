//
//  ListButtonsBug.swift
//  SwiftUI-Bugs
//
//  Created by Ilya Cherkasov on 15.07.2022.
//

import SwiftUI

struct ListButtonsBug: View {
    var body: some View {
        List {
            HStack {
                Button {
                    print("button 1 tapped")
                } label: {
                    Text("One")
                }
                    
                Button {
                    print("button 2 tapped")
                } label: {
                    Text("Two")
                }
            }
        }
    }
}

struct ListButtonsBug_Previews: PreviewProvider {
    static var previews: some View {
        ListButtonsBug()
    }
}
