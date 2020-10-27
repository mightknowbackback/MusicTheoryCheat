//
//  ChordToneLabel.swift
//  MusicTheoryCheat
//
//  Created by mightknow on 10/14/20.
//

import SwiftUI

struct ChordToneNormalLabel : View {
    let text : String
    var body: some View {
        Text(self.text).font(CustomFonts.nearKey).foregroundColor(.white)
    }
}
struct ChordTonePlayable : View, Playable {
    
    @EnvironmentObject var viewModel : ViewModel
    
    var text : String
    var infoKey: InfoKey
    
    var notes: [UInt8] {
        return self.viewModel.model.currentKey.playableNoteForChordTone(self.infoKey.scaleToneIndex, withRoot: self.infoKey.rootIndex)
    }
    
    func play() {
        self.viewModel.model.sequencer.playChord(withNotes: self.notes)
    }
    var body: some View {
        Button(action: self.play) {
            ChordToneNormalLabel(text: self.text)
        }
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
    
    @EnvironmentObject var viewModel : ViewModel
    
    var infoKey: InfoKey
    
    var isShowingQuestionMark: Binding<Bool> {
        self.$viewModel.showInfoClickables
    }
    var normalView : ChordTonePlayable
    var infoRequestView : ChordToneInfoLabel
    
    init(text: String, infoKey: InfoKey) {
        self.infoKey = infoKey
        self.normalView = ChordTonePlayable(text: text, infoKey: infoKey)
        self.infoRequestView = ChordToneInfoLabel(infoKey: infoKey)
    }
}

struct ChordToneLabel_Previews: PreviewProvider {
    static let text : String = "B\(flatSymbol)"
    static let viewModel = ViewModel()
    static let infoKey = InfoKey.allCases[9]
    static var previews: some View {
        ChordToneNormalLabel(text: Self.text).previewLayout(PreviewLayout.sizeThatFits)
        ChordToneQuestionMark().previewLayout(PreviewLayout.sizeThatFits)
        HStack {
            ForEach(0..<4) {_ in
                ChordToneLabel(text: Self.text, infoKey: Self.infoKey).frame(maxWidth: .infinity).environmentObject(Self.viewModel)
            }
        }
        MainView().environmentObject(Self.viewModel)
    }
}
