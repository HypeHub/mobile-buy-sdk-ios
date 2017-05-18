//
//  Shop.swift
//  Buy
//
//  Created by Shopify.
//  Copyright (c) 2017 Shopify Inc. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import Foundation

extension Storefront {
	/// Shop represents a collection of the general settings and information about 
	/// the shop. 
	open class ShopQuery: GraphQL.AbstractQuery, GraphQLQuery {
		public typealias Response = Shop

		/// The url pointing to the endpoint to vault credit cards. 
		@discardableResult
		open func cardVaultUrl(alias: String? = nil) -> ShopQuery {
			addField(field: "cardVaultUrl", aliasSuffix: alias)
			return self
		}

		/// List of the shop’ collections. 
		///
		/// - parameters:
		///     - first: No description
		///     - after: No description
		///     - sortKey: No description
		///     - reverse: No description
		///     - query: Supported filter parameters:
		///         - `title`
		///         - `collection_type`
		///         - `updated_at`
		///         - `published_status`
		///
		@discardableResult
		open func collections(alias: String? = nil, first: Int32, after: String? = nil, sortKey: CollectionSortKeys? = nil, reverse: Bool? = nil, query: String? = nil, _ subfields: (CollectionConnectionQuery) -> Void) -> ShopQuery {
			var args: [String] = []

			args.append("first:\(first)")

			if let after = after {
				args.append("after:\(GraphQL.quoteString(input: after))")
			}

			if let sortKey = sortKey {
				args.append("sortKey:\(sortKey.rawValue)")
			}

			if let reverse = reverse {
				args.append("reverse:\(reverse)")
			}

			if let query = query {
				args.append("query:\(GraphQL.quoteString(input: query))")
			}

			let argsString: String? = args.isEmpty ? nil : "(\(args.joined(separator: ",")))"

			let subquery = CollectionConnectionQuery()
			subfields(subquery)

			addField(field: "collections", aliasSuffix: alias, args: argsString, subfields: subquery)
			return self
		}

		/// The three-letter code for the currency that the shop accepts. 
		@discardableResult
		open func currencyCode(alias: String? = nil) -> ShopQuery {
			addField(field: "currencyCode", aliasSuffix: alias)
			return self
		}

		/// A description of the shop. 
		@discardableResult
		open func description(alias: String? = nil) -> ShopQuery {
			addField(field: "description", aliasSuffix: alias)
			return self
		}

		/// A string representing the way currency is formatted when the currency isn’t 
		/// specified. 
		@discardableResult
		open func moneyFormat(alias: String? = nil) -> ShopQuery {
			addField(field: "moneyFormat", aliasSuffix: alias)
			return self
		}

		/// The shop’s name. 
		@discardableResult
		open func name(alias: String? = nil) -> ShopQuery {
			addField(field: "name", aliasSuffix: alias)
			return self
		}

		/// The shop’s primary domain. 
		@discardableResult
		open func primaryDomain(alias: String? = nil, _ subfields: (DomainQuery) -> Void) -> ShopQuery {
			let subquery = DomainQuery()
			subfields(subquery)

			addField(field: "primaryDomain", aliasSuffix: alias, subfields: subquery)
			return self
		}

		/// The shop’s privacy policy. 
		@discardableResult
		open func privacyPolicy(alias: String? = nil, _ subfields: (ShopPolicyQuery) -> Void) -> ShopQuery {
			let subquery = ShopPolicyQuery()
			subfields(subquery)

			addField(field: "privacyPolicy", aliasSuffix: alias, subfields: subquery)
			return self
		}

		/// List of the shop’ products. 
		///
		/// - parameters:
		///     - first: No description
		///     - after: No description
		///     - sortKey: No description
		///     - reverse: No description
		///     - query: Supported filter parameters:
		///         - `title`
		///         - `product_type`
		///         - `vendor`
		///         - `created_at`
		///         - `updated_at`
		///         - `tag`
		///
		@discardableResult
		open func products(alias: String? = nil, first: Int32, after: String? = nil, sortKey: ProductSortKeys? = nil, reverse: Bool? = nil, query: String? = nil, _ subfields: (ProductConnectionQuery) -> Void) -> ShopQuery {
			var args: [String] = []

			args.append("first:\(first)")

			if let after = after {
				args.append("after:\(GraphQL.quoteString(input: after))")
			}

			if let sortKey = sortKey {
				args.append("sortKey:\(sortKey.rawValue)")
			}

			if let reverse = reverse {
				args.append("reverse:\(reverse)")
			}

			if let query = query {
				args.append("query:\(GraphQL.quoteString(input: query))")
			}

			let argsString: String? = args.isEmpty ? nil : "(\(args.joined(separator: ",")))"

			let subquery = ProductConnectionQuery()
			subfields(subquery)

			addField(field: "products", aliasSuffix: alias, args: argsString, subfields: subquery)
			return self
		}

