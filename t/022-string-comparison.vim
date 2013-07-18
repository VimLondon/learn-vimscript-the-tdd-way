" http://learnvimscriptthehardway.stevelosh.com/chapters/22.html
"
describe '=='

  it 'compares strings respecting user-defined &ignorecase setting'
    set noignorecase
    Expect 'abc' == 'abc'
    Expect 'abc' not == 'ABC'

    set ignorecase
    Expect 'abc' == 'abc'
    Expect 'abc' == 'ABC'
  end

end

describe '==#'

  it 'compares strings case-sensitively'
    set ignorecase
    Expect 'abc' ==# 'abc'
    Expect 'abc' not ==# 'ABC'

    set noignorecase
    Expect 'abc' ==# 'abc'
    Expect 'abc' not ==# 'ABC'
  end

end

describe '==?'

  it 'compares strings ignoring case'
    set ignorecase
    Expect 'abc' ==? 'abc'
    Expect 'abc' ==? 'ABC'

    set noignorecase
    Expect 'abc' ==? 'abc'
    Expect 'abc' ==? 'ABC'
  end

end
