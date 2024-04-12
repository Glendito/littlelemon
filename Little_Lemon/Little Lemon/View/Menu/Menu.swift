//
//  Menu.swift
//  Little Lemon
//
//  Created by Glendito Jeremiah Palendeng on 28/03/24.
//

import SwiftUI

struct Menu: View {

    @Environment(\.managedObjectContext) private var viewContext
    
    @State private var searchText = ""
    @State private var isLoaded = false
    
    @State private var starterSorted = true
    @State private var mainSorted = true
    @State private var dessertSorted = true
    @State private var drinkSorted = true
    @State private var isKeyboardVisible = false
    
    var body: some View {
        
        VStack{
            
            if(!isKeyboardVisible){
                MenuHero()
                    .padding(.top)
            }
            
            TextField("Search menu", text: $searchText)
                .textFieldStyle(.roundedBorder)

                .padding(.leading, 32)
                
                .overlay(
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                        .frame(alignment: .leading), alignment: .leading
                )
                .padding([.leading,.trailing])
            
            HStack{
                Text("ORDER FOR DELIVERY !")
                    .font(CustomFonts.sectionTitle.font)
                    .foregroundColor(CustomColor.highlight2.color)
                Spacer()
            }
            .padding(.horizontal)
            .padding(.top,8)
            
            HStack(spacing: 20){
                Toggle("Starters", isOn: $starterSorted)
                Toggle("Mains",isOn: $mainSorted)
                Toggle("Desserts", isOn: $dessertSorted)
                Toggle("Drinks", isOn: $drinkSorted)
            }
            .toggleStyle(MyToggleStyle())
            .padding(.horizontal)
            
                
            FetchedObjects(predicate: buildPredicate(),sortDescriptors: buildSortDecriptors()) { (dishes: [Dish]) in
                List{
                    ForEach(dishes){ dish in
                        MenuListItem(dish: dish)
                    }
                }
                .listStyle(.plain)
            }
           
        }
        .onAppear{
            if (isLoaded == false){
                do{
                    try getMenuData()
                }catch{
                    print("cant find data")
                }
                
                isLoaded = true
            }
        }
        .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)) { notification in
            withAnimation {
                self.isKeyboardVisible = true
            }
            
        }
        .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)) { notification in
            withAnimation {
                self.isKeyboardVisible = false
            }
        }
        
    }
    
    func getMenuData() throws{
        
        PersistenceController.shared.clear()
        
        let menuAddress :String = "https://mocki.io/v1/0d8cc5ef-9a02-479d-a894-e91d98570d7c"
            /*https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json*/
        
        let menuURL = URL(string: menuAddress)
        
        guard let menuURL = menuURL else{
            throw NSError()
        }
        
        let request = URLRequest(url: menuURL)
        
        let task = URLSession.shared.dataTask(with: request){ data,response, error in
            
            if let data = data/*,
               let responseString = String(data: data,encoding: .utf8)*/{
                
//                print(responseString)
                
                let decoder = JSONDecoder()
                if let menuData = try? decoder.decode(MenuList.self, from: data){
                    for menu in menuData.menu{
                        let dish = Dish(context: viewContext)
                        dish.title = menu.title
                        dish.price = menu.price
                        dish.descriptionDish = menu.descriptionDish
                        dish.category = menu.category
                        dish.image = menu.image
                    }
                    try? viewContext.save()
                }
            }
        }
        
        task.resume()
    }
    
    func buildSortDecriptors() ->[NSSortDescriptor]{
        return[ NSSortDescriptor(key: "title",
                                 ascending: true,
                                 selector: #selector(NSString.localizedStandardCompare)),
        ]
    }
    
    func buildPredicate()-> NSPredicate{
        
        let search = searchText == "" ? NSPredicate(value: true) : NSPredicate(format: "title CONTAINS[cd] %@", searchText)
        let starters = !starterSorted ? NSPredicate(format: "category != %@", "starters") : NSPredicate(value: true)
        let mains = !mainSorted ? NSPredicate(format: "category != %@", "mains") : NSPredicate(value: true)
        let desserts = !dessertSorted ? NSPredicate(format: "category != %@", "desserts") : NSPredicate(value: true)
        let drinks = !drinkSorted ? NSPredicate(format: "category != %@", "drinks") : NSPredicate(value: true)

        let compoundPredicate = NSCompoundPredicate(andPredicateWithSubpredicates: [search, starters, mains, desserts, drinks])
        
        return compoundPredicate
    }
    
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu().environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
    }
}
