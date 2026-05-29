import XCTest
import SwiftUI
@testable import Nuggs

final class AsymmetricalWindowShapeTests: XCTestCase {

    // MARK: - Happy Path

    func testNormalRectAndRadius() {
        let shape = AsymmetricalWindowShape(radius: 20)
        let rect = CGRect(x: 0, y: 0, width: 100, height: 100)
        let path = shape.path(in: rect)

        XCTAssertFalse(path.isEmpty)
        let boundingBox = path.boundingRect

        // Bounding box should match the rect
        XCTAssertEqual(boundingBox.width, 100, accuracy: 0.1)
        XCTAssertEqual(boundingBox.height, 100, accuracy: 0.1)
    }

    func testZeroRadius() {
        let shape = AsymmetricalWindowShape(radius: 0)
        let rect = CGRect(x: 0, y: 0, width: 100, height: 100)
        let path = shape.path(in: rect)

        XCTAssertFalse(path.isEmpty)
        let boundingBox = path.boundingRect
        XCTAssertEqual(boundingBox.width, 100, accuracy: 0.1)
        XCTAssertEqual(boundingBox.height, 100, accuracy: 0.1)
    }

    // MARK: - Edge Cases

    func testZeroSize() {
        let shape = AsymmetricalWindowShape(radius: 20)
        let rect = CGRect(x: 0, y: 0, width: 0, height: 0)
        let path = shape.path(in: rect)

        // Behavior of path for zero rect with radius
        // The arcs will be drawn at negative coordinates or weird places but the path shouldn't crash
        XCTAssertFalse(path.isEmpty)
    }

    func testRadiusLargerThanBounds() {
        let shape = AsymmetricalWindowShape(radius: 100)
        let rect = CGRect(x: 0, y: 0, width: 50, height: 50)
        let path = shape.path(in: rect)

        XCTAssertFalse(path.isEmpty)
    }

    func testNegativeSize() {
        let shape = AsymmetricalWindowShape(radius: 20)
        let rect = CGRect(x: 0, y: 0, width: -100, height: -100)
        let path = shape.path(in: rect)

        XCTAssertFalse(path.isEmpty)
    }
}
