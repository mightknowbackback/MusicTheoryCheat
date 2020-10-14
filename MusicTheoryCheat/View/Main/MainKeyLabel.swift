//
//  MainKeyLabel.swift
//  MusicTheoryCheat
//
//  Created by mightknow on 10/14/20.
//

import SwiftUI

struct MainKeyNormalLabel : View {
    let text : String
    var body: some View {
        Text(self.text)
    }
}
struct MainKeyQuestionMark : View {
    var body: some View {
        Text("?")
    }
}
struct MainKeyInfoLabel : InfoRequestDisplay {
    
    @EnvironmentObject var viewModel: ViewModel
    var infoKey: InfoKey
    var questionMarkView = MainKeyQuestionMark()
    
}
struct MainKeyLabel: InfoDisplayable {
    
    @EnvironmentObject var viewModel : ViewModel
    
    var isShowingQuestionMark: Binding<Bool> {
        self.$viewModel.showInfoClickables
    }
    
    var infoKey: InfoKey
    var normalView: MainKeyNormalLabel
    var infoRequestView: MainKeyInfoLabel
    
    init(text: String, infoKey: InfoKey) {
        self.normalView = NormalView(text: text)
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
        MainKeyLabel(text: Self.text, infoKey: Self.infoKey).environmentObject(Self.viewModel)
        MainView().environmentObject(Self.viewModel)
    }
}
