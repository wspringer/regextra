regextra = require '../src/index'

describe 'regextra', ->

  it 'should support a `reduce` operation', ->
    str = '12 345 67 890123'
    concat = (acc, [full]) -> acc + full
    expect(regextra(/[0-9]+/g).match(str).reduce(concat, '')).toEqual('1234567890123')


  it 'should support a `map` operation', ->
    str = '12 345 67 890123'
    toInt = ([full]) -> parseInt(full)
    expect(regextra(/[0-9]+/g).match(str).map(toInt)).toEqual [12, 345, 67, 890123]    


  it 'should support a `forEach` operation', ->
    callback = jest.fn()
    str = '12 345 67 890123'    
    regextra(/[0-9]+/g).match(str).forEach(callback)
    expect(callback.mock.calls.length).toEqual 4


  it 'should support groups', ->
    callback = jest.fn()
    str = '12.56 121.55'
    regextra(/([0-9]+)\.([0-9]+)/g).match(str).forEach callback
    expect(callback.mock.calls.length).toEqual 2

    expect(callback.mock.calls[0][0][0]).toEqual '12.56'
    expect(callback.mock.calls[0][0][1]).toEqual '12'
    expect(callback.mock.calls[0][0][2]).toEqual '56'

    expect(callback.mock.calls[1][0][0]).toEqual '121.55'
    expect(callback.mock.calls[1][0][1]).toEqual '121'
    expect(callback.mock.calls[1][0][2]).toEqual '55'


  it 'should provide access to the index', ->
    str = '12.56 121.55'
    result = regextra(/([0-9]+)\.([0-9]+)/g).match(str).map(({index}) -> index)
    expect(result).toEqual([0, 6])




