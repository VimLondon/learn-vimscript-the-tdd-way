g/^\s*it '/put ='TODO'
g/TODO/norm ==
%s/\(function! \)\@<!___([^)]\+)/___/g
