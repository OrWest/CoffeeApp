//
//  TabBarView.swift
//  Coffee
//
//  Created by Aleksandr Motarykin on 16.01.22.
//

import SwiftUI

extension Array {
    subscript(safe index: Index) -> Element? {
        guard index < self.count else { return nil }
        
        return self[index]
    }
}

struct TabBarView: View {
    enum Tab: Int, Identifiable, Equatable, CaseIterable {
        var id: Int { rawValue }
        
        case insights
        case dashboard
        case settings
    }

    private struct TabAppearance {
        let image: Image
        
        init(tab: Tab) {
            switch tab {
            case .insights:
                image = Image(systemName: "chart.xyaxis.line")
            case .dashboard:
                image = Image(systemName: "cup.and.saucer")
            case .settings:
                image = Image(systemName: "gear")
            }
        }
    }
    
    @State var selectedTab: Tab
    
    var body: some View {
        HStack(alignment: .center, spacing: 20) {
            ForEach(Tab.allCases) { tab in
                TabBarButton(icon: TabAppearance(tab: tab).image, isActive: selectedTab == tab) {
                    switch tab {
                    case .insights:
                        insightsSelected()
                    case .dashboard:
                        dashboardSelected()
                    case .settings:
                        settingsSelected()
                    }
                }
            }
        }
    }
    
    init(selectedTab: Tab = .dashboard) {
        self.selectedTab = selectedTab
    }
    
    private func dashboardSelected() {
        self.selectedTab = .dashboard
    }
    
    private func insightsSelected() {
        self.selectedTab = .insights
    }
    
    private func settingsSelected() {
        self.selectedTab = .settings
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(selectedTab: .insights)
            .previewLayout(PreviewLayout.fixed(width: 300, height: 80))
        TabBarView(selectedTab: .dashboard)
            .previewLayout(PreviewLayout.fixed(width: 300, height: 80))
        TabBarView(selectedTab: .settings)
            .previewLayout(PreviewLayout.fixed(width: 300, height: 80))
    }
}
