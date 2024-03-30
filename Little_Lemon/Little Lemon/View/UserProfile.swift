//
//  Profile.swift
//  Little Lemon
//
//  Created by Glendito Jeremiah Palendeng on 28/03/24.
//

import SwiftUI

struct UserProfile: View {
    
    @Environment(\.presentationMode) var presentation
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var phoneNumber = ""
    @State private var orderToggled = false
    @State private var passwordToggled = false
    @State private var specialToggled = false
    @State private var newsToggled = false
    @State private var isLoggedout = false
    
    var body: some View {
        ScrollView{
            VStack(alignment:.leading){
                
                Text("Personal Information")
                    .padding(.bottom)
                    .font(CustomFonts.sectionTitle.font)
                    .foregroundColor(CustomColor.highlight2.color)
                
                HStack(alignment:.center){
                    Image("Profile")
                        .resizable()
                        .frame(width: 80,height: 80)
                    
                    Spacer(minLength: 16)
                    
                    Button(action: {
                        
                    }) {
                        Text("Change")
                            .font(CustomFonts.leadText.font)
                            .padding(12)
                            .background(CustomColor.primary1.color)
                            .foregroundColor(CustomColor.highlight1.color)
                            .cornerRadius(8)
                        
                    }
                    Button(action: {
                        
                    }) {
                        Text("Remove")
                            .font(CustomFonts.leadText.font)
                            .padding(12)
                            .background(CustomColor.highlight1.color)
                            .foregroundColor(CustomColor.primary1.color)
                            .cornerRadius(1)
                        
                    }
                    Spacer(minLength: 16)
                }
                .padding(.vertical)
                
                Group{
                    Text("First Name")
                        .font(CustomFonts.leadText.font)
                        .foregroundColor(CustomColor.highlight2.color)
                    TextField("First Name", text: $firstName)
                        .padding(.bottom)
                        .textFieldStyle(.roundedBorder)
                        .font(CustomFonts.paragraph.font)
                    
                    Text("Last Name")
                        .foregroundColor(CustomColor.highlight2.color)
                        .font(CustomFonts.leadText.font)
                    TextField("Last Name", text: $lastName)
                        .padding(.bottom)
                        .textFieldStyle(.roundedBorder)
                        .font(CustomFonts.paragraph.font)
                    
                    Text("Email")
                        .foregroundColor(CustomColor.highlight2.color)
                        .font(CustomFonts.leadText.font)
                    TextField("Email", text: $email)
                        .padding(.bottom)
                        .textFieldStyle(.roundedBorder)
                        .font(CustomFonts.paragraph.font)
                    
                    Text("Phone Number")
                        .foregroundColor(CustomColor.highlight2.color)
                        .font(CustomFonts.leadText.font)
                    TextField("No Phone Number", text: $phoneNumber)
                        .padding(.bottom)
                        .textFieldStyle(.roundedBorder)
                        .font(CustomFonts.paragraph.font)
                }
                
                Text("Email Notification")
                    .padding(.vertical)
                    .font(CustomFonts.sectionTitle.font)
                    .foregroundColor(CustomColor.highlight2.color)
                
                Group{
                    HStack{
                        Toggle("", isOn: $orderToggled)
                            .toggleStyle(CheckboxToggleStyle())
                        Text("Order Statuses")
                        Spacer()
                    }
                    HStack{
                        Toggle("", isOn: $passwordToggled)
                            .toggleStyle(CheckboxToggleStyle())
                        Text("Password Changes")
                        Spacer()
                    }
                    HStack{
                        Toggle("", isOn: $specialToggled)
                            .toggleStyle(CheckboxToggleStyle())
                        Text("Special Offers")
                        Spacer()
                    }
                    HStack{
                        Toggle("", isOn: $newsToggled)
                            .toggleStyle(CheckboxToggleStyle())
                        Text("Newsletter")
                        Spacer()
                    }
                }
                .padding(.top,4)
                
                Button(action: {
                    logOutPressed()
                }) {
                    Text("Log Out")
                        .padding()
                        .font(CustomFonts.leadText.font)
                        .frame(maxWidth: .infinity)
                        .background(CustomColor.primary2.color)
                        .foregroundColor(CustomColor.highlight2.color)
                        .cornerRadius(10)
                }
                .padding(.vertical)
                
                
                Spacer()
            }
            .padding()
            
            HStack(alignment:.center){
                
                Button(action: {
                    discardChanges()
                }) {
                    Text("Discard Changes")
                        .font(CustomFonts.leadText.font)
                        .padding(12)
                        .background(CustomColor.highlight1.color)
                        .foregroundColor(CustomColor.primary1.color)
                        .cornerRadius(8)
                }
                
                Button(action: {
                    saveChanges()
                }) {
                    Text("Save Changes")
                        .font(CustomFonts.leadText.font)
                        .padding(12)
                        .background(CustomColor.primary1.color)
                        .foregroundColor(CustomColor.highlight1.color)
                        .cornerRadius(8)
                    
                }
                
            }
            .padding([.horizontal,.bottom])
        }
        .onAppear{
            firstName = UserDefaults.standard.string(forKey: kFirstName) ?? "No First Name"
            lastName = UserDefaults.standard.string(forKey: kLastName) ?? "No Last Name"
            email = UserDefaults.standard.string(forKey: kEmail) ?? "No Email"
            phoneNumber = UserDefaults.standard.string(forKey: kPhoneNumber) ?? "No Phone Number"
            orderToggled = UserDefaults.standard.bool(forKey: kOrderStatuses)
            passwordToggled = UserDefaults.standard.bool(forKey: kPasswordChanges)
            specialToggled = UserDefaults.standard.bool(forKey: kSpecialOffers)
            newsToggled = UserDefaults.standard.bool(forKey: kNewsletter)
            
            print(UserDefaults.standard.set(firstName, forKey: kFirstName))
        }
        .navigationDestination(isPresented: $isLoggedout){
            Onboarding()
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
        .navigationBarItems(trailing:
            Image("Profile")
                .resizable()
                .frame(width: 40, height: 40)
                .aspectRatio(contentMode: .fit)
        )
        .navigationBarItems(leading:
            Button(action: {
                print("Back tapped")
//                goToProfile = true
            self.presentation.wrappedValue.dismiss()
            }) {
                Image(systemName: "arrow.backward.circle.fill")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(CustomColor.primary1.color)
                    .aspectRatio(contentMode: .fit)
            }
        )
        
        
    }
    private func logOutPressed(){
        UserDefaults.standard.set(false,forKey: "kIsLoggedIn")
        
        UserDefaults.standard.set("", forKey: kFirstName)
        UserDefaults.standard.set("", forKey: kLastName)
        UserDefaults.standard.set("", forKey: kEmail)
        UserDefaults.standard.set("", forKey:kPhoneNumber)
        UserDefaults.standard.set(false, forKey: kOrderStatuses)
        UserDefaults.standard.set(false, forKey: kPasswordChanges)
        UserDefaults.standard.set(false, forKey:kSpecialOffers)
        UserDefaults.standard.set(false, forKey:kNewsletter)
        
        isLoggedout = true
    }
    
    private func discardChanges(){
        firstName = UserDefaults.standard.string(forKey: kFirstName)!
        lastName = UserDefaults.standard.string(forKey: kLastName)!
        email = UserDefaults.standard.string(forKey: kEmail)!
        phoneNumber = UserDefaults.standard.string(forKey: kPhoneNumber)!
        orderToggled = UserDefaults.standard.bool(forKey: kOrderStatuses)
        passwordToggled = UserDefaults.standard.bool(forKey: kPasswordChanges)
        specialToggled = UserDefaults.standard.bool(forKey: kSpecialOffers)
        newsToggled = UserDefaults.standard.bool(forKey: kNewsletter)
        self.presentation.wrappedValue.dismiss()
    }
    private func saveChanges(){
        UserDefaults.standard.set(firstName, forKey: kFirstName)
        UserDefaults.standard.set(lastName, forKey: kLastName)
        UserDefaults.standard.set(email, forKey: kEmail)
        UserDefaults.standard.set(phoneNumber, forKey:kPhoneNumber)
        UserDefaults.standard.set(orderToggled, forKey: kOrderStatuses)
        UserDefaults.standard.set(passwordToggled, forKey: kPasswordChanges)
        UserDefaults.standard.set(specialToggled, forKey:kSpecialOffers)
        UserDefaults.standard.set(newsToggled, forKey:kNewsletter)
        self.presentation.wrappedValue.dismiss()
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}
