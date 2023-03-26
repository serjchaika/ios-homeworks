import Foundation

struct Photo {
    var fileName: String = ""
}

extension Photo {

    static func pull() -> [Photo] {
        [
            Photo(fileName: "Photo01"),
            Photo(fileName: "Photo02"),
            Photo(fileName: "Photo03"),
            Photo(fileName: "Photo04"),
            Photo(fileName: "Photo05"),
            Photo(fileName: "Photo06"),
            Photo(fileName: "Photo07"),
            Photo(fileName: "Photo08"),
            Photo(fileName: "Photo09"),
            Photo(fileName: "Photo10"),
            Photo(fileName: "Photo11"),
            Photo(fileName: "Photo12"),
            Photo(fileName: "Photo13"),
            Photo(fileName: "Photo14"),
            Photo(fileName: "Photo15"),
            Photo(fileName: "Photo16"),
            Photo(fileName: "Photo17"),
            Photo(fileName: "Photo18"),
            Photo(fileName: "Photo19"),
            Photo(fileName: "Photo20"),
        ]
    }

}
