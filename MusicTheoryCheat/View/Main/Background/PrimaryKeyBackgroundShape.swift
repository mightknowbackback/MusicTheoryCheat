//
//  PrimaryKeyBackgroundShape.swift
//  MusicTheoryCheat
//
//  Created by mightknow on 10/20/20.
//

import SwiftUI

struct PrimaryKeyBackgroundShape: View {
    
    @EnvironmentObject var viewModel : ViewModel
    
    var columnCount : CGFloat {
        self.viewModel.model.showSevenths ? 6 : 5
    }
    
    private let topThickness : CGFloat = Dimensions.keyLabel + Dimensions.keyLabelPadding*2
    private func insideCornerRadius(for frame: CGRect) -> CGFloat {
        let fullHeight = frame.height
        let insideHeight = fullHeight - self.topThickness*2
        let rowHeight = (insideHeight - Dimensions.gridShapePadding*8)/7
        let radius = rowHeight/2 + Dimensions.gridShapePadding
        return radius
    }
    var body: some View {
        GeometryReader {proxy in
            Path {p in
                let frame = proxy.frame(in: .local)
                let sideWidth = frame.width / self.columnCount
                let insideRadius = self.insideCornerRadius(for: frame)
                p.addArc(center: CGPoint(x: self.topThickness, y: self.topThickness), radius: self.topThickness, startAngle: Angle(radians: .pi), endAngle: Angle(radians: .pi*1.5), clockwise: false)
                p.addArc(center: CGPoint(x: frame.maxX - self.topThickness/2, y: self.topThickness/2), radius: self.topThickness/2, startAngle: Angle(radians: .pi*1.5), endAngle: Angle(radians: .pi*0.5), clockwise: false)
                p.addArc(center: CGPoint(x: sideWidth + insideRadius, y: self.topThickness + insideRadius), radius: insideRadius, startAngle: Angle(radians: .pi*1.5), endAngle: Angle(radians: .pi), clockwise: true)
                p.addArc(center: CGPoint(x: sideWidth/2, y: frame.maxY - self.topThickness - sideWidth/2 - Dimensions.gridShapePadding), radius: sideWidth/2, startAngle: Angle(radians: 0), endAngle: Angle(radians: .pi), clockwise: false)
            }
        }
    }
}

struct PrimaryKeyBackgroundShape_Previews: PreviewProvider {
    static let viewModel = ViewModel()
    static var previews: some View {
        KeyBackgrounds()
        MainView().environmentObject(Self.viewModel)
    }
}
