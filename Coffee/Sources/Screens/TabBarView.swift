//
//  TabBarView.swift
//  Coffee
//
//  Created by Aleksandr Motarykin on 16.01.22.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        HStack(alignment: .center, spacing: 20) {
            TabBarButton(icon: Image(systemName: "cup.and.saucer"), isActive: true)
            TabBarButton(icon: Image(systemName: "chart.xyaxis.line"), isActive: false)
            TabBarButton(icon: Image(systemName: "gear"), isActive: false)
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
            .previewLayout(PreviewLayout.fixed(width: 300, height: 100))
    }
}
