//
//  ChordToneLabel.swift
//  MusicTheoryCheat
//
//  Created by mightknow on 10/14/20.
//

import SwiftUI

struct ChordToneNormalView : View {
    let text : String
    var body: some View {
        Text(self.text)
    }
}
struct ChordToneQuestionMark : View {
    var body: some View {
        Text("?")
    }
}
struct ChordToneInfoLabel : InfoRequestDisplay {
    
    @EnvironmentObject var viewModel: ViewModel
    var questionMarkView = ChordToneQuestionMark()
    let infoKey: InfoKey
    
}
struct ChordToneLabel: InfoDisplayable {
    
    var infoKey: InfoKey
    
    @EnvironmentObject var viewModel : ViewModel
    
    var isShowingQuestionMark: Binding<Bool> {
        self.$viewModel.showInfoClickables
    }
    var normalView : ChordToneNormalView
    var infoRequestView : ChordToneInfoLabel
    
    init(text: String, infoKey: InfoKey) {
        self.infoKey = infoKey
        self.normalView = ChordToneNormalView(text: text)
        self.infoRequestView = ChordToneInfoLabel(infoKey: infoKey)
    }
}

struct ChordToneLabel_Previews: PreviewProvider {
    static let text : String = "B\(flatSymbol)"
    static let viewModel = ViewModel()
    static let infoKey = InfoKey.allCases[9]
    static var previews: some View {
        ChordToneNormalView(text: Self.text).previewLayout(PreviewLayout.sizeThatFits)
        ChordToneQuestionMark().previewLayout(PreviewLayout.sizeThatFits)
        HStack {
            ForEach(0..<4) {_ in
                ChordToneLabel(text: Self.text, infoKey: Self.infoKey).frame(maxWidth: .infinity).environmentObject(Self.viewModel)
            }
        }
        MainView().environmentObject(Self.viewModel)
    }
}
