//
//  Home.swift
//  UI-310 (iOS)
//
//  Created by nyannyan0328 on 2021/09/18.
//

import SwiftUI

struct Home: View {
    @State var currentIndex : Int = 0
    var body: some View {
        ZStack{
            
            
            TabView(selection:$currentIndex){
                
                
                
                ForEach(posts.indices,id:\.self){index in
                    
                    
                    Image(posts[index].postImage)
                        .resizable()
                    
                    
                    
                    
                    
                }
                .ignoresSafeArea()
                .offset(y: -100)
                
                
                
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .animation(.easeInOut, value: currentIndex)
            .overlay(
                
                
                LinearGradient(colors: [
                    
                    
                    Color.white,
                    Color.white.opacity(0.4),
                    Color.white.opacity(0.2),
                    Color.white,
                    Color.white,
                    Color.white,
                    
                    
                    
                ], startPoint: .top, endPoint: .bottom)
                
                
            )
            
            .ignoresSafeArea()
            
            
            SnapCarousel(spacing:getRect().height < 750 ? 10 : 20,trailingSpace:getRect().height < 750 ? 100 : 150, index: $currentIndex, items: posts) {post in
                
                cardView(post: post)
                
            }
            .offset(y: getRect().height / 3.5)
            
            
        }
    }
    @ViewBuilder
    func cardView(post : Post)->some View{
        
        VStack(spacing:10){
            
            
            GeometryReader{proxy in
                
                let size = proxy.size
                
                Image(post.postImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: size.width, height: size.height)
                    .cornerRadius(15)
                
                
                
            }
            .padding(15)
            .background(Color.white,in: RoundedRectangle(cornerRadius: 15))
            
            .frame(height: getRect().height / 3.5)
            
            Text(post.title)
                .font(.title.bold())
                .foregroundColor(.green)
            
            
            HStack{
                
                ForEach(1...5,id:\.self){index in
                    
                    Image(systemName: "star.fill")
                        .foregroundColor(index <= post.starRating ? .yellow : .gray)
                    
                    
                }
                
                Text("(\(post.starRating).0)")
                    .font(.footnote)
                    .foregroundColor(.yellow)
                
                
                
            }
            
            Text(post.discription)
                .font(getRect().height < 750 ? .callout : .title2.weight(.black))
            
                .multilineTextAlignment(.center)
                .lineLimit(1)
                .padding(.top,9)
                .padding(.horizontal)
            
            
            
            
            
        }
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

extension View{
    
    func getRect()->CGRect{
        
        return UIScreen.main.bounds
    }
}
