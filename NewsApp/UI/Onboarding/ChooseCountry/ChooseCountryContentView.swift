//
//  ChooseCounntryContentView.swift
//  NewsApp
//
//  Created by Amr Ahmed on 11/08/2021.
//

import SwiftUI

struct ChooseCountryContentView: View {

    var countrySelection : CountrySelection?
    @Binding var showSheetView: Bool

    
    @State var countryList = [Country(id: 1, name: "Egypt"),
                       Country(id: 2, name: "Bahrain"),
                       Country(id: 3, name: "Belgium"),
                       Country(id: 4, name: "Canada"),
                       Country(id: 5, name: "France"),
                       Country(id: 6, name: "China"),
                       Country(id: 7, name: "Denmark")]
    @State var selectedIndex = -1
    
    var body: some View {
        ScrollView{
            VStack() {
                ForEach(0 ..< countryList.count) { index in
                    CountryCell(name: countryList[index].name, isSelected: selectedIndex == index){
                        selectedIndex = index
                    }
                }
                HStack {
                    Button("Submit"){
                        countrySelection?.setSelectedCounntry(country: countryList[selectedIndex])
                        self.showSheetView = false
                    }
                        .padding(.vertical)
                        .padding(.horizontal,50)
                        .background(Colors.blueColor).foregroundColor(.white).cornerRadius(10)
                }.padding(.top,50)
            }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .topLeading)
            
        }
    }
}

struct CountryCell : View {
    var name : String
    var isSelected : Bool
    var action : () -> Void
    var body: some View {
        Button(action: self.action, label: {
            HStack{
                Image("ic_globale")
                Text(name).padding(.leading,5)
                    .foregroundColor(.black)
                Spacer()
                Image(isSelected ? "ic_selected" : "ic_unselected")
            }.padding(.all,20)
        })
    }
}


