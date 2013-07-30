" REMEMBER TO RUN :source conceal_solutions.vim
function! ___(value)
  return a:value
endfunction

describe 'About Dictionaries'

  it 'dictionaries are created with {} notation'
    " Refer to :help type()
    let empty_dictionary = {}
    Expect ___(4) ==# type(empty_dictionary)
  end

  it 'dictionaries are accessed by key with [] notation'
    let dict = {'foo': 'bar'}
    Expect ___('bar') ==# dict['foo']
  end

  it 'dictionaries are also accessed by key with . notation'
    let dict = {'foo': 'bar'}
    Expect ___('bar') ==# dict.foo
  end

  it 'dictionaries can contain numbers as keys'
    let dict = {3: 'is a number'}
    Expect ___('is a number') ==# dict[3]
  end

  it 'dictionaries do type coercion on key lookup'
    let dict = {3: 'is a number'}
    Expect ___('is a number') ==# dict['3']
  end

  it 'dictionaries do type coercion on key lookup'
    let dict = {'3': 'does not end well'}
    Expect ___('does not end well') ==# dict['2 cats' + '1 mouse']
  end

  it 'dictionary entries are set with [] notation'
    let dict = {'foo': 'bar'}
    let dict['bar'] = 'foo'
    Expect ___('foo') ==# dict['bar']
  end

  it 'dictionary entries are also set with . notation'
    let dict = {'foo': 'bar'}
    let dict.bar = 'foo'
    Expect ___('foo') ==# dict.bar
  end

  it 'nested dictionaries are accessed with two pairs of []'
    let dict = {'foo': {'bar': 'baz'}}
    Expect ___('baz') ==# dict['foo']['bar']
  end

  it 'nested dictionaries are assigned to with two pairs of []'
    let dict = {'foo': {'bar': 'baz'}}
    let dict['foo']['baz'] = 'bar'
    Expect ___('bar') ==# dict['foo']['baz']
  end

  it 'nested dictionaries are also accessed with two .'
    let dict = {'foo': {'bar': 'baz'}}
    Expect ___('baz') ==# dict.foo.bar
  end

  it 'nested dictionaries are also assigned to with two .'
    let dict = {'foo': {'bar': 'baz'}}
    let dict.foo.baz = 'bar'
    Expect ___('bar') ==# dict.foo.baz
  end

  it 'empty(dict) tells if a dictionary is empty'
    let empty_dictionary = {}
    Expect ___(1) ==# empty(empty_dictionary)
  end

  it 'has_key tells if a key exists in the dictionary'
    let dict = {'foo': 'baz'}
    Expect ___(1) ==# has_key(dict, 'foo')
  end

  it 'has_key tells if a key does not exist in the dictionary'
    let dict = {'foo': 'baz'}
    Expect ___(0) ==# has_key(dict, 'bar')
  end

  it 'len(mydict) returns the numer of keys in the dictionary'
    let dict = {'foo': 'baz', 'bar': 'verb'}
    Expect ___(2) ==# len(dict)
  end

  it 'keys(mydict) returns a list of dictionary keys'
    let dict = {'foo': 'baz', 'bar': 'verb'}
    Expect ___(['foo', 'bar']) ==# keys(dict)
  end

  it 'values(mydict) returns a list of dictionary values'
    let dict = {'foo': 'baz', 'bar': 'verb'}
    Expect ___(['baz', 'verb']) ==# values(dict)
  end

  it 'items(mydict) returns a list of lists of dictionary keys and values'
    let dict = {'foo': 'baz', 'bar': 'verb'}
    Expect ___([['foo', 'baz'], ['bar', 'verb']]) ==# items(dict)
  end

  it 'accessing a non-existent dictionary key throws an exception'
    let dict = {'foo': 'baz'}
    let caught = 'no'
    try
      let disallowed = dict['bar']
    catch /Key not present in Dictionary/
      let caught = 'yes'
    endtry
    Expect ___('yes') ==# caught
  end

  it 'remove(key) removes a key from a dictionary'
    let dict = {'foo': 'baz', 'bar': 'verb'}
    let removed = remove(dict, 'bar')
    Expect ___('verb') ==# removed
  end

  it 'unlet removes a key from a dictionary'
    let dict = {'foo': 'baz', 'bar': 'verb'}
    unlet dict.bar
    let caught = 'no'
    try
      let disallowed = dict['bar']
    catch /Key not present in Dictionary/
      let caught = 'yes'
    endtry
    Expect ___('yes') ==# caught
  end

  " You're on your own from here...

  " Helpful references:
  " :h Dictionary
  " http://vimdoc.sourceforge.net/htmldoc/eval.html#Dictionary
  " http://learnvimscriptthehardway.stevelosh.com/chapters/37.html

end
