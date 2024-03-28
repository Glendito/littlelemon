//
//  Menu.swift
//  Little Lemon
//
//  Created by Glendito Jeremiah Palendeng on 28/03/24.
//

import SwiftUI

struct Menu: View {
    @State var showHeroSearch:Bool = true
    let items = ["Item 1", "Item 2", "Item 3", "Item 4"]
    
    
    var body: some View {
        VStack{
            MenuHero(showSearch: $showHeroSearch)
                .padding(.top)
            MenuList()
        }
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
