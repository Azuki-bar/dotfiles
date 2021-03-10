# how to setup git
```toml 
[user]
	name = Azuki-bar
	email = 42642269+Azuki-bar@users.noreply.github.com
	signingkey = 1EDBA8753DB27AD1
[core]
	excludesfile = /home/azukibar/.gitignore_global
	quatepath = false
	editor = nvim
[credential]
	helper = /usr/lib/git-core/git-credential-libsecret
# arch wiki を参照してgnomekeyringを使うあれをセットアップしてください。
[gpg]
	program = /usr/bin/gpg
[commit]
	gpgsign = true
[pull]
	rebase = false
```