		/// The shop’s refund policy. 
		@discardableResult
		open func refundPolicy(alias: String? = nil, _ subfields: (ShopPolicyQuery) -> Void) -> ShopQuery {
			let subquery = ShopPolicyQuery()
			subfields(subquery)

			addField(field: "refundPolicy", aliasSuffix: alias, subfields: subquery)
			return self
		}

		/// The shop's Shopify Payments account id. 
		@discardableResult
		open func shopifyPaymentsAccountId(alias: String? = nil) -> ShopQuery {
			addField(field: "shopifyPaymentsAccountId", aliasSuffix: alias)
			return self
		}

		/// The shop’s terms of service. 
		@discardableResult
		open func termsOfService(alias: String? = nil, _ subfields: (ShopPolicyQuery) -> Void) -> ShopQuery {
			let subquery = ShopPolicyQuery()
			subfields(subquery)

			addField(field: "termsOfService", aliasSuffix: alias, subfields: subquery)
			return self
		}
	}

	/// Shop represents a collection of the general settings and information about 
	/// the shop. 
	open class Shop: GraphQL.AbstractResponse, GraphQLObject {
		public typealias Query = ShopQuery

		internal override func deserializeValue(fieldName: String, value: Any) throws -> Any? {
			let fieldValue = value
			switch fieldName {
				case "cardVaultUrl":
				guard let value = value as? String else {
					throw SchemaViolationError(type: type(of: self), field: fieldName, value: fieldValue)
				}
				return URL(string: value)!

				case "collections":
				guard let value = value as? [String: Any] else {
					throw SchemaViolationError(type: type(of: self), field: fieldName, value: fieldValue)
				}
				return try CollectionConnection(fields: value)

				case "currencyCode":
				guard let value = value as? String else {
					throw SchemaViolationError(type: type(of: self), field: fieldName, value: fieldValue)
				}
				return CurrencyCode(rawValue: value) ?? .unknownValue

				case "description":
				if value is NSNull { return nil }
				guard let value = value as? String else {
					throw SchemaViolationError(type: type(of: self), field: fieldName, value: fieldValue)
				}
				return value

				case "moneyFormat":
				guard let value = value as? String else {
					throw SchemaViolationError(type: type(of: self), field: fieldName, value: fieldValue)
				}
				return value

				case "name":
				guard let value = value as? String else {
					throw SchemaViolationError(type: type(of: self), field: fieldName, value: fieldValue)
				}
				return value

				case "primaryDomain":
				guard let value = value as? [String: Any] else {
					throw SchemaViolationError(type: type(of: self), field: fieldName, value: fieldValue)
				}
				return try Domain(fields: value)

				case "privacyPolicy":
				if value is NSNull { return nil }
				guard let value = value as? [String: Any] else {
					throw SchemaViolationError(type: type(of: self), field: fieldName, value: fieldValue)
				}
				return try ShopPolicy(fields: value)

				case "products":
				guard let value = value as? [String: Any] else {
					throw SchemaViolationError(type: type(of: self), field: fieldName, value: fieldValue)
				}
				return try ProductConnection(fields: value)

				case "refundPolicy":
				if value is NSNull { return nil }
				guard let value = value as? [String: Any] else {
					throw SchemaViolationError(type: type(of: self), field: fieldName, value: fieldValue)
				}
				return try ShopPolicy(fields: value)

				case "shopifyPaymentsAccountId":
				if value is NSNull { return nil }
				guard let value = value as? String else {
					throw SchemaViolationError(type: type(of: self), field: fieldName, value: fieldValue)
				}
				return value

				case "termsOfService":
				if value is NSNull { return nil }
				guard let value = value as? [String: Any] else {
					throw SchemaViolationError(type: type(of: self), field: fieldName, value: fieldValue)
				}
				return try ShopPolicy(fields: value)

				default:
				throw SchemaViolationError(type: type(of: self), field: fieldName, value: fieldValue)
			}
		}

		/// The url pointing to the endpoint to vault credit cards. 
		open var cardVaultUrl: URL {
			return internalGetCardVaultUrl()
		}

		func internalGetCardVaultUrl(alias: String? = nil) -> URL {
			return field(field: "cardVaultUrl", aliasSuffix: alias) as! URL
		}

		/// List of the shop’ collections. 
		open var collections: Storefront.CollectionConnection {
			return internalGetCollections()
		}

		open func aliasedCollections(alias: String) -> Storefront.CollectionConnection {
			return internalGetCollections(alias: alias)
		}

