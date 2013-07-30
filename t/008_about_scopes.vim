" REMEMBER TO RUN :source conceal_solutions.vim
function! ___(value)
  return a:value
endfunction
" http://learnvimscriptthehardway.stevelosh.com/chapters/20.html

describe 'About Scopes'
  " :h internal-variable

  it 'the b: scope attaches a variable to the current buffer'
    " :h b:var
    tabnew
    let b:hello = 'Howdy!'
    Expect ___(1) ==# exists("b:hello")
    Expect ___('Howdy!') ==# b:hello

    new
    Expect ___(0) ==# exists("b:hello")
    tabclose!
  end

  " Vimscript has several different kinds of scope. For more info, read:
  " :h internal-variable
  "
  " Write tests to explore each of those scopes.

end
