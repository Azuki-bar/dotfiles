call ddc#custom#patch_global('sources', [
            \ 'around',
            \ 'vim-lsp',
            \ 'deoppet',
            \ 'file'
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
      \ 'deoppet': {
      \   'dup': v:true, 
      \   'mark': 'dp'
      \},
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
call ddc#enable()

