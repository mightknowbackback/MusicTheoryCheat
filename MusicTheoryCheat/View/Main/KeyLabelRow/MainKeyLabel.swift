//
//  MainKeyLabel.swift
//  MusicTheoryCheat
//
//  Created by mightknow on 10/14/20.
//

import SwiftUI

struct MainKeyNormalLabel : View {
    let text : String
    let accidental : String?
    let tonality : String?
    var body: some View {
        HStack(spacing: 0) {
            Text(self.text).font(CustomFonts.mainKey).foregroundColor(Color.white)
            if let a = accidental {
                Text(a).font(CustomFonts.mainKeyAccidental).foregroundColor(Color.white).offset(y: -8)
                Text(self.tonality!).font(CustomFonts.mainKey).foregroundColor(Color.white)
            }
        }.frame(width: 180)
        
    }
    init(text: String) {
        var full = text
        if full.contains(flatSymbol) {
            self.text = String(full.removeFirst())
            //full.remove(at: full.firstIndex(of:" ")!)
            self.accidental = String(full.remove(at: full.firstIndex(of:flatSymbol.first!)!))
            self.tonality = full
        } else if full.contains(sharpSymbol) {
            self.text = String(full.removeFirst())
            //full.remove(at: full.firstIndex(of:" ")!)
            self.accidental = String(full.remove(at: full.firstIndex(of:sharpSymbol.first!)!))
            self.tonality = full
        } else {
            self.accidental = nil
            self.tonality = nil
            self.text = full
        }
        
    }
}
struct MainKeyQuestionMark : View {
    var body: some View {
        MainKeyNormalLabel(text: "?")
    }
}
struct MainKeyInfoLabel : InfoRequestDisplay {
    
    @EnvironmentObject var viewModel: ViewModel
    var infoKey: InfoKey
    var questionMarkView = MainKeyQuestionMark()
    
}
struct MainKeyPlayable : View, Playable {
    
    @EnvironmentObject var viewModel: ViewModel
    var notes: [UInt8] {
        var scale : [UInt8] = []
        switch self.infoKey {
        case .primaryKey:
            scale = self.viewModel.model.currentKey.playableScale
        case .relativeKey:
            scale = self.viewModel.model.currentKey.relativeKey.playableScale
        default:
            return scale
        }
        let octave = scale[0] + 12
        scale.append(octave)
        return scale
    }
    
    func play() {
        self.viewModel.model.sequencer.playMelody(withNotes: self.notes)
    }
    
    var text : String
    var infoKey : InfoKey
    
    var body: some View {
        Button(action: self.play) {
            MainKeyNormalLabel(text: self.text)
        }
    }
}
struct MainKeyLabel: InfoDisplayable {
    
    @EnvironmentObject var viewModel : ViewModel
    
    var isShowingQuestionMark: Binding<Bool> {
        self.$viewModel.showInfoClickables
    }
    
    var infoKey: InfoKey
    var normalView: MainKeyPlayable
    var infoRequestView: MainKeyInfoLabel
    
    init(text: String, infoKey: InfoKey) {
        self.normalView = MainKeyPlayable(text: text, infoKey: infoKey)
        self.infoKey = infoKey
        self.infoRequestView = InfoRequestView(infoKey: infoKey)
    }
}

struct MainKeyLabel_Previews: PreviewProvider {
    static let text : String = "A\(flatSymbol)"
    static let viewModel = ViewModel()
    static let infoKey = InfoKey.allCases[7]
    static var previews: some View {
        MainKeyNormalLabel(text: Self.text).previewLayout(PreviewLayout.sizeThatFits)
        MainKeyQuestionMark().previewLayout(PreviewLayout.sizeThatFits)
        KeyLabelRow(textForFlatKey: "A\(flatSymbol)", main: "E\(flatSymbol) Major", sharp: "B\(flatSymbol)").environmentObject(Self.viewModel).previewLayout(PreviewLayout.sizeThatFits)
        MainKeyLabel(text: Self.text, infoKey: Self.infoKey).environmentObject(Self.viewModel)
        MainView().environmentObject(Self.viewModel)
    }
}
