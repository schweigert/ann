function fat(n)
    if n == 0 then
        return 1
    end
    return n*fat(n-1)
endfunction

a = fat(6)
