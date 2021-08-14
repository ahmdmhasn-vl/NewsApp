//
//  FavoriteContentView.swift
//  NewsApp
//
//  Created by Amr Ahmed on 14/08/2021.
//

import SwiftUI
import CoreData

struct FavoriteContentView: View {
    
    @ObservedObject private var viewModel = NewsViewModel()
    var viewContext : NSManagedObjectContext
    var coreDataUtil = CoreDataUtil()
    
    init(viewContext : NSManagedObjectContext) {
        self.viewContext = viewContext
        self.coreDataUtil.initialize(viewContext: viewContext)
        self.viewModel.coreDataUtils = self.coreDataUtil
    }

    var body: some View {
        ScrollView {
            VStack {
                Text("Favotites").font(.largeTitle)
                    .fontWeight(.semibold)
                    .frame( maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                    .padding(.leading,20)
                
                if viewModel.favoriteList.count > 0 {
                    ForEach(0 ..< viewModel.favoriteList.count, id: \.self) { index in
                        NewsCell(article: viewModel.favoriteList[index],viewModel: viewModel,viewContext: viewContext)
                    }
                }
            }
        }.onAppear(perform: {
            viewModel.loadFavoriteList()
        })
        .navigationBarTitle("",displayMode :.inline)
        .navigationBarHidden(true)
    }
    
}

//struct FavoriteContentView_Previews: PreviewProvider {
//    static var previews: some View {
////        FavoriteContentView()
//    }
//}
