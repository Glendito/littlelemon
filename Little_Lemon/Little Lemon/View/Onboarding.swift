//
//  Onboarding.swift
//  Little Lemon
//
//  Created by Glendito Jeremiah Palendeng on 27/03/24.
//

import SwiftUI


struct Onboarding: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var showAlert = false
    
//    @State var showHeroSearch = false
    @State private var isLoggedIn = false
    
    
    
    
    var body: some View {
        NavigationStack{
            VStack{
                MenuHero()
                    .padding(.top)
                VStack(alignment: .leading) {
                    Text("First Name")
                        .foregroundColor(CustomColor.highlight2.color)
                        .font(CustomFonts.leadText.font)
                    TextField("Input Your First Name", text: $firstName)
                        .padding(.bottom)
                        .font(CustomFonts.paragraph.font)
                        .textFieldStyle(.roundedBorder)
                    
                    Text("Last Name")
                        .foregroundColor(CustomColor.highlight2.color)
                        .font(CustomFonts.leadText.font)
                        
                    TextField("Input Your Last Name", text: $lastName)
                        .padding(.bottom)
                        .font(CustomFonts.paragraph.font)
                        .textFieldStyle(.roundedBorder)
                    
                    Text("Email")
                        .foregroundColor(CustomColor.highlight2.color)
                        .font(CustomFonts.leadText.font)
                        
                    TextField("Input Your Email", text: $email)
                        .padding(.bottom)
                        .font(CustomFonts.paragraph.font)
                        .textFieldStyle(.roundedBorder)
                    
                    Button(action: {
                        registerTapped()
                    }) {
                        Text("Register")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(CustomColor.primary2.color)
                            .font(CustomFonts.leadText.font)
                            .foregroundColor(CustomColor.highlight2.color)
                            .cornerRadius(10)
                    }
                            .padding([.top,.bottom])
                    .alert(isPresented: $showAlert) {
                        Alert(title: Text("Alert"), message: Text("First Name, last Name, and email cannot be empty"), dismissButton: .default(Text("OK")))
                    }
                    Spacer()
                }
                .padding()
                .navigationDestination(isPresented: $isLoggedIn) {
                    Home()
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
                .onAppear{
                    if UserDefaults.standard.bool(forKey: "kIsLoggedIn") {
                        // Perform actions if user is logged in
                        isLoggedIn = true
                        print("User is logged in!")
                    }
                }
            }
            .frame(alignment: .top)
        }
        
    }
    
    func registerTapped(){
        if(firstName.isEmpty || lastName.isEmpty || email.isEmpty){
            showAlert = true
        }else{
            UserDefaults.standard.set(firstName, forKey: kFirstName)
            UserDefaults.standard.set(lastName, forKey: kLastName)
            UserDefaults.standard.set(email, forKey: kEmail)
            UserDefaults.standard.set(true, forKey: kIsLoggedIn)
            
            UserDefaults.standard.set(false, forKey: kOrderStatuses)
            UserDefaults.standard.set(false, forKey: kPasswordChanges)
            UserDefaults.standard.set(false, forKey:kSpecialOffers)
            UserDefaults.standard.set(false, forKey:kNewsletter)
            
            isLoggedIn = true
            
            
            firstName = ""
            lastName = ""
            email = ""
            
        }
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}
