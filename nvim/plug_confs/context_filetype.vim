let g:context_filetype#filetypes = {
            \     'markdown': [
            \         {
            \             'start': '.*$',
            \             'end': '$',
            \             'filetype': 'plaintex',
            \         },
            \         {
            \             'start': '.*$$',
            \             'end': '$$',
            \             'filetype': 'plaintex',
            \         },
            \     ],
            \ }
