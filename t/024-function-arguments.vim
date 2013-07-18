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
    Expect Varg('a','b')['a:0'] == 2
  end

  it 'a:1 is the first argument'
    Expect Varg('a','b')['a:1'] == 'a'
  end

  it 'a:000 is an array of all arguments supplied'
    Expect Varg('a','b')['a:000'] == ['a','b']
  end

end
