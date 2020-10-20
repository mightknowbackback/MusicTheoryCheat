//
//  FontText.swift
//  MusicTheoryCheat
//
//  Created by mightknow on 10/19/20.
//

import SwiftUI

struct FontText: View {
    var body: some View {
        ScrollView {
            VStack {
                ForEach(0..<fontStrings.count) {i in
                    Text("A\(flatSymbol) // \(i)").font(.custom(fontStrings[i], size: 14))
                }
            }
        }
    }
}

struct FontText_Previews: PreviewProvider {
    static var previews: some View {
        FontText()
    }
}
