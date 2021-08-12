//
//  SplashContentView.swift
//  NewsApp
//
//  Created by Amr Ahmed on 11/08/2021.
//

import SwiftUI

struct SplashContentView: View {
    @State var showOnBoarding = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("img_background").resizable().ignoresSafeArea()
                Image("ic_logo")
            }
            .background(NavigationLink("", destination: OnboardingContentView(), isActive: $showOnBoarding))
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
