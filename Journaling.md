Maintained externally. Not tracked in this vault.

Claude Workflow (update to vault-index):
```bash
find ~/Documents/ObsidianVault -name "*.md" \ 
	| grep -v ".obsidian" \ 
	| grep -v "templates/" \ 
	| sed "s|$HOME/Documents/ObsidianVault/||" \ 
	| sort > ~/Downloads/vault-index.txt
```
