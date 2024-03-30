//
//  MenuList.swift
//  Little Lemon
//
//  Created by Glendito Jeremiah Palendeng on 28/03/24.
//

import SwiftUI


struct MenuListItem: View {
    let dish:Dish

    var body: some View {
        
        HStack{
            VStack(alignment: .leading){
                Text(dish.title ?? "")
                    .font(CustomFonts.cardTitle.font)
                    .foregroundColor(CustomColor.highlight2.color)
                Spacer(minLength: 8)
                Text(dish.descriptionDish ?? "")
                    .font(CustomFonts.paragraph.font)
                    .foregroundColor(CustomColor.primary1.color)
                Spacer(minLength: 8)
                Text("$" + (dish.price ?? "") + ".00")
                    .font(CustomFonts.highlightText.font)
                    .foregroundColor(CustomColor.primary1.color)
            }
            Spacer()
            AsyncImage(url: URL(string: dish.image ?? "")){ image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                ProgressView()
            }
            .frame(maxWidth: 100, maxHeight: 100)
            .cornerRadius(16)
            .clipShape(Rectangle())
                
        }
        .padding([.top,.bottom])
        
    }
}

struct MenuList_Previews: PreviewProvider {
    static var previews: some View {
        
        MenuListItem(dish: PersistenceController.oneDish())
    }
}
