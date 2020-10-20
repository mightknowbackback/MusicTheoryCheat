//
//  KeyBackgrounds.swift
//  MusicTheoryCheat
//
//  Created by mightknow on 10/20/20.
//

import SwiftUI

struct KeyBackgrounds: View {
    
    @EnvironmentObject var viewModel : ViewModel
    
    func horizontalPadding(_ proxy: GeometryProxy) -> CGFloat {
        let denominator : CGFloat = self.viewModel.model.showSevenths ? 6 : 5
        let columnWidth = proxy.frame(in: .local).width/denominator
        return  columnWidth + Dimensions.gridShapePadding
    }
    func verticalPadding() -> CGFloat {
        return Dimensions.gridShapePadding + Dimensions.keyLabel + Dimensions.keyLabelPadding*2
    }
    
    
    var body: some View {
        ZStack {
            PrimaryKeyBackgroundShape().foregroundColor(self.viewModel.featuredColor)
            PrimaryKeyBackgroundShape().rotationEffect(Angle(radians: .pi)).foregroundColor(self.viewModel.relativeColor)
            GeometryReader {proxy in
                VStack(spacing: 0) {
                    ForEach(0..<7) {i in
                        self.viewModel.colorFor(row: i).clipShape(Capsule()).padding(Dimensions.gridShapePadding/2)
                    }
                }
                .padding([.leading, .trailing], self.horizontalPadding(proxy))
                .padding([.top, .bottom], self.verticalPadding())
            }
            
        }
    }
}

struct KeyBackgrounds_Previews: PreviewProvider {
    static let viewModel = ViewModel()
    static var previews: some View {
        KeyBackgrounds().environmentObject(Self.viewModel)
        MainView().environmentObject(Self.viewModel)
    }
}
