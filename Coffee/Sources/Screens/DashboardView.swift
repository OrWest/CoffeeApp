//
//  DashboardView.swift
//  Coffee
//
//  Created by Aleksandr Motarykin on 29.01.22.
//

import SwiftUI

struct DashboardView: View {
    @State private var showAddShot = false
    
    var body: some View {
        VStack {
            Spacer()
            Button {
                addAction()
            } label: {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .tint(.green)
                    .frame(width: 50, height: 50)
            }
            .padding([.bottom], TabBarContainerView.tabBarHeight)
            .sheet(isPresented: $showAddShot) {
                AddShotView()
            }
        }

    }
    
    private func addAction() {
        showAddShot.toggle()
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
