//
//  GeometryCalulator.swift
//  Geometry
//
//  Created by Daesub Kim on 2016. 9. 27..
//  Copyright © 2016년 Daesub Kim. All rights reserved.
//

import Foundation

class GeometryCalculator {

    var radius : Double // Member Var
    var height : Double
    var slant : Double
    var width : Double
    var length : Double
    var base : Double
    var geo : GeometryType

    init() {
        radius = 1
        height = 1
        slant = 1
        width = 1
        length = 1
        base = 1
        geo = GeometryType.Sphere
    }

    var SurfaceArea : Double {
        get {
            return calculatorSurfaceArea(geo)
        }
        
    }

    func calculatorSurfaceArea(type: GeometryType) -> Double {
        switch type {
        case GeometryType.Sphere :
            return 4 * M_PI * radius * radius
        case GeometryType.Cone :
            slant = sqrt(radius * radius + height * height)
            return M_PI * radius * (radius + slant)
        case GeometryType.Cylinder :
            return 2 * M_PI * radius * (radius + height)
        case GeometryType.RectangularPrism :
            return 2 * (width * height  + length * width + length * height)
        case GeometryType.SquarePyramid :
            slant = sqrt(base * base / 4 + height * height)
            return 2 * base * slant + base * base
        case GeometryType.IsoscelesTriangularPrism :
            slant = sqrt(base * base / 4 + height * height)
            return base * height + 2 * length * slant + length * base
        }
    }

    func calculatorVolume(type: GeometryType) -> Double {
        switch type {
        case GeometryType.Sphere :
            return 4 * M_PI * radius * radius * radius / 3
        case GeometryType.Cone :
            return M_PI * radius * radius * height / 3
        case GeometryType.Cylinder :
            return M_PI * radius * radius * height
        case GeometryType.RectangularPrism :
            return width * height * length
        case GeometryType.SquarePyramid :
            return base * base * height / 3
        case GeometryType.IsoscelesTriangularPrism :
            return base * height * length / 2
        }
    }

    func printGeometry(type : GeometryType) {
        print("Geometry \(type.description) S.A. = \(calculatorSurfaceArea(type)) Volume = \(calculatorVolume(type))")
    }

    func printAllGeometry() {
        for g in GeometryType.enumerate() {
            printGeometry(g)
        }
    }

    func getUserInputGeometry() -> GeometryType {
        
        var i = 0
        repeat {
            print("Please select geometry [1~6] : ")
            
            if let inputString = readLine() { // optional chain ! 를 받아준다. optional 을 끄집어 내어 줘야한다. * optional : nullable type / null 이거나 실제 값이거나. dictionaly 를 찾아, 있으면 그 키 값을 넘겨줘야 하는데, 없으면 Optional(null) 로 보내준다.
                if let inputNumber = Int(inputString) { // parseInt(String) 하는 부분
                    i = inputNumber
                    if let g = GeometryType(rawValue: inputNumber) { // rawValue 는 enum 의 parameter로 들어갈 수 있다.
                        return g
                    }
                }
            }
        } while i < 1 || i > 6
        return GeometryType.Sphere
    }
    
    func getUserInputDouble() -> Double {
        
        while true{
            if let inputDouble = readLine() {
                
                if let inputNum = Double(inputDouble) { // inputDouble var이 Double Type 일 경우,
                    return inputNum
                } else { // inputDouble var이 Double Type이 아닐 경우,
                    print("Double Type으로 다시 입력하세요 : ")
                }
            }
        }
    }
    
    // Sphere radius 입력, Cone radius & height 입력
    func getAdditionalUserInput(type : GeometryType) {
        
        switch type {
            
        case GeometryType.Sphere :
            print("Please enter Sphere radius : ")
            radius = getUserInputDouble()
            
        case GeometryType.Cone :
            print("Please enter Cone radius : ")
            radius = getUserInputDouble()
            print("Please enter Cone height : ")
            height = getUserInputDouble()
            
        case GeometryType.Cylinder :
            print("Please enter Cylinder radius : ")
            radius = getUserInputDouble()
            print("Please enter Cylinder height : ")
            height = getUserInputDouble()
        
        case GeometryType.RectangularPrism :
            print("Please enter RectangularPrism width : ")
            width = getUserInputDouble()
            print("Please enter RectangularPrism height : ")
            height = getUserInputDouble()
            print("Please enter RectangularPrism length : ")
            length = getUserInputDouble()
            
        case GeometryType.SquarePyramid :
            print("Please enter SquarePyramid base : ")
            base = getUserInputDouble()
            print("Please enter SquarePyramid height : ")
            height = getUserInputDouble()
            
        case GeometryType.IsoscelesTriangularPrism :
            print("Please enter IsoscelesTriangularPrism base : ")
            base = getUserInputDouble()
            print("Please enter IsoscelesTriangularPrism height : ")
            height = getUserInputDouble()
            print("Please enter IsoscelesTriangularPrism length : ")
            length = getUserInputDouble()
            
        }
        
    }
    
    func inputQuit() -> Bool {
        print("Please enter \"Q\" for Quit.")
        if let inputString = readLine() {
            return inputString == "q"
        }
        return false;
    }


    func calculatorUserInputGeometryAndPrint() {
        
        repeat {
        
            let g = getUserInputGeometry()
            getAdditionalUserInput(g)
            printGeometry(g)
        
        } while (!(inputQuit()))
        
    }

}