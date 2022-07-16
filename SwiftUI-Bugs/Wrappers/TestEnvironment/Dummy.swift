//
//  Dummy.swift
//  SwiftUI-Bugs
//
//  Created by Ilya Cherkasov on 16.07.2022.
//

import SwiftUI

struct Dummy: View {
    
    @EnvironmentObject var userProgress: UserProgress
    
    var body: some View {
        Text("userProgress " + userProgress.score.description)
    }
}

struct Dummy_Previews: PreviewProvider {
    static var previews: some View {
        Dummy()
    }
}
