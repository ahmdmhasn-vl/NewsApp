//
//  SplashContentView.swift
//  NewsApp
//
//  Created by Amr Ahmed on 11/08/2021.
//

import SwiftUI

struct SplashContentView: View {
    @State var showOnBoarding = false
    @State var navigationBarHidden : Bool = true
    
    var body: some View {
        NavigationView {
           let country = DefaultsUtils.loadCountry()
          
            ZStack {
                Image("img_background").resizable().ignoresSafeArea()
                Image("ic_logo")
            }
            .background(NavigationLink("",destination: {
                VStack {
                    if country.id != 0 {
                        HomeContentView()
                    }else{
                        OnboardingContentView()
                    }
                }
                .navigationTitle("")
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
            }(), isActive: $showOnBoarding))
            
        }.onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    showOnBoarding = true
            }
        }
    }
}

struct SplashContentView_Previews: PreviewProvider {
    static var previews: some View {
        SplashContentView()
    }
}
