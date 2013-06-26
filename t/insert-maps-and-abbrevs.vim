" Abbreviations
" =============
" http://learnvimscriptthehardway.stevelosh.com/chapters/08.html#why-not-use-mappings
" Why not use mappings?

describe 'insert mapping'

  before
    new
    inoremap ssig --<CR>Vim London<CR>meetup.com/Vim-London
  end

  after
    iunmap ssig
    close!
  end

  it 'expands when "ssig" is typed in insert mode'
    normal issig
    Expect getline(1) == '--'
    Expect getline(2) == 'Vim London'
    Expect getline(3) == 'meetup.com/Vim-London'
  end

  it 'expands when "Larry Lessig" is typed in insert mode'
    normal iLarry Lessig
    Expect getline(1) == 'Larry Le--'
    Expect getline(2) == 'Vim London'
    Expect getline(3) == 'meetup.com/Vim-London'
  end

  it 'expands when "ssignificant" is typed in insert mode'
    normal issignificant
    Expect getline(1) == '--'
    Expect getline(2) == 'Vim London'
    Expect getline(3) == 'meetup.com/Vim-Londonnificant'
  end

end

describe 'insert abbreviation'

  before
    new
    iabbrev ssig --<CR>Vim London<CR>meetup.com/Vim-London
  end

  after
    iunmap ssig
    close!
  end

  it 'expands when "ssig" is typed in insert mode'
    normal issig
    Expect getline(1) == '--'
    Expect getline(2) == 'Vim London'
    Expect getline(3) == 'meetup.com/Vim-London'
  end

  it 'doesn''t expand when "Larry Lessig" is typed in insert mode'
    normal iLarry Lessig
    Expect getline(1) == 'Larry Lessig'
  end

  it 'doesn''t expand when "ssignificant" is typed in insert mode'
    normal issignificant
    Expect getline(1) == 'ssignificant'
  end

end
