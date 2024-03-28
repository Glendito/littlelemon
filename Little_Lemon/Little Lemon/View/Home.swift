//
//  Home.swift
//  Little Lemon
//
//  Created by Glendito Jeremiah Palendeng on 28/03/24.
//

import SwiftUI

struct Home: View {
    var body: some View {

        TabView{
            Menu()
                .tabItem{
                    Image(systemName: "list.dash")
                    Text("Menu")
                }
            UserProfile()
                .tabItem{
                    Image(systemName: "square.and.pencil")
                    Text("Profile")
                }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarItems(trailing: EmptyView())
        .toolbar {
            ToolbarItem(placement: .principal) {
                ZStack {
                    Image("Logo")
                        .resizable()
                        .frame(width: 160, height: 30)
                        .aspectRatio(contentMode: .fit)
                }
            }
        }
        .background(Color.white.edgesIgnoringSafeArea(.all))
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