		func internalGetCollections(alias: String? = nil) -> Storefront.CollectionConnection {
			return field(field: "collections", aliasSuffix: alias) as! Storefront.CollectionConnection
		}

		/// The three-letter code for the currency that the shop accepts. 
		open var currencyCode: Storefront.CurrencyCode {
			return internalGetCurrencyCode()
		}

		func internalGetCurrencyCode(alias: String? = nil) -> Storefront.CurrencyCode {
			return field(field: "currencyCode", aliasSuffix: alias) as! Storefront.CurrencyCode
		}

		/// A description of the shop. 
		open var description: String? {
			return internalGetDescription()
		}

		func internalGetDescription(alias: String? = nil) -> String? {
			return field(field: "description", aliasSuffix: alias) as! String?
		}

		/// A string representing the way currency is formatted when the currency isn’t 
		/// specified. 
		open var moneyFormat: String {
			return internalGetMoneyFormat()
		}

		func internalGetMoneyFormat(alias: String? = nil) -> String {
			return field(field: "moneyFormat", aliasSuffix: alias) as! String
		}

		/// The shop’s name. 
		open var name: String {
			return internalGetName()
		}

		func internalGetName(alias: String? = nil) -> String {
			return field(field: "name", aliasSuffix: alias) as! String
		}

		/// The shop’s primary domain. 
		open var primaryDomain: Storefront.Domain {
			return internalGetPrimaryDomain()
		}

		func internalGetPrimaryDomain(alias: String? = nil) -> Storefront.Domain {
			return field(field: "primaryDomain", aliasSuffix: alias) as! Storefront.Domain
		}

		/// The shop’s privacy policy. 
		open var privacyPolicy: Storefront.ShopPolicy? {
			return internalGetPrivacyPolicy()
		}

		func internalGetPrivacyPolicy(alias: String? = nil) -> Storefront.ShopPolicy? {
			return field(field: "privacyPolicy", aliasSuffix: alias) as! Storefront.ShopPolicy?
		}

		/// List of the shop’ products. 
		open var products: Storefront.ProductConnection {
			return internalGetProducts()
		}

		open func aliasedProducts(alias: String) -> Storefront.ProductConnection {
			return internalGetProducts(alias: alias)
		}

		func internalGetProducts(alias: String? = nil) -> Storefront.ProductConnection {
			return field(field: "products", aliasSuffix: alias) as! Storefront.ProductConnection
		}

		/// The shop’s refund policy. 
		open var refundPolicy: Storefront.ShopPolicy? {
			return internalGetRefundPolicy()
		}

		func internalGetRefundPolicy(alias: String? = nil) -> Storefront.ShopPolicy? {
			return field(field: "refundPolicy", aliasSuffix: alias) as! Storefront.ShopPolicy?
		}

		/// The shop's Shopify Payments account id. 
		open var shopifyPaymentsAccountId: String? {
			return internalGetShopifyPaymentsAccountId()
		}

		func internalGetShopifyPaymentsAccountId(alias: String? = nil) -> String? {
			return field(field: "shopifyPaymentsAccountId", aliasSuffix: alias) as! String?
		}

		/// The shop’s terms of service. 
		open var termsOfService: Storefront.ShopPolicy? {
			return internalGetTermsOfService()
		}

		func internalGetTermsOfService(alias: String? = nil) -> Storefront.ShopPolicy? {
			return field(field: "termsOfService", aliasSuffix: alias) as! Storefront.ShopPolicy?
		}

		internal override func childResponseObjectMap() -> [GraphQL.AbstractResponse]  {
			var response: [GraphQL.AbstractResponse] = []
			objectMap.keys.forEach {
				switch($0) {
					case "collections":
					response.append(internalGetCollections())
					response.append(contentsOf: internalGetCollections().childResponseObjectMap())

					case "primaryDomain":
					response.append(internalGetPrimaryDomain())
					response.append(contentsOf: internalGetPrimaryDomain().childResponseObjectMap())

					case "privacyPolicy":
					if let value = internalGetPrivacyPolicy() {
						response.append(value)
						response.append(contentsOf: value.childResponseObjectMap())
					}

					case "products":
					response.append(internalGetProducts())
					response.append(contentsOf: internalGetProducts().childResponseObjectMap())

					case "refundPolicy":
					if let value = internalGetRefundPolicy() {
						response.append(value)
						response.append(contentsOf: value.childResponseObjectMap())
					}

					case "termsOfService":
					if let value = internalGetTermsOfService() {
						response.append(value)
						response.append(contentsOf: value.childResponseObjectMap())
					}

					default:
					break
				}
			}
			return response
		}
	}
}
