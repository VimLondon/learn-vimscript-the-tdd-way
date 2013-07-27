function! ___(value)
  return a:value
endfunction

function! EchoMeow()
  echom "Meow!"
endfunction

function! GetMeow()
  return "Meow!"
endfunction

function! NamedAndVariableArguments(foo, ...)
  return {
        \ 'a:foo':  a:foo,
        \ 'a:0':    a:0,
        \ 'a:1':    a:1,
        \ 'a:000':  a:000
        \ }
endfunction

describe 'About Functions'

  it 'functions must start with an uppercase letter'
    function! Hello()
      return "Hello"
    endfunction
    " refer to :h exists()
    Expect ___(1) ==# exists('*Hello')
  end

  it 'functions declared with a lowercase letter throw an error'
    let caught = 'no'
    try
      function! hello()
        return "Hello"
      endfunction
    catch
      let caught = 'yes'
    endtry
    Expect ___('yes') ==# caught
    Expect ___(0) ==# exists('*hello')
  end

  it 'functions can be invoked with :call'
    call EchoMeow()
    Expect ___('Meow!') ==# v:statusmsg
  end

  it 'functions can be invoked with :echom, which echoes the return value'
    echom GetMeow()
    Expect ___('Meow!') ==# v:statusmsg
  end

  it 'functions are invoked by the :let keyword, which assigns the return value to a variable'
    let result = GetMeow()
    Expect ___('Meow!') ==# result
  end

  it 'functions are invoked when used in a context where {expr} is expected'
    Expect ___('Meow!') ==# GetMeow()
  end

  it 'named arguments can be referenced using scope a: (e.g. a:name)'
    " :help a:var
    function! DisplayName(name)
      return "Hello from " . ___(a:name)
    endfunction

    Expect "Hello from VimLondon" ==# DisplayName('VimLondon')
  end

  it 'elipsis argument (...) stands for a variable number of arguments'
    function! VariableArguments(...)
      return {
            \ 'a:0':    a:0,
            \ 'a:1':    a:1,
            \ 'a:2':    a:2,
            \ 'a:000':  a:000
            \ }
    endfunction

    Expect ___(2) ==# VariableArguments('a','b')['a:0']
    Expect ___('a') ==# VariableArguments('a','b')['a:1']
    Expect ___('b') ==# VariableArguments('a','b')['a:2']
    Expect ___(['a','b']) ==# VariableArguments('a','b')['a:000']
  end

  it 'named and elipsis arguments can be combined'
    function! NamedAndVariableArguments(foo, ...)
      return {
            \ 'a:foo':  a:foo,
            \ 'a:0':    a:0,
            \ 'a:1':    a:1,
            \ 'a:2':    a:2,
            \ 'a:000':  a:000
            \ }
    endfunction

    Expect ___(2) ==# NamedAndVariableArguments('a','b','c')['a:0']
    Expect ___('a') ==# NamedAndVariableArguments('a','b','c')['a:foo']
    Expect ___('b') ==# NamedAndVariableArguments('a','b','c')['a:1']
    Expect ___('c') ==# NamedAndVariableArguments('a','b','c')['a:2']
    Expect ___(['b','c']) ==# NamedAndVariableArguments('a','b','c')['a:000']
  end

  it 'function! will overwrite an existing function of same name'
    function Quicksilver()
      return 'mercury'
    endfunction
    function! Quicksilver()
      return 'Hg'
    endfunction
    Expect ___('Hg') ==# Quicksilver()
  end

  it 'function (without the bang) raises an error when defining a function whose name is already in use'
    let caught = 'no'
    try
      function Snowflake()
        return 'I am unique'
      endfunction
      function Snowflake()
        return 'I can never be'
      endfunction
    catch /Function Snowflake already exists/
      let caught = 'yes'
    endtry
    Expect ___('yes') ==# caught
  end

end
