//
//  main.swift
//  Geometry
//
//  Created by Daesub Kim on 2016. 9. 27..
//  Copyright © 2016년 Daesub Kim. All rights reserved.
//

import Foundation
import Cocoa

// main.swift  <- 프로그램 진입점
/*
for geo in GeometryType.enumerate() {
    
    print(geo.description)
    
}

var geo = GeometryType("1")
print(geo.description)

geo = GeometryType("원뿔")
print(geo.description)

geo = GeometryType("Cylinder")
print(geo.description)

geo = GeometryType.RectangularPrism
print(geo.description)

geo = .SquarePyramid
print(geo.description)

if let g = GeometryType.getGeometryTypeBy(6) {
    print(g.description)
}*/


let calc = GeometryCalculator()
calc.printAllGeometry()
calc.calculatorUserInputGeometryAndPrint()