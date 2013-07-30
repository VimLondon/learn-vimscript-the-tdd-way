" Mark each test as a TODO
g/^\s*it '/put ='TODO'
g/TODO/norm ==

" Delete the reminder.
0
g/^" REMEMBER TO RUN/d

" Delete the ___() function definition
0
/\Vfunction! ___(value)/,/endfunction/delete

" change each ___(solution) to ___
%s/___([^)]\+)/___/g
