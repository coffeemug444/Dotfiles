# Vim shortcuts

## Regular vim

**^o** (insert mode)
 * leave insert mode to do a single command _eg._
   * `^odiw` delete current word
   * `^op` paste

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

**^d ^u**
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

**^o ^i**
 * previous/next jump location

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

**u ^r**
 * undo/redo

**x X**
 * remove character on/before cursor
    * shorthand for `dl` or `dh`

**r**
 * replace character under cursor

**c [movement]**
 * replace selection

**^t ^d** (insert mode)
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

# Vim shortcuts

## Regular vim

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

**^d ^u**
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

**^o ^i**
 * previous/next jump location

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

**u ^r**
 * undo/redo

**x X**
 * remove character on/before cursor
    * shorthand for `dl` or `dh`

**r**
 * replace character under cursor

**c [movement]**
 * replace selection

**^t ^d** (insert mode)
 * add/remove indentation

**>> <<** (normal mode)
 * add/remove indentation

**= [movement]**
 * auto indent

**gn gN**
 * visually selects next/previous matched pattern
   * very useful in commands like `cgn` to quickly edit patterns

**.**
 * repeat last change
   * can tie in with `gcn` to quickly edit a few patterns in a row. Works with count, `n` or `N` to skip

**~**
 * invert case
   * can be used with `g`
     * `g~e`: invert case until end of word
   * also try `gU[movement]` and `gu[movement]` for upper/lower case of movements

**^w** (insert mode)
 * delete previous word


### Macros

**q**[_alpha_]
 * begin recording macro
   * end recording by pressing `q` again

**@**_[alpha]_
 * execute macro stored in [alpha]

**@@**
 * repeat last run macro

### Visual mode

**v**
 * enter visual mode

**V**
 * enter visual line mode

**^v**
 * enter visual block mode

#### Inside visual mode

**o**
 * goto begin/end of selection

**gv
 * reselect previous selection

**I A**
 * prepend/append to every line in selection

## Plugins

### gitgutter

**]h [h**
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



## Plugins

### gitgutter

**]h [h**
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
