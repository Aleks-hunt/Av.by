//
//  CarsParameters.swift
//  Av.by
//
//  Created by Алексей Капустин on 19.12.2023.
//

import Foundation
import UIKit

struct Parameters {
    let name: String
    var price: Int
    var dollars: Int {
        return Int(price / 90)
    }
    var imageCar: [UIImage]
    var info: String
    var top: UIImage
    var vin: UIImage
    let city: String
    var date: String
    var leasingPrice: Int {
        return Int(Double(price / 60) * 1.3)
    }
}
