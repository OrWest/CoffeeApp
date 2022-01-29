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
    
    private func dashboardSelected() {
        withAnimation {
            viewModel.selectedTab = .dashboard
        }
    }
    
    private func insightsSelected() {
        withAnimation {
            viewModel.selectedTab = .insights
        }
    }
    
    private func settingsSelected() {
        withAnimation {
            viewModel.selectedTab = .settings            
        }
    }
}

extension TabBarViewModel {
    static let stubInsights = TabBarViewModel(selectedTab: Binding<Tab>.init(get: { .insights }, set: {_ in}))
    static let stubDashboard = TabBarViewModel(selectedTab: Binding<Tab>.init(get: { .dashboard }, set: {_ in}))
    static let stubSettings = TabBarViewModel(selectedTab: Binding<Tab>.init(get: { .settings }, set: {_ in}))
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(viewModel: .stubInsights)
            .previewLayout(PreviewLayout.fixed(width: 300, height: 80))
        TabBarView(viewModel: .stubDashboard)
            .previewLayout(PreviewLayout.fixed(width: 300, height: 80))
        TabBarView(viewModel: .stubSettings)
            .previewLayout(PreviewLayout.fixed(width: 300, height: 80))
    }
}
