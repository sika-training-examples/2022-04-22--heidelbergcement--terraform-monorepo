fmt:
	terraform fmt -recursive

fmt-check:
	terraform fmt -recursive -check

infracost:
	infracost breakdown --path .

setup-git-hooks:
	rm -rf .git/hooks
	(cd .git && ln -s ../.git-hooks hooks)
