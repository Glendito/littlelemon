//
//  Home.swift
//  Little Lemon
//
//  Created by Glendito Jeremiah Palendeng on 28/03/24.
//

import SwiftUI

struct Home: View {
    
    @State private var goToProfile = false
    var body: some View {
        let persistenceController = PersistenceController.shared
        
            
//        TabView{
//            Menu()
//                .tabItem{
//                    Image(systemName: "list.dash")
//                    Text("Menu")
//                }
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
//            UserProfile()
//                .tabItem{
//                    Image(systemName: "square.and.pencil")
//                    Text("Profile")
//                }
//        }
        
        Menu()
        .environment(\.managedObjectContext, persistenceController.container.viewContext)
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("", displayMode: .inline)
        .navigationDestination(isPresented: $goToProfile ) {
            UserProfile()
        }
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
        .navigationBarItems(trailing:
            Button(action: {
                // Handle profile image tap action
                print("Profile image tapped")
                goToProfile = true
            }) {
                Image("Profile")
                    .resizable()
                    .frame(width: 45, height: 45)
                    .aspectRatio(contentMode: .fit)
            }
        )
        
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
