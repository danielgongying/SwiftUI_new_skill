	//
//  ContentView.swift
//  SwiftUI_Demo2
//
//  Created by daniel on 12/06/2019.
//  Copyright © 2019 daniel. All rights reserved.
//

import SwiftUI
import Combine
    struct Course:Decodable {
        let name ,imageUrl:String
        
    }
    class NetworkManager: BindableObject {
        var didChange = PassthroughSubject<NetworkManager,Never>()
        
        var courses = [Course](){
            didSet{
                didChange.send(self)
            }
        }
        init() {
            guard let url = URL(string: "https://api.letsbuildthatapp.com/jsondecodable/courses") else {return}
            URLSession.shared.dataTask(with: url) { (data, _, _) in
                guard let data = data else{return}
                let  courses = try! JSONDecoder().decode([Course].self, from: data)
                DispatchQueue.main.async {
                    self.courses = courses
                }
                print("complete fetching json")
                
            }.resume()
      
        }
        
    }
struct ContentView : View {
    @State var networkManager = NetworkManager()
    var body: some View {
        NavigationView {
            List(
                networkManager.courses.identified(by: \.name)
            ){course in
                CourseRowView(course: course)
            }.navigationBarTitle(Text("Courses"))
        }
    }
}
struct CourseRowView:View {
    let course :Course
    var body: some View {
        VStack (alignment: .leading, spacing: 10){
//            Image("2").resizable().frame(width: 320, height: 200, alignment: .center).clipped()
            ImageViewWidget(imageUrl: course.imageUrl)
            Text(course.name)
            Text(course.imageUrl)
        }
     
    }
    
}
class ImageLoder: BindableObject {
    var didChange = PassthroughSubject<Data,Never>()
    var data = Data(){
        didSet{
            didChange.send(data)
        }
    }
    init(imageUrl:String) {
        //fetch image data and then call didChange
        guard let url = URL(string: imageUrl) else {return}
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data=data else {return}
            DispatchQueue.main.async {
                self.data = data
            }
        }.resume()
      
    }

    
    
}
struct ImageViewWidget:View {
    @ObjectBinding var imageLoader:ImageLoder
    init(imageUrl:String) {
        imageLoader = ImageLoder(imageUrl: imageUrl)
    }
    var body: some View {
    Image(uiImage:(imageLoader.data.count==0) ? UIImage(named: "2")!: UIImage(data: imageLoader.data)!).resizable().frame(width: 360, height: 200, alignment: .center)
       
    }
}
#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
