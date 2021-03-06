import XCTest
@testable import ViaSwiftUtils

class ViaSwiftUtilsTests: XCTestCase {
    
    func testPlusOperator() {
        // Given:
        let vector1 = CGVector(dx: 1.0, dy: 1.0)
        let vector2 = CGVector(dx: 1.0, dy: 1.0)
        
        // When:
        let vector3 = vector1 + vector2
        
        // Then:
        XCTAssertEqual(vector3, CGVector(dx: 2.0, dy: 2.0))
    }
    
    func testMinusOperator() {
        // Given:
        let vector1 = CGVector(dx: 2.0, dy: 2.0)
        let vector2 = CGVector(dx: 1.0, dy: 1.0)
        
        // When:
        let vector3 = vector1 - vector2
        
        // Then:
        XCTAssertEqual(vector3, CGVector(dx: 1.0, dy: 1.0))
    }
    
    func testShuffleDoesNotChangeCount() {
        // Given a shuffled
        var mutableNumberList = [1, 2, 3, 4, 5, 6]
        let originalNumbers = mutableNumberList
        
        // When shuffled
        mutableNumberList.shuffleInPlace()
        
        // Then array should have the same amount of elements
        XCTAssertEqual(originalNumbers.count, mutableNumberList.count,
                       "Expected equal count of shuffled Collection to Original")
    }
    
    func testShuffledArraysKeepElements() {
        // Given hundred random arrays
        for _ in 0..<100 {
            let array = (0..<100).map({ _ in  return Int(arc4random() % 200) - 100 })
            var shuffledArray = array
            
            // When shuffled
            shuffledArray.shuffleInPlace()
            
            // Then each element should occurs in equally often in both original and shuffled array
            for element in array.unique() {
                XCTAssertEqual(shuffledArray.filter({ element == $0 }).count, array.filter({ element == $0 }).count,
                               "Expected the same elements in the shuffled array as in the original")
            }
        }
    }
    
    func testTomorrow() {
        // Given the current date
        let now = Date()
        
        // When comparing to tomorrow
        let tomorrow = Date(timeIntervalSinceNow: TimeInterval.day)
        // Then
        XCTAssertEqual(now.days(to: tomorrow), 1, "Expected today to be 1 day from tomorrow")
    }
    
    func testUniqueElements() {
        // Given an already unique arrays of elements, When
        let elements = [1, 2, 3, 4, 5, 6]
        
        // Then
        XCTAssertEqual(elements.unique().count, elements.count, "Expected elements to be equal to unique elements")
        
        // Given a bigger array of elements, When
        let moreElements = [1, 2, 3, 4, 5, 6, 1, 2, 3, 8]
        
        // Then
        XCTAssertEqual(moreElements.unique().count, 7, "Expected elements to be equal to unique elements")
    }
    
    func testANYALLNONE() {
        // Given, When
        let elements = [1, 2, 3, 4, 5, 6]
        
        // Then
        XCTAssertTrue(elements.any { $0 > 3 }, "Expected 'any number larger 3' to be true")
        XCTAssertTrue(elements.all { $0 > 0 }, "Expected 'all to be bigger then 0' to be true")
        XCTAssertTrue(elements.none { $0 < 0 }, "Expected 'none to be negative' to be true")
        XCTAssertFalse(elements.any { $0 > 6 }, "Expected 'any larger then 6' to be false")
        XCTAssertFalse(elements.all { $0 > 2 }, "Expected all to be false")
        XCTAssertFalse(elements.all { $0 > 6 }, "Expected all to be false")
        XCTAssertFalse(elements.none { $0 > 1 }, "Expected 'none over 1' to be false")
    }
    


    static var allTests = [
        ("testPlusOperator", testPlusOperator),
        ("testMinusOperator", testMinusOperator),
        ("testShuffleDoesNotChangeCount", testShuffleDoesNotChangeCount),
        ("testShuffledArraysKeepElements", testShuffledArraysKeepElements),
        ("testTomorrow", testTomorrow),
        ("testUniqueElements", testUniqueElements),
        ("testANYALLNONE", testANYALLNONE)
    ]
}
