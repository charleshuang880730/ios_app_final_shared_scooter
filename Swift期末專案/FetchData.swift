//
//  fetchData.swift
//  Swift期末專案
//
//  Created by 阿黃 on 2021/6/21.
//

import Foundation


func fetchData(completionHandler: @escaping ([motorBike]) -> Void ){
    
    var motorBikeData = [motorBike]()
    let urlForFetchingData = "http://127.0.0.1/getCarList"
    
    //completionHandler(motorBikeData)

    if let urlToServer = URL.init(string: urlForFetchingData)
    {
        let task = URLSession.shared.dataTask(with: urlToServer, completionHandler: {(data, response, error) in
        if error != nil || data == nil{
            print("An error occured while fetching data from API")
        }
        else{
            if let responseText = String.init(data: data!,encoding: .ascii){
                let jsonData = responseText.data(using: .utf8)!
                motorBikeData = try! JSONDecoder().decode([motorBike].self, from: jsonData)
                completionHandler(motorBikeData)
            }
        }
    
    })
    task.resume()
    }
    
}

