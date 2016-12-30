
//  Response+HandyJSON.swift
//  MyRx
//
//  Created by Hony on 2016/12/29.
//  Copyright © 2016年 Hony. All rights reserved.
//

import Foundation
import Moya
import HandyJSON

public extension Response {
    
    /// 整个 Data Model
    public func mapObject<T: HandyJSON>(_ type: T.Type) -> T? {
        
        guard let dataString = String.init(data: self.data, encoding: .utf8),
              let object = JSONDeserializer<T>.deserializeFrom(json: dataString)
            else {
            return nil
        }
        
        return object
    }

    
    /// 制定的某个 Key 对应的模型
    public func mapObject<T: HandyJSON>(_ type: T.Type ,designatedPath: String) -> T?{
        
        guard let dataString = String(data: self.data, encoding: .utf8),
              let object = JSONDeserializer<T>.deserializeFrom(json: dataString, designatedPath: designatedPath)
            else {
            return nil
        }
        
        return object
    }
    
    /// Data 对应的 [Model]
    public func mapArray<T: HandyJSON>(_ type: T.Type)  -> [T?]? {
        
        guard let dataString = String(data: self.data, encoding: .utf8),
            let object = JSONDeserializer<T>.deserializeModelArrayFrom(json: dataString)
            else {
                return nil
        }
        return object
    }

    
    /// Data 某个Key 下对应的 的 [Model]
    public func mapArray<T: HandyJSON>(_ type: T.Type ,designatedPath: String )  -> [T?]? {
        guard let dataString = String(data: self.data, encoding: .utf8),
            let object = JSONDeserializer<T>.deserializeModelArrayFrom(json: dataString , designatedPath: designatedPath)
            else {
                return nil
        }
        return object
    }

}





