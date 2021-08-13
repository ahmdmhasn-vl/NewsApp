//
//  NewsContentView.swift
//  NewsApp
//
//  Created by Amr Ahmed on 12/08/2021.
//

import SwiftUI

struct NewsContentView: View {
    
    @ObservedObject private var viewModel = NewsViewModel()
    
    var body: some View {
        
        ScrollView {
            VStack {
                Text("Articles").font(.largeTitle)
                    .fontWeight(.semibold)
                    .frame( maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                    .padding(.leading,20)
                Text(DefaultsUtils.loadCountry().name).foregroundColor(Colors.blueColor)
                HStack {
                    let categories = DefaultsUtils.loadNewsCategories()
                    ForEach(0 ..< categories.count) { index in
                        CategorySelectionView(title: categories[index].title, isSelected: true, action: {})
                    }
                }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .topLeading)
                .padding(.horizontal, 20).padding(.vertical,10)
                
                VStack {
                    Button(action: {}, label: {
                        HStack {
                            Text("Search for something").fontWeight(.medium)
                                .padding(.horizontal, 20)
                                .padding(.vertical, 20)
                                .font(.system(size: 14))
                                .foregroundColor(.black)
                            Spacer()
                            Image("ic_search")
                                .padding()
                        }
                    })
                }
                .background(Colors.greyColor).cornerRadius(10).padding(.horizontal,20).padding(.bottom,10)
                if viewModel.articles.count > 0 {
                    ForEach(0 ..< viewModel.articles.count) { index in
                        NewsCell(article: viewModel.articles[index])
                    }
                }
                
            }
        }.onAppear(perform: {
            viewModel.loadRecentArticles()
        })
        .navigationBarTitle("",displayMode :.inline)
        .navigationBarHidden(true)
    }
    
}

struct NewsCell  : View {
    var article = Article()
    var body : some View {
        ZStack{
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(Color.white).shadow(radius: 2)
                .onTapGesture {
                    UIApplication.shared.open(URL(string: article.url ?? "")!)
                }
            HStack{
                
                RemoteImage(url: article.urlToImage ?? "https://www-assets.youneedabudget.com/wp-content/uploads/2021/08/06145735/illo_blog_062321_fb.png").cornerRadius(10)
                    .padding(.horizontal,8)
                    .aspectRatio(contentMode: .fit).frame(maxWidth: 120,  alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
                VStack{
                    Text(article.title ?? "")
                        .font(.title3)
                        .padding(.vertical,2)
                        .frame(maxWidth:.infinity,alignment: .topLeading)
                    Text(article.description ?? "")
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .font(.caption2)
                    HStack{
                        Text(article.source?.name ?? "").padding(.vertical, 7).padding(.horizontal)
                            .background(Colors.darkBlueColor)
                            .foregroundColor(.white)
                            .font(.caption)
                            .cornerRadius(10)
                        Text(article.publishedAt?.getDateWithoutTime() ?? "").font(.caption2)
                            .frame(maxWidth: .infinity,alignment: .trailing)
                    }.frame(maxWidth:.infinity,alignment: .leading).padding(.top,2)
                }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,maxHeight: 170, alignment: .leading)
                
                GeometryReader{ (proxy : GeometryProxy) in
                    VStack(alignment: .trailing) {
                        Image("ic_fav_filled").padding(.horizontal, 10).padding(.top, 5)
                    }
                    .frame(width: proxy.size.width, height:proxy.size.height , alignment: .topTrailing)
                }.frame(maxWidth: 40, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .topLeading)
                
            }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,maxHeight: 150, alignment: .leading)
            
        }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,maxHeight: 170, alignment: .leading).padding(.horizontal).padding(.vertical,8)
    }
}

struct NewsContentView_Previews: PreviewProvider {
    static var previews: some View {
        NewsContentView()
    }
}
