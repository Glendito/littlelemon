//
//  MenuHero.swift
//  Little Lemon
//
//  Created by Glendito Jeremiah Palendeng on 28/03/24.
//

import SwiftUI

struct MenuHero: View {
    @State private var searchTextField:String = ""
//    @Binding var showSearch:Bool
    
    var body: some View {
        VStack(alignment:.leading){
                Text("Little Lemon")
                    .padding([.bottom,.top],-16)
                    .font(CustomFonts.display.font)
                    .foregroundColor(CustomColor.primary2.color)
            
            
            HStack{
                VStack(alignment:.leading){
                    Text("Chicago")
                        .padding(.top,-8)
                        .padding(.bottom,-6)
                        .font(CustomFonts.subTitle.font)
                        .foregroundColor(CustomColor.highlight1.color)
                        
                    Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
                        .lineSpacing(1.5)
                        .lineLimit(nil)
                        .font(CustomFonts.paragraph.font)
                        .foregroundColor(CustomColor.highlight1.color)
                        .fixedSize(horizontal: false, vertical: true)
                }
                
                Spacer()
                Image("Hero image")
                    .resizable() // Make the image resizable
                    .frame(width: 130, height: 140)
                    .cornerRadius(16)
                    .aspectRatio(contentMode: .fill)

            }
            .padding(.bottom)
            
            
//                TextField("Search", text: $searchTextField)
//                    .padding(.horizontal) // Add horizontal padding only
//                    .padding(.bottom) // Add bottom padding
//                    .padding(.leading, 8) // Add leading padding for the magnifying glass icon
//                    .background(CustomColor.highlight1.color)
//                    .overlay(
//                        Image(systemName: "magnifyingglass")
//                            .foregroundColor(.gray)
//                            .padding(.leading, 8) // Adjust the position of the magnifying glass icon
//                            .frame(alignment: .leading), alignment: .leading
//                    )
            
            
        }
        .padding()

        .background(CustomColor.primary1.color)
        
            
    }
}

struct MenuHero_Previews: PreviewProvider {
    static var previews: some View {
        @State var test:Bool = true
        MenuHero()
    }
}
