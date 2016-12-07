" Some user configurable data
let g:OkCommentList_title="comments"
let g:OkCommentPrefix="[*] "

let g:OkFoldStart="{"
let g:OkFoldEnd="}"
let g:OkFilePrefix="* "
let g:OkFileSuffix=" *"

let g:OkLinePrefix=""
let g:OkLineSuffix=""

function! g:OpenComments()
  " find or open a new buffer for comments
  let fn = bufname("")
  let winnum = bufwinnr(g:OkCommentList_title)
  if winnum == -1
    let wcmd = g:OkCommentList_title
    exec 'silent!' . 'split ' . wcmd
  else
    exec winnum . 'wincmd w'
  endif

  set nobuflisted
  set noswf
  set syntax=okaycomment

  let fp = g:OkFilePrefix.fn.g:OkFileSuffix
  if search("^".fp) == 0
  endif
endfunction

function! g:SetupCommentBuffer(filename)
  let fn = a:filename
  call g:OpenComments()
  " set buffer options, like don't show up in my buffer list and no swapfile
  set nobuflisted
  set noswf

  " Insert the filename if it isn't already in the file
  let fp = g:OkFilePrefix.fn.g:OkFileSuffix
  let s:new_file = 0
  if search("^".fp) == 0
    let s:new_file = 1
    exec 'normal Go'
    exec 'normal I'.fp
  endif
endfunction

function! g:AddTodoComment()
  call g:SetupCommentBuffer("TODO")
  exec 'normal o'.g:OkCommentPrefix
  start!
endfunction

function! g:AddFileComment()
  call g:SetupCommentBuffer(bufname(""))
  exec 'normal o'.g:OkCommentPrefix
  start!
endfunction


function! g:AddBlockComment()
  let ln = line(".")
  call g:SetupCommentBuffer(bufname(""))

  if s:new_file == 1
    exec 'normal o'.g:OkFoldStart.'j'
  else
    exec 'normal o'.g:OkFoldStart.''
  endif

  " Now insert the lineno and line data
  " First mark the beginning and end
  mark [
  put c
  mark ]
  " now jump to the beginning
  exec 'normal g'."'".'['

  " count the lines
  let linecount = line("']") - line("'[")
  while linecount >= 0
    " And then insert the line decorator
    exec 'normal gI'.'  '.g:OkLinePrefix.ln.':A'.g:OkLineSuffix.'j'
    let linecount = linecount - 1
    let ln = ln + 1
  endwhile

  if s:new_file == 1
    exec 'normal ogI'.g:OkFoldEnd.''
  else
    exec 'normal OgI'.g:OkFoldEnd.''
  end

  exec 'normal ogI'.g:OkFoldStart.''
  exec 'normal ogI'.g:OkFoldEnd.''
  if s:new_file == 1
    let cursormove='ko'
  else
    let cursormove='ko'
  endif

  exec 'normal '.cursormove.g:OkCommentPrefix
  start!
endfunction


nmap <silent> <LocalLeader>cc "cY :call g:AddBlockComment()<CR>
vmap <silent> <LocalLeader>cc "cy :call g:AddBlockComment()<CR>
noremap <silent> <LocalLeader>cf :call g:AddFileComment()<CR>
noremap <silent> <LocalLeader>ct :call g:AddTodoComment()<CR>
noremap <silent> <LocalLeader>c :call g:OpenComments()<CR>
