" バックスペースでインサートモード中で削除したり行頭削除したり
set backspace=start,eol,indent

" 検索時にハイライトする
set hlsearch

":set shiftwidth=4
" タブと改行を可視化
:set list
:set listchars=eol:$,trail:~,tab:<-
:highlight NonText ctermfg=lightgray
:filetype indent on
:filetype plugin on

" 色付け
:syntax on

" neocomplcache を有効に
let g:neocomplcache_enable_at_startup = 1

" ----------------------
" タブ関係
" ----------------------
" タブを最初から表示する
set showtabline=2
" タブの切り替えを Ctrl + Tab でできるように
" cf: http://d.hatena.ne.jp/gsf_zero1/20060724/1153719810
if v:version >= 700
  nnoremap <C-S-Right> gt
  nnoremap <C-S-LEFT> gT
endif

" ts: tab stop
" sw: shift width (the number of characters text is moved sideways for the
"                  shift command (<< and >>))
:au FileType perl set ts=4 sw=4 expandtab
:au FileType ruby set ts=2 sw=2 expandtab
:au FileType javascript set ts=4 sw=4 expandtab
:au FileType typescript set ts=4 sw=4 expandtab
:au FileType xml  set ts=2 sw=2 expandtab
:au FileType html set ts=2 sw=2 expandtab
:au FileType xhtml set ts=2 sw=2 expandtab
:au FileType css  set ts=4 sw=4 expandtab

" 拡張子によってファイルタイプを指定する
" psgi ファイルを perl に
"autocmd BufNewFile, BufRead *.psgi set filetype=perl
:autocmd BufNewFile *.t set filetype=perl
:autocmd BufRead    *.t set filetype=perl
:autocmd BufNewFile *.enml set filetype=xml
:autocmd BufRead    *.enml set filetype=xml
:autocmd BufNewFile *.ts set filetype=typescript
:autocmd BufRead    *.ts set filetype=typescript
":au BufRead,BufNewFile *.ts setfiletype typescript

":set statusline=FORMAT:%{&ff}\ \/\ TYPE:%Y\ /\ ASCII:\%03.3b\ /\ HEX:\%02.2B\ /\ POS:%04l,%04v\ LIN:%L(%p%%)
":set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
:set statusline=%F%m%r%h%w\ [ENC=%{&fileencoding}][FORMAT=%{&ff}][TYPE=%Y][ASCII=\%03.3b][HEX=\%02.2B][POS=%04l,%04v][%p%%][LEN=%L]
:set laststatus=2

" InsertLeave したときに IBus をオフにする
"au InsertLeave * :call PyIBusDisable()

" PythonでIMのオフ
function! PyIBusDisable()
python << EOF
import ibus
bus = ibus.Bus()
ic = ibus.InputContext(bus, bus.current_input_contxt())
ic.disable()
EOF
endfunction

