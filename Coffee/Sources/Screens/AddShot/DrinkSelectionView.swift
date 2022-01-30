//
//  DrinkSelectionView.swift
//  Coffee
//
//  Created by Aleksandr Motarykin on 30.01.22.
//

import SwiftUI

struct DrinkSelectionView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \CoffeeInfoEntity.id, ascending: true)],
        animation: .default)
    private var items: FetchedResults<CoffeeInfoEntity>

    
    var body: some View {
        List {
//            ForEach(items) { item in
//                NavigationLink {
//                    Text("Item at \(item.timestamp!, formatter: itemFormatter)")
//                } label: {
//                    Text(item.timestamp!, formatter: itemFormatter)
//                }
//            }
        }
    }
}

struct DrinkSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        DrinkSelectionView()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
