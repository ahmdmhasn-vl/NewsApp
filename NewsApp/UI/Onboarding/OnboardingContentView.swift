//
//  OnboardingContentView.swift
//  NewsApp
//
//  Created by Amr Ahmed on 11/08/2021.
//

import SwiftUI

protocol CountrySelection {
    func setSelectedCounntry(country : Country)
}
struct OnboardingContentView: View,CountrySelection {
    
    @State private var showingSheet = false
    @StateObject private var viewModel = OnboardingViewModel()
    
    var body: some View {
        VStack() {

            NavigationLink("",destination: {
                VStack {
                        HomeContentView()
                }
            }(), isActive: $viewModel.shouldOpenHome)
            
            Text("Select your country").fontWeight(.regular)
                .frame(minWidth: 0, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading).padding(.leading,20).padding(.vertical,12)
                .font(.system(size: 16))
            
            VStack {
                Button(action: {
                    showingSheet.toggle()
                }, label: {
                    HStack {
                        Text(viewModel.selectedCountry.name).fontWeight(.medium)
                            .padding(.horizontal, 20)
                            .font(.system(size: 14))
                            .foregroundColor(.black)
                        Spacer()
                        Image("ic_arrow")
                            .padding()
                    }
                }).sheet(isPresented: $showingSheet) {
                    ChooseCountryContentView(countrySelection: self,showSheetView: self.$showingSheet)
                }
                
            }.frame(minWidth: 0, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: 0, maxHeight: 60, alignment: .center)
            .background(Colors.greyColor).cornerRadius(10).padding(.horizontal,20).padding(.bottom,0)
            
            if viewModel.showCountryError {
                Text("Please Choose country").frame(minWidth: 0, maxWidth: .infinity,alignment: .leading).padding(.leading,20).padding(.vertical,5).foregroundColor(Color.red).font(.system(size: 13))
            }
            
            Text("Select your preferences").frame(minWidth: 0, maxWidth: .infinity,alignment: .leading)
                .padding(.leading,20).padding(.top,50).padding(.bottom,6)
            
            Text("Maximum 3 topics").frame(minWidth: 0, maxWidth: .infinity,alignment: .leading).padding(.leading,20).padding(.vertical, -12).foregroundColor(Color.blue).font(.system(size: 13))
            
            ScrollView(.horizontal,showsIndicators: false){
                HStack{
                    ForEach(0..<viewModel.categories.count) { index in
                        CategorySelectionView(title: viewModel.categories[index].title, isSelected: self.viewModel.selectedNewsCategories.contains(viewModel.categories[index])) {
                            viewModel.handleCategorySelection(index: index)
                        }
                    }
                }
            }.padding(.leading,12).padding(.top,10)
            
            if viewModel.showNewsCategoryError {
                Text("Please choose at least one category").frame(minWidth: 0, maxWidth: .infinity,alignment: .leading).padding(.leading,20).padding(.vertical,5).foregroundColor(Color.red).font(.system(size: 13))
            }
            HStack {
                Button("Submit"){
                    viewModel.submitAction()
                }
                .padding(.vertical)
                .padding(.horizontal,50)
                .background(Colors.blueColor)
                .foregroundColor(.white)
                .cornerRadius(10)
            }.padding(.top,50)
            
        }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .center)
    }
    
    func setSelectedCounntry(country: Country) {
        viewModel.selectedCountry = country
        viewModel.showCountryError = false
    }
}

struct CategorySelectionView : View {
    var title : String
    var isSelected : Bool
    var action : () -> Void
    
    var body : some View {
        Button(title,action: self.action)
            .padding()
            .foregroundColor(isSelected ? .white : .black)
            .border(Color.clear, width: 0)
            .background(isSelected ? Colors.blueColor : Colors.greyColor)
            .cornerRadius(10)
            .padding(.leading,5)
    }
}

struct OnboardingContentView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingContentView()
    }
}
