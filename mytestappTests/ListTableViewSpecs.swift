import Quick
import Nimble
import Nimble_Snapshots

@testable import mytestapp

class ListTableViewSpecs: QuickSpec {
    override func spec() {
        describe("the tableViewcell UI") {
            it("how it suppose to look") {
                let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
                expect(view) == snapshot("tableViewSnapshot")
            }
        }
    }
}

