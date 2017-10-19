plist = require '../simple-plist'
filePath = "#{__dirname}/test-binary1.plist"

describe 'readFileSync can properly load and read a binary file', =>
  contents = plist.readFileSync filePath
  it "has the proper values", =>
    expect(contents.Name).toBe "John Doe"
    expect(contents['Birth Year']).toBe(1942)
    expect(contents['Travel Log']).toEqual(
      [
        'Tokyo, Honshu, Japan'
        'Philadelphia, PA'
        'Recife, Pernambuco, Brazil'
      ]
    )



describe "readFile works asynchronously", =>
  it "has the proper values", =>
    contents = plist.readFile filePath, (contents)=>
      expect(contents.Name).toBe "John Doe"
      expect(contents['Birth Year']).toBe(1942)
      expect(contents['Travel Log']).toEqual(
        [
          'Tokyo, Honshu, Japan'
          'Philadelphia, PA'
          'Recife, Pernambuco, Brazil'
        ]
      )
