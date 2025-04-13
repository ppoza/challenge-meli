//
//  Strings.swift
//  challengeMeli
//
//  Created by Pablo Poza on 22/03/2025.
//

import SwiftUICore

extension LocalizedStringKey {
    static let buyNow = LocalizedStringKey("buy_now")
    static let search = LocalizedStringKey("search")
    
    static let searcher = LocalizedStringKey("searcher")
    static let searchHint = LocalizedStringKey("search_hint")
    static let ok = LocalizedStringKey("ok")
    static let error = LocalizedStringKey("error")
    static let routeNotFound = LocalizedStringKey("route_not_found")
    static let helpSearchText = LocalizedStringKey("help_search_text")
    static let retry = LocalizedStringKey("retry")
    static let sellThisProduct = LocalizedStringKey("sell_this_product")
    
    
    static let description = LocalizedStringKey("description")
    static let productWithoutDescription = LocalizedStringKey("product_without_description")
    
    static let unavaliableProductToSell = LocalizedStringKey("unavaliable_product_to_sell")
    static let pickAProduct = LocalizedStringKey("pick_a_product")
    static let titleBuyBoxWinner = LocalizedStringKey("title_buy_box_winner")
    
    
    static let productsNotFound = LocalizedStringKey("products_not_found")
}

extension String {
    static let errorNoConnection = NSLocalizedString("error_no_connection", comment: "")
    static let errorTimeout = NSLocalizedString("error_timeout", comment: "")
    static let errorParsing = NSLocalizedString("error_parsing", comment: "")
    static let errorServer = NSLocalizedString("error_server", comment: "")
    
    static let errorUnknown = NSLocalizedString("error_unknown", comment: "")
    static let errorUnknownWithMessage = NSLocalizedString("error_unknown_with_message", comment: "")
    static let priceNotFound = ""
}


extension String {
    public static let tagSearchButton = "search_button_tag"
    public static let tagSearchInput = "search_input_tag"
    public static let tagSearchResulScreen = "search_resul_screen_tag"
}
