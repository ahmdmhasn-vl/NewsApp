//
//  HomeContentView.swift
//  NewsApp
//
//  Created by Amr Ahmed on 12/08/2021.
//

import SwiftUI

struct HomeContentView: View {

    @Environment(\.managedObjectContext) private var viewContext

    
    var body: some View {
        GeometryReader{ (geometry : GeometryProxy) in  // New Code
            
            TabView{
                NewsContentView()
                    .tabItem {
                        TabBarIcon(width: 40, height: 40,systemIconName : "ic_home",tabName: "News")
                    }
                FavoriteContentView(viewContext: viewContext)
                    .tabItem {
                        TabBarIcon(width: 40, height: 40,systemIconName : "ic_fav",tabName: "Favorite")
                    }
            }
            
        }
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}

struct TabBarIcon: View {
    
    let width, height: CGFloat
    let systemIconName, tabName: String
    
    
    var body: some View {
        VStack {
            Image(systemIconName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width, height: height)
                .padding(.top, 10)
            Text(tabName)
                .font(.footnote)
            Spacer()
        }
    }
}

struct HomeContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeContentView()
    }
}
