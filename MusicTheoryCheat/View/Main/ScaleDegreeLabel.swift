//
//  ScaleDegreeLabel.swift
//  MusicTheoryCheat
//
//  Created by mightknow on 10/14/20.
//

import SwiftUI

struct ScaleDegreeNormalLabel : View {
    let text : String
    var body: some View {
        Text(self.text).font(CustomFonts.nearKey)
            .foregroundColor(.white)
            .shadow(radius: 6)
    }
}
struct ScaleDegreePlayable : View, Playable {
    
    @EnvironmentObject var viewModel: ViewModel
    let text: String
    let infoKey : InfoKey
    var notes: [UInt8] {
        let index = InfoKey.allCases.firstIndex(of: self.infoKey)!
        let base = index - 9
        let rootIndex = base/6
        var notes = self.viewModel.model.currentKey.playableChordFor(scaleDegree: rootIndex)
        let seventh = notes.popLast()!
        return self.viewModel.model.showSevenths ? notes + [seventh] : notes
    }
    func play() {
        self.viewModel.model.sequencer.playChord(withNotes: self.notes)
    }
    var body: some View {
        Button(action: self.play) {
            ScaleDegreeNormalLabel(text: self.text)
        }
    }
}
struct ScaleDegreeQuestionMark : View {
    var body: some View {
        ScaleDegreeNormalLabel(text: "?")
    }
}
struct ScaleDegreeInfoLabel : InfoRequestDisplay {
    
    @EnvironmentObject var viewModel: ViewModel
    var questionMarkView = ScaleDegreeQuestionMark()
    let infoKey: InfoKey
    
}
struct ScaleDegreeLabel: InfoDisplayable {
    
    
    
    var infoKey: InfoKey
    
    @EnvironmentObject var viewModel : ViewModel
    
    var isShowingQuestionMark: Binding<Bool> {
        self.$viewModel.showInfoClickables
    }
    var normalView : ScaleDegreePlayable
    var infoRequestView : ScaleDegreeInfoLabel
    
    init(text: String, infoKey: InfoKey) {
        self.infoKey = infoKey
        self.normalView =
            ScaleDegreePlayable(text: text, infoKey: infoKey)
        self.infoRequestView = ScaleDegreeInfoLabel(infoKey: infoKey)
    }
}

struct ScaleDegreeLabel_Previews: PreviewProvider {
    static let text : String = "I"
    static let viewModel = ViewModel()
    static let infoKey = InfoKey.allCases[9]
    static var previews: some View {
        ScaleDegreeNormalLabel(text: Self.text).previewLayout(PreviewLayout.sizeThatFits)
        ScaleDegreeQuestionMark().previewLayout(PreviewLayout.sizeThatFits)
        ScaleDegreeLabel(text: Self.text, infoKey: Self.infoKey).environmentObject(Self.viewModel)
        MainView().environmentObject(Self.viewModel)
    }
}
