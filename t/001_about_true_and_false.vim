" REMEMBER TO RUN :source conceal_solutions.vim
function! ___(value)
  return a:value
endfunction

function! TruthValue(condition)
  if a:condition
    return 'truthy'
  else
    return 'falsey'
  endif
endfunction

describe 'About True and False'

  it 'number 1 is treated as true'
    Expect ___('truthy') ==# TruthValue(1)
  end

  it 'number 0 is treated as false'
    Expect ___('falsey') ==# TruthValue(0)
  end

  it '! operator can be used to negate'
    Expect ___('truthy') ==# TruthValue(!0)
    Expect ___('falsey') ==# TruthValue(!!0)
  end

  it 'non-zero numbers are always true'
    Expect ___('truthy') ==# TruthValue(-1)
    Expect ___('truthy') ==# TruthValue(010)
    Expect ___('truthy') ==# TruthValue(0x10)
  end

  it 'strings are false'
    Expect ___('falsey') ==# TruthValue('')
    Expect ___('falsey') ==# TruthValue("")
    Expect ___('falsey') ==# TruthValue('Hello, World!')
    Expect ___('falsey') ==# TruthValue('Room 101')
    Expect ___('falsey') ==# TruthValue('0 day exploit')
  end

  it 'strings beginning with a non-zero number are true (Doh!)'
    Expect ___('truthy') ==# TruthValue('101 Dalmations')
    Expect ___('truthy') ==# TruthValue('-1 offset')
  end

  " Notes:
  " TruthValue(0.1) error: Using Float as a Number
  " TruthValue([]) error: Using List as a Number
  " TruthValue({}) error: Using Dictionary as a Number
  " TODO: write specs to describe these exceptions.

end
