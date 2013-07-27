function! ___(value)
  return a:value
endfunction

function! EchoMeow()
  echom "Meow!"
endfunction

function! GetMeow()
  return "Meow!"
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

  it 'functions are invoked by the :let keyword'
    let result = GetMeow()
    Expect ___('Meow!') ==# result
  end

  it 'functions are invoked when used in a context where {expr} is expected'
    Expect ___('Meow!') ==# GetMeow()
  end

end
