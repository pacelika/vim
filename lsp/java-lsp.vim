if executable("jdtls") 
    au User lsp_setup call lsp#register_server({
            \ 'name': 'jdtls',
            \ 'cmd': {server_info->['jdtls']},
            \ 'filetypes': ['java'],
            \ 'allowlist': ['java'],
            \ 'root_pattern': ['pom.xml', 'build.gradle', '.git', 'settings.gradle', 'mvnw', 'gradlew'],
    \ })
endif
