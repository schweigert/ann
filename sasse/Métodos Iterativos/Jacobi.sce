function y=fat(n)
    if n == 0 then
        y = 1
    else
        y=n*fat(n-1)
    end
endfunction
