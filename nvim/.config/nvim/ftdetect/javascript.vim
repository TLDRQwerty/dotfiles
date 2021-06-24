au! BufRead,BufNewFile *.js if getline(1) =~ "//\s*@flow" | setf flowtype | endif
