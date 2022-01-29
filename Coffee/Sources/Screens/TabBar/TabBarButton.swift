//
//  TabBarButton.swift
//  Coffee
//
//  Created by Aleksandr Motarykin on 16.01.22.
//

import SwiftUI

struct TabBarButton: View {
    static let maxSize: CGFloat = 50
    
    let icon: Image
    var isActive: Bool
    var action: (() -> Void)?
    
    var side: CGFloat { isActive ? TabBarButton.maxSize : 30 }
    
    var body: some View {
        ZStack {
            Image(systemName: "")
                .frame(width: TabBarButton.maxSize,
                       height: TabBarButton.maxSize)
            Button(action: {
                action?()
            }, label: {
                icon
                    .resizable()
                    .tint(.white)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: side * 0.6, height: side * 0.6)
            })
            .frame(width: side, height: side)
            .background(isActive ? .yellow : .gray)
            .cornerRadius(side)
        }
    }
}

struct TabBarButton_Previews: PreviewProvider {
    static var previews: some View {
        TabBarButton(icon: Image(systemName: "chart.xyaxis.line"), isActive: false, action: nil)
            .previewLayout(.sizeThatFits)
    }
}
