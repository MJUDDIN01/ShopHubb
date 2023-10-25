//
//  ServiceErrorAlert.swift
//  ShopHubb
//
//  Created by Jasim Uddin on 25/10/2023.
//

import Foundation

enum ServiceErrorAlert {
    static let unableToParseData = AlertData(title: "Fail to refresh",
                                             message: "Unable parse data from server",
                                             dismissButton: "OK")
    static let urlSessionError = AlertData(title: "Fail to refresh",
                                           message: "Unable parse data from server",
                                           dismissButton: "OK")
    static let httpFailureResponseCode = AlertData(title: "Fail to refresh",
                                                   message: "Unable parse data from server",
                                                   dismissButton: "OK")
    static let noDataReceived = AlertData(title: "Fail to refresh",
                                          message: "Unable parse data from server",
                                          dismissButton: "OK")
}
