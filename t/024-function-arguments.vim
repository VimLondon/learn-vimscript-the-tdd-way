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
