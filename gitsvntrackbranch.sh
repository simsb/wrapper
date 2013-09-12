

git config --add svn-remote.dev-mosaic-sales.url http://svn.corelogic.local/svn/main/branches/mosaic-sales/mosaic-sales
git config --add svn-remote.dev-mosaic-sales.fetch :refs/remotes/git-svn-dev-mosaic-sales

git svn fetch dev-mosaic-sales
git branch --track dev-mosaic-sales git-svn-dev-mosaic-sales
git checkout dev-mosaic-sales
git svn rebase