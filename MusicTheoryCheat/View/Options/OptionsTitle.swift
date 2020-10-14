//
//  OptionsTitle.swift
//  MusicTheoryCheat
//
//  Created by mightknow on 10/12/20.
//

import Foundation
import SwiftUI

struct OptionsTitleNormalView : View {
    @EnvironmentObject var viewModel : ViewModel
    let title : String
    var body : some View {
        return Text(self.title)
    }
}
struct OptionsTitleInfoView : View {
    
    @EnvironmentObject var viewModel : ViewModel
    var infoKey : InfoKey
    var body : some View {
        return Button(action: {
            self.viewModel.infoKey = self.infoKey
            self.viewModel.infoViewIsShowing = true
            
        }) {
            Text("?")
        }
    }
    
}
struct OptionsTitle : View, InfoDisplayable {
    
    @EnvironmentObject var viewModel : ViewModel
    
    let title : String
    var isShowingQuestionMark: Binding<Bool> {
        self.$viewModel.showInfoClickables
    }
    let infoKey: InfoKey
    var showInfo: Binding<Bool>
    var normalView: OptionsTitleNormalView
    var infoRequestView: OptionsTitleInfoView
    typealias NormalView = OptionsTitleNormalView
    typealias InfoRequestView = OptionsTitleInfoView

    init(infoKey: InfoKey, showInfo: Binding<Bool>) {
        self.title = infoKey.rawValue.uppercased()
        self.normalView = OptionsTitleNormalView(title: title)
        self.infoRequestView = OptionsTitleInfoView(infoKey: infoKey)
        self.showInfo = showInfo
        self.infoKey = infoKey
    }

}
