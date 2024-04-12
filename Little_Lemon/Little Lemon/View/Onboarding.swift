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
    @State private var showFirstNameInvalid = false
    @State private var showLastNameInvalid = false
    @State private var showEmailInvalid = false
//    @State private var isValid = false

    @State private var isLoggedIn = false
    
    
    
    
    var body: some View {
        NavigationStack{
            VStack{
                MenuHero()
                    .padding(.top)
                VStack(alignment: .leading) {
                    HStack{
                        Text("First Name *")
                            .foregroundColor(CustomColor.highlight2.color)
                            .font(CustomFonts.leadText.font)
                        if (showFirstNameInvalid){
                            Text("First Name is invalid")
                                .foregroundColor(Color.red)
                                .font(CustomFonts.leadText.font)
                        }
                    }
                    TextField("Input Your First Name", text: $firstName)
                        .font(CustomFonts.paragraph.font)
                        .textFieldStyle(.roundedBorder)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(showFirstNameInvalid ? Color.red : Color.gray, lineWidth: 1)
                        )
                        .padding(.bottom)
                    HStack{
                        Text("Last Name *")
                            .foregroundColor(CustomColor.highlight2.color)
                            .font(CustomFonts.leadText.font)
                        if (showLastNameInvalid){
                            Text("Last Name is invalid")
                                .foregroundColor(Color.red)
                                .font(CustomFonts.leadText.font)
                        }
                    }
                        
                    TextField("Input Your Last Name", text: $lastName)
                        .font(CustomFonts.paragraph.font)
                        .textFieldStyle(.roundedBorder)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(showLastNameInvalid ? Color.red : Color.gray, lineWidth: 1)
                        )
                        .padding(.bottom)
                    
                    HStack{
                        Text("Email *")
                            .foregroundColor(CustomColor.highlight2.color)
                            .font(CustomFonts.leadText.font)
                        if (showEmailInvalid){
                            Text("Email is invalid")
                                .foregroundColor(Color.red)
                                .font(CustomFonts.leadText.font)
                        }
                    }
                    TextField("Input Your Email", text: $email)
                        .font(CustomFonts.paragraph.font)
                        .textFieldStyle(.roundedBorder)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(showEmailInvalid ? Color.red : Color.gray, lineWidth: 1)
                        )
                        .padding(.bottom)
                    
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
            showAlert = false
        }
        
        if (firstName.count <= 3){
            showFirstNameInvalid = true
        }else{
            showFirstNameInvalid = false
        }
        
        if (lastName.count <= 3){
            showLastNameInvalid = true
        }else{
            showLastNameInvalid = false
        }
        
        if(!isValidEmail(email)){
            showEmailInvalid = true
        }else{
            showEmailInvalid = false
        }
        
        
        if(showAlert == false && showFirstNameInvalid == false && showLastNameInvalid == false && showEmailInvalid == false){
            UserDefaults.standard.set(firstName, forKey: kFirstName)
            UserDefaults.standard.set(lastName, forKey: kLastName)
            UserDefaults.standard.set(email, forKey: kEmail)
            UserDefaults.standard.set(true, forKey: kIsLoggedIn)
            
            UserDefaults.standard.set(false, forKey: kOrderStatuses)
            UserDefaults.standard.set(false, forKey: kPasswordChanges)
            UserDefaults.standard.set(false, forKey: kSpecialOffers)
            UserDefaults.standard.set(false, forKey: kNewsletter)
            
            isLoggedIn = true
            
            
            firstName = ""
            lastName = ""
            email = ""
            
        }
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegex = #"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"#
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}
