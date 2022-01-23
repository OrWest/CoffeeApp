//
//  TabBarViewModel.swift
//  Coffee
//
//  Created by Aleksandr Motarykin on 23.01.22.
//

import Foundation
import SwiftUI

class TabBarViewModel: ObservableObject {
    enum Tab: Int, Equatable, CaseIterable {
        case insights
        case dashboard
        case settings
    }

    struct TabAppearance: Identifiable {
        let id: Int
        let image: Image
        let tab: Tab
        var isActive: Bool
        
        init(tab: Tab, isActive: Bool) {
            self.id = tab.rawValue
            self.tab = tab
            self.isActive = isActive
            
            switch tab {
            case .insights:
                self.image = Image(systemName: "chart.xyaxis.line")
            case .dashboard:
                self.image = Image(systemName: "cup.and.saucer")
            case .settings:
                self.image = Image(systemName: "gear")
            }
        }
    }
    
    var selectedTab: Tab {
        didSet {
            tabs = TabBarViewModel.getTabsAppearance(selectedTab: selectedTab)
        }
    }
    @Published private(set) var tabs: [TabAppearance]
    
    init(selectedTab: Tab) {
        self.selectedTab = selectedTab
        
        self.tabs = TabBarViewModel.getTabsAppearance(selectedTab: selectedTab)
    }
    
    private static func getTabsAppearance(selectedTab: Tab) -> [TabAppearance] {
        return Tab.allCases.enumerated().map { TabAppearance(tab: $1, isActive: $0 == selectedTab.rawValue) }
    }
}
