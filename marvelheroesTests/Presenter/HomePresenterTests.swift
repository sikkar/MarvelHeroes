//
//  HomePresenterTests.swift
//  marvelheroesTests
//
//  Created by Angel on 10/3/21.
//

@testable import marvelheroes
import Foundation
import XCTest

class HomePresenterTests: XCTestCase {
    func testViewDidLoadAndGotInitialCharacters() {
        let (sut, _, _) = makeSUT()
        sut.viewDidLoad()
        XCTAssertTrue(sut.getNumberOfItems() == 2)
    }

    func testGetMoreCharactersAppendedToList() {
        let (sut, _, _) = makeSUT()
        sut.viewDidLoad()
        sut.getMoreCharacters()
        XCTAssertTrue(sut.getNumberOfItems() == 4)
    }

    func testGetSingleCharacter() {
        let (sut, _, _) = makeSUT()
        sut.dataManager.getCharacterDetailWith(id: "1") { char in
            XCTAssertNotNil(char)
        }
    }

    func testViewDidReload() {
        let (sut, view, _) = makeSUT()
        sut.viewDidLoad()
        sut.view?.reloadData()
        XCTAssertTrue(view.viewDidReload)
    }

    func testHideAndShowLoad() {
        let (sut, view, _) = makeSUT()
        sut.view?.showLoading()
        sut.view?.hideLoading()
        XCTAssertTrue(view.viewDidShowLoading && view.viewDidHideLoading)
    }

    func testGetCharAtIndex() {
        let (sut, _, _) = makeSUT()
        sut.viewDidLoad()
        let char = sut.getCharacter(at: IndexPath(row: 0, section: 0))
        XCTAssertNotNil(char)
    }

    func testRouterOpensCharacterDetails() {
        let (sut, _, router) = makeSUT()
        sut.viewDidLoad()
        sut.showCharacterDetail(at: IndexPath(row: 0, section: 0))
        XCTAssertNotNil(router.character)
    }

    private func makeSUT(file: StaticString = #filePath, line: UInt = #line) -> (sut: HomePresenter<HomeViewSpy, HomeRouterSpy>, view: HomeViewSpy, router: HomeRouterSpy) {
        let view = HomeViewSpy()
        let router = HomeRouterSpy()
        let sut = HomePresenter(router: router, view: view)
        sut.dataManager = HomeDataManagerMock()
        trackPotentialLeaks(view, file: file, line: line)
        trackPotentialLeaks(router, file: file, line: line)
        trackPotentialLeaks(sut, file: file, line: line)
        return (sut, view, router)
    }

    private func trackPotentialLeaks(_ instance: AnyObject, file: StaticString = #filePath, line: UInt = #line) {
        addTeardownBlock { [weak instance] in
            XCTAssertNil(instance, "Instance should be deallocated. Potential memory leak", file: file, line: line)
        }
    }
}
