//
//  ContentView.swift
//  FileManager
//
//  Created by Shuhari on 2022/11/16.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        VStack {
            Text("Select a picture")
                .font(.system(size: 30, weight: .bold))
                .padding(.top, 30)
            Gallery()
            Spacer()
            SeparatorView()
            Spacer()
            RevealView()
                .padding(.bottom, 30)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
