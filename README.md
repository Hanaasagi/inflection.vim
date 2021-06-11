# inflection.vim

Binding the Python `inflection` in Vim.

### Normal Mode

![normal-mode](https://github.com/Hanaasagi/inflection.vim/blob/master/screenshot/normal-mode.gif)


### Visual Mode

![visaul-mode](https://github.com/Hanaasagi/inflection.vim/blob/master/screenshot/visual-mode.gif)


### Insert Mode

![insert-mode](https://github.com/Hanaasagi/inflection.vim/blob/master/screenshot/insert-mode.gif)


## Requirements

- Vim 7.3 or higher.
- Enable `+Python` feature in Vim.

## Installation

Depend on the package manager you are using. Give an example of manual installation.

```sh
git clone --depth=1 --recursive https://github.com/Hanaasagi/inflection.vim ~/.vim/bundle/inflection.vim
```

## Usage

Edit the `vimrc` file, and add following code. You can change the keybinding as you want.

```vim
command! Inflection call inflection#inflect_current_word()
command! -range InflectionVisual call inflection#inflect_visaul_block()
inoremap <C-l> <ESC>h y:call inflection#inflect_current_word_in_insert_mode()<CR>
```

## Inflection Form

| shortcut  | form        | description  |
|-----------|-------------|--------------|
| `U`       | uppercase   | Convert to uppercase.  |
| `L`       | lowercase   | Convert to lowercase.|
| `_`       | underscore  | Make an underscored, lowercase form from the expression in the string. |
| `c`       | camelize    | Convert to CamelCase. |
| `C`       | Camelize    | Convert to CamelCase and convert the first char to uppercase. |
| `-`       | dasherize   | Replace underscores with dashes in the string.  |
| `P`       | pluralize   | Return the plural form of a word.  |
| `S`       | singularize | Return the singular form of a word, the reverse of pluralize.  |


## License 

BSD 3-Clause License Copyright (c) 2021, 秋葉.
