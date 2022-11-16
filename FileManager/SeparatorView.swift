//
//  SeparatorView.swift
//  FileManager
//
//  Created by Shuhari on 2022/11/16.
//

import SwiftUI

struct SeparatorView: View {
    var body: some View {
        HStack(spacing: 10) {
            Circle()
                .frame(width: 6, height: 6)
            Circle()
                .frame(width: 6, height: 6)
            Circle()
                .frame(width: 6, height: 6)
        }
        .foregroundColor(.gray.opacity(0.2))
        
    }
}

struct SeparatorView_Previews: PreviewProvider {
    static var previews: some View {
        SeparatorView()
    }
}
