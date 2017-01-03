//
//  GeometryType.swift
//  Geometry
//
//  Created by Daesub Kim on 2016. 9. 27..
//  Copyright © 2016년 Daesub Kim. All rights reserved.
//

import Foundation


// enum
// enum 은 Class 라고 보면 된다.

enum GeometryType : Int, CustomStringConvertible {
    
    case Sphere = 1
    case Cone
    case Cylinder
    case RectangularPrism
    case SquarePyramid
    case IsoscelesTriangularPrism
    
    /*
    
    // 정의
    func Function1(_ val: Int, age: Int) -> Int { }
    
    // 호출
    var result = Function1(10, age: 27)  // 앞의 _ val 은 호출시에 파라미터 명을 안써도 되고, 뒤의 age 는 호출시에 age: 27 등으로 파라미터 이름 써야함.
    
    */
    init (_ name : String) { // _ 를 쓰는 이유는 internal 파라미터만 name으로 쓰겠다.  external 은 쓰지 않겠다.
        
        switch name {
            
        case "Sphere", "구", "1": self = .Sphere
            
        case "Cone", "원뿔", "2": self = .Cone
            
        case "Cylinder", "원기둥", "3": self = .Cylinder
            
        case "RectangularPrism", "사각기둥", "4": self = .RectangularPrism
            
        case "SquarePyramid", "정사각뿔", "5": self = .SquarePyramid
            
        case "IsoscelesTriangularPrism", "이등변삼각기둥", "6": self = .IsoscelesTriangularPrism
            
        default: self = .Sphere
            
        }
    }
    
    var description : String {
        
        switch self {
            
        case .Sphere: return "Sphere"
            
        case .Cone: return "Cone"
            
        case .Cylinder: return "Cylinder"
            
        case .RectangularPrism: return "RectangularPrism"
            
        case .SquarePyramid: return "SquarePyramid"
            
        case .IsoscelesTriangularPrism: return "IsoscelesTriangularPrism"
            
            
        }
    }
    
    static func getGeometryTypeBy(index : Int) -> GeometryType? {  // ? 는  Optional.
        
        switch index {
            
        case 1: return .Sphere
            
        case 2: return .Cone
            
        case 3: return .Cylinder
            
        case 4: return .RectangularPrism
            
        case 5: return .SquarePyramid
            
        case 6: return .IsoscelesTriangularPrism
            
        default: return nil
            
        }
    }
    
    // use anyGenerator to get a generator that can enumerate across your values
    
    static func enumerate() -> AnyGenerator<GeometryType> {
        
        var nextIndex = Sphere.rawValue
        
        return anyGenerator { GeometryType(rawValue: nextIndex++) }
    }
    
    
}



