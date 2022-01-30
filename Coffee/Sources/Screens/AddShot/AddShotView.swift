//
//  AddShotView.swift
//  Coffee
//
//  Created by Aleksandr Motarykin on 29.01.22.
//

import SwiftUI

struct AddShotView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            List {
                Section("Select drink") {

                }
            }.listStyle(InsetGroupedListStyle())
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "xmark")
                }

            }
        }
    }
}

struct AddShotView_Previews: PreviewProvider {
    static var previews: some View {
        AddShotView()
    }
}
