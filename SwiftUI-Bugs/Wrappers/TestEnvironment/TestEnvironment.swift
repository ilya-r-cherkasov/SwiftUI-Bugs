//
//  TestEnvironment.swift
//  SwiftUI-Bugs
//
//  Created by Ilya Cherkasov on 16.07.2022.
//

import SwiftUI

struct TestEnvironment: View {
    
    @Environment(\.defaultMinListRowHeight) var defaultMinListRowHeight
    
    var body: some View {
        VStack {
            Text(defaultMinListRowHeight.description)
            Table()
                .environment(\.defaultMinListRowHeight, 100)
        }
    }
    
}

struct Table: View {
    
    @Environment(\.defaultMinListRowHeight) var defaultMinListRowHeight
    
    var body: some View {
        List {
            Text(defaultMinListRowHeight.description)
            Text("Dummy")
            Text("Dummy")
            Text("Dummy")
        }
        .environment(\.defaultMinListRowHeight, 100)
    }
}

struct TestEnvironment_Previews: PreviewProvider {
    static var previews: some View {
        TestEnvironment()
    }
}
