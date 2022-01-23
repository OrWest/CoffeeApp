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
    @ObservedObject var viewModel: TabBarViewModel
    
    var body: some View {
        HStack(alignment: .center, spacing: 20) {
            ForEach(viewModel.tabs) { tab in
                TabBarButton(icon: tab.image, isActive: tab.isActive) {
                    switch tab.tab {
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
    
    init(selectedTab: TabBarViewModel.Tab = .dashboard) {
        viewModel = TabBarViewModel(selectedTab: selectedTab)
    }
    
    private func dashboardSelected() {
        viewModel.selectedTab = .dashboard
    }
    
    private func insightsSelected() {
        viewModel.selectedTab = .insights
    }
    
    private func settingsSelected() {
        viewModel.selectedTab = .settings
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
