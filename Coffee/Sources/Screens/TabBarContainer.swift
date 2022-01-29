//
//  TabBarContainer.swift
//  Coffee
//
//  Created by Aleksandr Motarykin on 29.01.22.
//

import SwiftUI

struct TabBarContainer: View {
    
    @State var activeTab: TabBarViewModel.Tab = .dashboard
    
    var body: some View {
        ZStack {
            content()
            VStack {
                Spacer()
                TabBarView(viewModel: TabBarViewModel(selectedTab: $activeTab))
                    .padding([.bottom], 20)
            }
        }
    }
    
    func content() -> some View {
        let view: AnyView
        
        switch activeTab {
            case .dashboard: view = AnyView(Color.red.ignoresSafeArea())
            case .insights: view = AnyView(Color.green.ignoresSafeArea())
            case .settings: view = AnyView(Color.blue.ignoresSafeArea())
        }
        
        return view
    }
}

struct TabBarContainer_Previews: PreviewProvider {
    static var previews: some View {
        TabBarContainer()
    }
}
