//
//  OptionsTitle.swift
//  MusicTheoryCheat
//
//  Created by mightknow on 10/12/20.
//

import Foundation
import SwiftUI

struct OptionsTitleNormalView : View {
    let title : String
    var body : some View {
        return Text(self.title.uppercased())
    }
}

struct OptionsTitleQuestionMark : View {
    var body : some View {
        return Text("?")
    }
}

struct OptionsTitleInfoRequestView : InfoRequestDisplay {
    
    @EnvironmentObject var viewModel : ViewModel
    var infoKey : InfoKey
    var questionMarkView = OptionsTitleQuestionMark()
    
}

struct OptionsTitle : InfoDisplayable {
    
    @EnvironmentObject var viewModel : ViewModel
    
    let title : String
    var isShowingQuestionMark: Binding<Bool> {
        self.$viewModel.showInfoClickables
    }
    let infoKey: InfoKey
    var normalView: OptionsTitleNormalView
    var infoRequestView: OptionsTitleInfoRequestView

    init(infoKey: InfoKey) {
        self.infoKey = infoKey
        self.title = infoKey.rawValue
        self.normalView = OptionsTitleNormalView(title: title)
        self.infoRequestView = OptionsTitleInfoRequestView(infoKey: infoKey)
    }

}

struct OptionsTitle_Previews : PreviewProvider {
    static let viewModel = ViewModel()
    static let infoKey = InfoKey.allCases[0]
    static var previews : some View {
        OptionsTitleInfoRequestView(infoKey: Self.infoKey).environmentObject(Self.viewModel).previewLayout(PreviewLayout.sizeThatFits)
        OptionsTitleNormalView(title: Self.infoKey.rawValue).previewLayout(PreviewLayout.sizeThatFits)
        Form {
            Section {
                OptionsTitle(infoKey: Self.infoKey).environmentObject(Self.viewModel)
            }
        }
    }
}
