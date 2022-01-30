//
//  DrinkInfoView.swift
//  Coffee
//
//  Created by Aleksandr Motarykin on 30.01.22.
//

import SwiftUI

struct DrinkInfoView: View {
    let drinkInfo: CoffeeInfoEntity
    
    var body: some View {
        HStack {
            Text(drinkInfo.name!)
                .padding()
            Spacer()
            Text(LocalizedFormatter.formatCaffeineIn100ml(drinkInfo.caffeineMgIn100ml))
                .padding()
        }
    }
}

struct DrinkInfoView_Previews: PreviewProvider {
    static var previews: some View {
        DrinkInfoView(drinkInfo: CoffeeInfoEntity.preview).previewLayout(.fixed(width: 300, height: 80))
    }
}

extension CoffeeInfoEntity {
    static var preview: CoffeeInfoEntity {
        let content = PersistenceController.preview.container.viewContext
        
        let entity = CoffeeInfoEntity(context: content)
        entity.name = "Latte"
        entity.caffeineMgIn100ml = 987
        
        return entity
    }
}
