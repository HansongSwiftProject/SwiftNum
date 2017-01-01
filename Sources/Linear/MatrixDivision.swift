//
//  MatrixDivision.swift
//  SwiftNum
//
//  Created by Donald Pinckney on 1/1/17.
//
//

import Accelerate

public extension Matrix {
    static func /(lhs: Matrix, rhs: Matrix) -> Matrix {
        return lhs * rhs.inverse()!
    }
    static func /=(lhs: inout Matrix, rhs: Matrix) {
        lhs = lhs * rhs.inverse()!
    }
    
    
    static func /(lhs: Matrix, rhs: Double) -> Matrix {
        var res = lhs
        var rhs = 1 / rhs
        vDSP_vsmulD(res.data, 1, &rhs, &res.data, 1, vDSP_Length(lhs.data.count))
        return res
    }
    static func /(lhs: Double, rhs: Matrix) -> Matrix {
        return lhs * rhs.inverse()!
    }
    static func /=(lhs: inout Matrix, rhs: Double) {
        var rhs = 1 / rhs
        vDSP_vsmulD(lhs.data, 1, &rhs, &lhs.data, 1, vDSP_Length(lhs.data.count))
    }
}
