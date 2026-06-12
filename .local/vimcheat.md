# Vim shortcuts

## Regular vim

### Useful weird stuff

**\^o** (insert mode)

 * leave insert mode to do a single command _eg._
   * `^odiw` delete current word
   * `^op` paste

**:r**

 * reads output of file/command into current buffer _eg._
   * `:r my_text.txt` pastes the content of `my_text.txt` into the current buffer
   * `:r !date` pastes the date into the current buffer

**:s/pattern/replacement/**

 * replaces first match of `pattern` with `replacement` on the current line
   * `:s/pattern/replacement/g` replaces all instances of `pattern`
   * `:%s/pattern/replacement/g` replaces all instances in the entire file

**:**_[selection]_**!**_[cmd]_

 * pipes selection into [cmd], and replaces it with the [cmd]'s' output _eg._
   * `:%!sort` sorts all lines in the buffer
   * `:.!bc` equates the value of the current line as a math equation
   * `:'<,'>!nl -ba` add line numbers to a visually selected region

**:g :v**

 * global/inverse commands; run commands on all matching/non-matching lines _eg._
   * `:g/foo/d` delete all lines that match `foo`
   * `:v/foo/normal @q` run `@q` on all lines that don't match `foo`
   * `:g/foo/s/bar/baz/g` substitute bar for baz on all lines that match `foo`

**\^v** (in command mode)

 * lets you type in literal characters _eg._
   * `:s/ /<C-v><enter>/g` replaces all spaces with newlines

### Movement

**h j k l**

 * left/up/down/right

**gg G**

 * top of file/end of file

**0 $**

 * start of line/end of line

<b>^ _g</b>

 * start/end of non-whitespace text

**b B, e E, w W**

 * start of previous word/WORD
 * end of work/WORD
 * start of next word/WORD

**\^d \^u**

 * move cursor down/up by half a page

**f F [char]**

 * next/previous [char]

**; ,**

 * next/previous char match (after using `f F`)

**/ ? [pattern]**

 * next/previous [pattern]

<b>* #</b>

 * next/previous pattern under cursor

**n N**

 * next/previous pattern match (after using `/ ? * #`)

**%**

 * jump to matching bracket

### Marks and jumping

**\^o \^i**

 * previous/next jump location

**m**_[alpha]_**`**_[alpha]_

 * set/jump to mark [alpha]
   * NB. capital letters allow marks between files

**``**

 * jump to previous location

**:marks**

 * list marks

<code>\`0</code>-<code>\`9</code>

 * positions in the last 0-9 files edited

<code>\`[</code> <code>\`]</code>

 * start/end of last yanked or changed text

<code>\`<</code> <code>\`></code>

 * start/end of last visual selection

<code>\`^</code>

 * last insert mode position (where `gi` jumps to)

<code>\`.</code>

 * last change position

### Editing

NB. Most edit commands accept a repeat term [n], eg. `y3j` yanks the next 3 lines

**d**_elete_ **[movement]**

 * delete _eg._
   * **diw**: current word

   * **dd**: current line

   * **dj**: current and next line

   * **d** (in visual select): selection


**y**_ank_ **[movement]**

 * copy _eg._
   * **yi{**: inside {brackets}

   * **yy**: current line

   * **yh**: char before cursor

   * **yl**: char under cursor

   * **y** (in visual select): selection


**p P**

 * paste before/after

**o O**

 * create newline below/above cursor and enter insert mode

**u \^r**

 * undo/redo

**x X**

 * remove character on/before cursor
    * shorthand for `dl` or `dh`

**r**

 * replace character under cursor

**c [movement]**

 * replace selection

**\^t \^d** (insert mode)

 * add/remove indentation

**>> <<** (normal mode)

 * add/remove indentation

**= [movement]**

 * auto indent

**gn gN**

 * visually selectd next/previous matched pattern
   * very useful in commands like `cgn` to quickly edit patterns

**.**

 * repeat last change
   * can tie in with `gcn` to quickly edit a few patterns in a row. Works with count, `n` or `N` to skip

**~**

 * invert case
   * can be used with `g`
     * `g~e`: invert case until end of word
   * also try `gU[movement]` and `gu[movement]` for upper/lower case of movements

**\^w \^u**

 * delete word/line before cursor
   * shorthand for `^odb` and `^od^`

**\^x\^l**

 * line completion
   * `\^e` to exit without selecting

**\^r**_[reg]_

 * pastes from register [reg]

**\^r=**

 * expression register _eg._
   * `^r=5*5+3` pastes `28`

### Macros

**q**[_alpha_]

 * begin recording macro
   * end recording by pressing `q` again

**@**_[alpha]_

 * execute macro stored in [alpha]

**@@**

 * repeat last run macro

### Registers

**:reg**

 * lists all current registers and their contents

**:let @r1=@r2**

 * sets the contents of `r1` to the contents of `r2` _eg._
   * `:let @/=@0` sets the contents of pattern buffer to the copy buffer

`"_`

 * black hole
   * allows deletion without it going into the `"1` reg. _eg._
     * `"_d3j` deletes the next 3 lines without copying them

`"0`

 * last yank

`"1`

 * last delete

`"2 -"9`

 * delete stack
   * every delete pushes `"3` to `"4` etc.

`"/`

 * last search pattern

`"%`

 * filename

### Visual mode

**v**

 * enter visual mode

**V**

 * enter visual line mode

**\^v**

 * enter visual block mode

#### Inside visual mode

**o**

 * goto begin/end of selection

**gv**

 * reselect previous selection

**gi**

 * go to previous insert mode location and enter insert mode

**I A**

 * prepend/append to every line in selection

## Plugins

### gitgutter

**]c [c**

 * next/previous hunk

**<leader>hp**

 * preview hunk

**<leader>hu**

 * undo hunk

**<leader>hs**

 * stage hunk

### fugitive

**:Git blame**

 * open up blame window with blames on every line

**:GBrowse** (with blame opened)

 * open up commit in browser

**:Git**

 * open git interface

#### Inside git interface

**=**

 * preview changes

**X**

 * restore file (undo changes)

**-**

 * stage file

**O**

 * open file

**cc**

* commit staged files

### unimpaired

**[e ]e**

 * exchange current line with [n] lines above/below

**[<space> ]<space**

 * insert blank line above/below

### surround

supports surrounding text with bracket types ()[]{}<html_tags> etc.
NB. left brackets `{([` include spaces, eg. `[ surrounded ]`

**ys**<i><span>[movement]</span><span>[type]</span></i>

 * surrounds [movement] with [type] _eg._
   * `ysiw}` surrounds current word with {brackets}

**cs**<i><span>[type1]</span><span>[type2]</span></i>

 * replaces surround [type1] with [type2] _eg._
   * `cs{[` changes `{surrounded}` to `[ surrounded ]`

**ds**_[type]_

 * removes surrounds that match [type] _eg._
   * `ds[` changes `[ surrounded ]` to `surrounded`

**S**_[type]_ (in visual mode)

 * surrounds selection with [type]

### commentary

**gc**[movement] **gcc**

 * comments out lines

### treesitter

**za**

 * toggle fold

**zR**

 * open all folds in buffer
