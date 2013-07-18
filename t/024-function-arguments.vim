" http://learnvimscriptthehardway.stevelosh.com/chapters/24.html

describe 'function arguments'

  it 'breaks when args are referenced without scope'
    function! DisplayName(name)
      echom "Hello from " . name
    endfunction

    let caught = !!0
    try
      call DisplayName('VimLondon')
    catch /Undefined variable: name/
      let caught = !0
    endtry
    Expect caught to_be_true
  end

  it 'name can be referenced with argument scope, as a:name'
    function! DisplayName(name)
      return "Hello from " . a:name
    endfunction

    Expect DisplayName('VimLondon') == "Hello from VimLondon"
  end

end
