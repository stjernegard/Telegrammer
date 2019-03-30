//
//  Filter.swift
//  Telegrammer
//
//  Created by Givi Pataridze on 21.04.2018.
//

import Foundation


///Base protocol for atomic filter
public protocol Filter {
    var name: String { get }
    func filter(message: Message) -> Bool
}

/**
 Class cluster for all filters.

 Filters may be combined using bitwise operators:

 - And:
 ````
 (Filters.text && Filters.entity([.mention]))
 ````
 - Or:
 ````
 (Filters.audio || Filters.video)
 ````
 - Not:
 ````
 !Filters.command
 ````
 Also works with more than two filters:
 ````
 (Filters.text && (Filters.entity([.url, .mention]) || Filters.entity([.command])))
 (Filters.text && !Filters.forwarded)
 ````
 If you want to create your own filters create a struct conforming `Filter` protocol and implement a `filter` method that returns a boolean: `true`, if the message should be handled, `false` otherwise.
 */
public class Filters {

    private enum Operation {
        case and
        case or
        case not
    }

    private var atomicFilter: Filter?
    private var simpleFilters: Filters?
    private var compoundFilter: (lhs: Filters, rhs: Filters, op: Operation)?

    public init(filter: Filter) {
        self.atomicFilter = filter
    }

    public init(filters: Filters) {
        self.simpleFilters = filters
    }

    private init(lhs: Filters, rhs: Filters, op: Operation) {
        self.compoundFilter = (lhs, rhs, op)
    }

    public func check(_ message: Message) -> Bool {
        if let filter = atomicFilter {
            return filter.filter(message: message)
        }
        if let filter = simpleFilters {
            return filter.check(message)
        }
        if let filter = compoundFilter {
            switch filter.op {
            case .and:
                return (filter.lhs && filter.rhs).check(message)
            case .or:
                return (filter.lhs || filter.rhs).check(message)
            case .not:
                return (!filter.lhs).check(message)
            }
        }
        return true
    }
}

public extension Filters {
    static func &&(lhs: Filters, rhs: Filters) -> Filters {
        return Filters(lhs: lhs, rhs: rhs, op: .and)
    }

    static func ||(lhs: Filters, rhs: Filters) -> Filters {
        return Filters(lhs: lhs, rhs: rhs, op: .or)
    }

    static prefix func !(filter: Filters) -> Filters {
        return Filters(lhs: filter, rhs: filter, op: .not)
    }
}
