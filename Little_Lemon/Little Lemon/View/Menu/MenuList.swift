//
//  MenuList.swift
//  Little Lemon
//
//  Created by Glendito Jeremiah Palendeng on 28/03/24.
//

import SwiftUI


struct MenuList: View {
    let items = ["Item 1", "Item 2", "Item 3", "Item 4"]

    var body: some View {
        List(items, id: \.self) { item in
            HStack{
                VStack{
                    Text(item)
                    Text("Description")
                    Text("Price")
                }
                Spacer()

                Rectangle()
                    .frame(width: 100, height:100)
            }
        }
        .listStyle(.plain)
//        .scrollDisabled(true)
        
        
//        VStack{
//            ForEach(0..<10) { index in
//                HStack{
//                    VStack{
//                        Text("item " + String(index))
//                        Text("Description")
//                        Text("Price")
//                    }
//                    Spacer()
//
//                    Rectangle()
//                        .frame(width: 100, height:100)
//                }
//
//            }
//        }
    }
}

struct MenuList_Previews: PreviewProvider {
    static var previews: some View {
        MenuList()
    }
}
