//
//  Profile.swift
//  Little Lemon
//
//  Created by Glendito Jeremiah Palendeng on 28/03/24.
//

import SwiftUI

struct UserProfile: View {
    var profileFName = UserDefaults.standard.string(forKey: kFirstName)
    var profileLName = UserDefaults.standard.string(forKey: kLastName)
    var profileEmail = UserDefaults.standard.string(forKey: kEmail)
    @Environment(\.presentationMode) var presentation
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    
    var body: some View {
        
        
        
        
        VStack(alignment:.leading){
            
            Text("Personal Information")
                .padding(.bottom)
                .font(CustomFonts.sectionTitle.font)
            Image("Profile")
                .resizable()
                .frame(width: 80,height: 80)
                .padding(.bottom)
                

            Text("First Name")
                .font(CustomFonts.leadText.font)
                .foregroundColor(CustomColor.highlight2.color)
            TextField(profileFName ?? "no input", text: $firstName)
                .padding(.bottom)
                .textFieldStyle(.roundedBorder)
                .font(CustomFonts.paragraph.font)
            
            Text("Last Name")
                .foregroundColor(CustomColor.highlight2.color)
                .font(CustomFonts.leadText.font)
            TextField(profileLName ?? "no input", text: $lastName)
                .padding(.bottom)
                .textFieldStyle(.roundedBorder)
                .font(CustomFonts.paragraph.font)
            
            Text("Email")
                .foregroundColor(CustomColor.highlight2.color)
                .font(CustomFonts.leadText.font)
            TextField(profileEmail ?? "no input", text: $email)
                .padding(.bottom)
                .textFieldStyle(.roundedBorder)
                .font(CustomFonts.paragraph.font)
            
            
            Button(action: {
                UserDefaults.standard.set(false,forKey: "kIsLoggedIn")
                self.presentation.wrappedValue.dismiss()
            }) {
                Text("Log Out")
                    .padding()
                    .font(CustomFonts.leadText.font)
                    .frame(maxWidth: .infinity)
                    .background(CustomColor.primary2.color)
                    .foregroundColor(CustomColor.highlight2.color)
                    .cornerRadius(10)
            }
            .padding(.top)
            Spacer()
        }
        .padding()
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}
