call ddc#custom#patch_global('sources', [
      \ 'ultisnips',
      \ 'vim-lsp',
      \ 'treesitter',
      \ 'around',
      \ 'file',
      \ 'emoji',
      \])
call ddc#custom#patch_global('sourceOptions', {
      \ '_': {
      \   'minAutoCompleteLength': 1,
      \   'around': {'mark': 'A'},
      \   'matchers': ['matcher_fuzzy'],
      \   'converters': ['converter_remove_overlap'],
      \ },
      \ 'vim-lsp': {
      \   'matchers': ['matcher_fuzzy'],
      \   'mark': 'lsp',
      \ },
      \ 'file': {
      \   'mark': 'F',
      \   'isVolatile': v:true,
      \   'forceCompletionPattern': '\S/\S*',
      \ },
      \ 'treesitter':{'mark':'Tree'},
      \ 'ultisnips':{'mark':'Snips'},
      \ 'emoji': {
      \   'mark':'emoji',
      \   'matchers':['emoji'],
      \ },
      \}
      \)
call ddc#custom#patch_global('sourceParams', {
      \ 'around': {'maxSize': 500},
      \ })
call ddc#custom#patch_global('filterParams',{
      \  'matcher_fuzzy' : {
      \    'splitMode': 'word'
      \  }
      \})
call ddc#custom#patch_global('keywordPattern', '[a-zA-Z_:]\w*')

call ddc#custom#patch_global('completionMenu', 'pum.vim')
call ddc#enable()

