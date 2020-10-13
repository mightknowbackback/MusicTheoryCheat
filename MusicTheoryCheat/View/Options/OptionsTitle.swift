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
    var info : String
    var body : some View {
        return Button(action: {
            self.viewModel.infoText = self.info
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
    var showInfo: Binding<Bool>
    var infoString: String
    var normalView: OptionsTitleNormalView
    var infoRequestView: OptionsTitleInfoView
    typealias NormalView = OptionsTitleNormalView
    typealias InfoRequestView = OptionsTitleInfoView

    init(title: String, infoString: String, showInfo: Binding<Bool>) {
        self.title = title
        self.infoString = infoString
        self.normalView = OptionsTitleNormalView(title: title)
        self.infoRequestView = OptionsTitleInfoView(info: self.infoString)
        self.showInfo = showInfo
    }

}
