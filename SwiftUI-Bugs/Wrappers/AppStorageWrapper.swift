//
//  AppStorageWrapper.swift
//  SwiftUI-Bugs
//
//  Created by Ilya Cherkasov on 16.07.2022.
//

import SwiftUI

struct AppStorageWrapper: View {
    
    @AppStorage("name") var name = "NoName"
    
    var body: some View {
        VStack {
            Button("To Ilya") {
                name = "Ilya"
            }
            Button("To Vydra") {
                name = "Vydra"
            }
            Button("PrintName") {
                print(name)
            }
            Button("Use old API") {
                changeNameByOldApi()
            }
            TextField("Kek", text: $name)
        }
    }
    
    func changeNameByOldApi() {
        UserDefaults.standard.set("@twostraws", forKey: "name")
    }
    
}

struct AppStorageWrapper_Previews: PreviewProvider {
    static var previews: some View {
        AppStorageWrapper()
    }
}
