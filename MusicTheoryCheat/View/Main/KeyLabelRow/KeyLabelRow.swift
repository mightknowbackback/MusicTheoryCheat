//
//  KeyLabelRow.swift
//  MusicTheoryCheat
//
//  Created by mightknow on 10/19/20.
//

import SwiftUI

struct KeyLabelRow: View {
    
    @EnvironmentObject var viewModel: ViewModel
    
    let nearKeyFlatsText : String
    let mainKeyText : String
    let nearKeySharpsText : String
    
    let nearKeyFlatsInfoKey : InfoKey
    let mainKeyInfoKey : InfoKey
    let nearKeySharpsInfoKey : InfoKey
    
    var body: some View {
        HStack {
            NearKeyLabel(text: self.nearKeyFlatsText, infoKey: self.nearKeyFlatsInfoKey)
            MainKeyLabel(text: self.mainKeyText, infoKey: self.mainKeyInfoKey)
            NearKeyLabel(text: self.nearKeySharpsText, infoKey: self.nearKeySharpsInfoKey)
        }.padding(8).background(CustomColors.accentSwift).clipShape(Capsule()).frame(maxHeight: Dimensions.keyLabel)
    }
    
    init(textForFlatKey flatText: String, main mainText: String, sharp sharpText: String, isMain : Bool = true) {
        self.nearKeyFlatsText = flatText
        self.mainKeyText = mainText
        self.nearKeySharpsText = sharpText
        let nearFlatIndex = isMain ? 6 : 51
        let mainIndex = isMain ? 7 : 52
        let nearSharpIndex = isMain ? 8 : 53
        self.nearKeyFlatsInfoKey = InfoKey.allCases[nearFlatIndex]
        self.mainKeyInfoKey = InfoKey.allCases[mainIndex]
        self.nearKeySharpsInfoKey = InfoKey.allCases[nearSharpIndex]
    }
}

struct KeyLabelRow_Previews: PreviewProvider {
    static let viewModel = ViewModel()
    static var previews: some View {
        KeyLabelRow(textForFlatKey: "A\(flatSymbol)", main: "E\(flatSymbol) Major", sharp: "B\(flatSymbol)").environmentObject(Self.viewModel).previewLayout(PreviewLayout.sizeThatFits)
        MainView().environmentObject(Self.viewModel)
    }
}
