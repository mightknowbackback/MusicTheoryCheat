//
//  KeyBackgrounds.swift
//  MusicTheoryCheat
//
//  Created by mightknow on 10/20/20.
//

import SwiftUI

struct KeyBackgrounds: View {
    var body: some View {
        ZStack {
            PrimaryKeyBackgroundShape().foregroundColor(CustomColors.primaryDarkSwift)
            PrimaryKeyBackgroundShape().rotationEffect(Angle(radians: .pi)).foregroundColor(CustomColors.primaryLightSwift)
        }
    }
}

struct KeyBackgrounds_Previews: PreviewProvider {
    static let viewModel = ViewModel()
    static var previews: some View {
        KeyBackgrounds()
        MainView().environmentObject(Self.viewModel)
    }
}
