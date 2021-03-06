" http://learnvimscriptthehardway.stevelosh.com/chapters/24.html

describe 'function arguments'

  it 'breaks when args are referenced without scope'
    TODO | let SOLUTION = 'YOU TELL ME!'
    function! DisplayName(name)
      echom "Hello from " . name
    endfunction

    let caught = !!0
    try
      call DisplayName('VimLondon')
    catch /Undefined variable: name/
      let caught = !0
    endtry
    Expect caught to_be_specified
  end

  it 'name can be referenced with argument scope, as a:name'
    TODO | let SOLUTION = 'YOU TELL ME!'
    function! DisplayName(name)
      return "Hello from " . SOLUTION
    endfunction

    Expect DisplayName('VimLondon') == "Hello from VimLondon"
  end

end

describe 'splat arguments'

  before
    function! Varg(...)
      return {
            \ 'a:0':    a:0,
            \ 'a:1':    a:1,
            \ 'a:000':  a:000
            \ }
    endfunction
  end

  it 'a:0 reports the number of arguments'
    TODO | let SOLUTION = 'YOU TELL ME!'
    Expect Varg('a','b')['a:0'] == SOLUTION
  end

  it 'a:1 is the first argument'
    TODO | let SOLUTION = 'YOU TELL ME!'
    Expect Varg('a','b')['a:1'] == SOLUTION
  end

  it 'a:000 is an array of all arguments supplied'
    TODO | let SOLUTION = 'YOU TELL ME!'
    Expect Varg('a','b')['a:000'] == SOLUTION
  end

end

describe 'named + splat arguments'

  before
    function! Varg(foo, ...)
      return {
            \ 'a:foo':  a:foo,
            \ 'a:0':    a:0,
            \ 'a:1':    a:1,
            \ 'a:000':  a:000
            \ }
    endfunction
  end

  it 'labels first argument as a:foo'
    TODO | let SOLUTION = 'YOU TELL ME!'
    Expect Varg('a','b','c')['a:foo'] == SOLUTION
  end

  it 'a:0 reports the number of unlabelled arguments'
    TODO | let SOLUTION = 'YOU TELL ME!'
    Expect Varg('a','b','c')['a:0'] == SOLUTION
  end

  it 'a:1 is the first unlabelled argument'
    TODO | let SOLUTION = 'YOU TELL ME!'
    Expect Varg('a','b','c')['a:1'] == SOLUTION
  end

  it 'a:000 is an array of all unlabelled arguments'
    TODO | let SOLUTION = 'YOU TELL ME!'
    Expect Varg('a','b','c')['a:000'] == SOLUTION
  end

end
