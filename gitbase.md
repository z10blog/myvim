---
title: git 基本操作
date: 2017-04-10 20:38:10
tags:
---
git 是一个开源的版本控制系统
master 主分支
git reset HEAD file命令既可以回退版本，也可以把暂存区的修改回退到工作区。当我们用HEAD时，表示最新的版本。
rm test.txt 命令只是从工作区删除了文件，仓库中仍然存在这个文件，如果要从仓库中删除这个文件可以使用git rm test.txt 命令，另外如果是误删了，我们可以使用git checkout -- test.txt 命令把文件从仓库中恢复到工作区。
HEAD 表示当前版本，HEAD^表示上一个版本，HEAD^^...，也可以写成HEAD~100
常用命令：
	1. git init 初始化一个git 仓库
	2. git add readme.txt 往仓库暂存区里添加文件
	3. git commit -m "add commit des" 把所有暂存区内容提交到当前分支
	4. git status 查看仓库状态
	5. git diff readme.txt 查看文件文件修改了那些内容
	6. git log 查看提交历史 --pretty=oneline 之显示commit id 和 提交说明
	7. git reset --hard HEAD^ | git reset --hard 323423 指定comit id
	7. git reflog 用来打印出历史命令记录
	http://www.liaoxuefeng.com/files/attachments/001384907702917346729e9afbf4127b6dfbae9207af016000/0
	8. git diff HEAD -- readme.txt 查看工作区和版本库里面最新版本的区别
	9. git checkout -- readme.txt 丢弃工作区中的修改
	
** 远程仓库 remote 远程
$git remote add origin git@github.com:xxxxxx/xxxxx.git
origin 是仓库的名称
$ git push -u origin master
把本地库的内容推送到远程，用git push命令，实际上是把当前分支master推送到远程。

由于远程库是空的，我们第一次推送master分支时，加上了-u参数，Git不但会把本地的master分支内容推送的远程新的master分支，还会把本地的master分支和远程的master分支关联起来，在以后的推送或者拉取时就可以简化命令。如下：
$ git push origin master

** 从远程仓库克隆
当我们从零开发时先创建一个远程仓库。
让后使用git clone 克隆一个本地仓库
$ git clone git@github.com:xxxxxx/xxxx.git
$ cd xxxx
使用https除了速度慢以外，还有个最大的麻烦是每次推送都必须输入口令，但是在某些只开放http端口的公司内部就无法使用ssh协议而只能用https。






** 分支 branch
分支在实际中有什么用呢？假设你准备开发一个新功能，但是需要两周才能完成，第一周你写了50%的代码，如果立刻提交，由于代码还没写完，不完整的代码库会导致别人不能干活了。如果等代码全部写完再一次提交，又存在丢失每天进度的巨大风险。

$ git branch dev 创建分支
$ git checkout -b dev 创建分支并切换过去
$ git branch 查看当前分支
$ git merge dev 把dev分支合并到master分支上,必须切换到master上
$ git branch -d dev 删除dev分支，合并之后再删除分支dev

** 冲突
当master 分支test.txt 文件与 dev 分支test文件不同时，要执行合并命令是就会出现冲突，这时我们是不能提交的，只能解决冲突之后才能提交，查看冲突的文件test.txt <<<<<=======>>>>>>是git标记出不同分支的内容。
修改过冲突文件之后从新git add test.txt git commit -m "xxx"就可以了。
最后要删除dev分支

用git log --graph命令可以看到分支合并图

合并分支时，加上--no-ff参数就可以用普通模式合并，合并后的历史有分支，能看出来曾经做过合并，而fast forward合并就看不出来曾经做过合并。

** Bug分支
git stash 把当前工作现场存储起来，等以后恢复现场后继续工作,这是git status查看工作区就是干净的
$ git stash list 查看有哪些stash
$ git stash apply 恢复存储的工作，并没有删除stash
$ git stash drop 删除stash
$ git stash pop 恢复的同时删除stash

$git stash apply stash@{0} 删除指定stash

** git branch -D feature-vulcan 在没有合并时强制删除该分支

$ git remote 查看远程分支
$ git remote -v 想看远程仓库详情

** 推送分支
推送分支，就是把该分支上的所有本地提交推送到远程库。推送时，要指定本地分支，这样，Git就会把该分支推送到远程库对应的远程分支上：
$git push origin master
这样就把本地master分支推送到远程仓库origin上了
$git push origin dev 这样就把本地dev分支推送到远程origin分支了

但是，并不是一定要把本地分支往远程推送，那么，哪些分支需要推送，哪些不需要呢？

master分支是主分支，因此要时刻与远程同步；

dev分支是开发分支，团队所有成员都需要在上面工作，所以也需要与远程同步；

bug分支只用于在本地修复bug，就没必要推到远程了，除非老板要看看你每周到底修复了几个bug；

feature分支是否推到远程，取决于你是否和你的小伙伴合作在上面开发。

总之，就是在Git中，分支完全可以在本地自己藏着玩，是否推送，视你的心情而定！

** 抓取分支
当你的小伙伴从远程库clone时，默认情况下，你的小伙伴只能看到本地的master分支。

现在，你的小伙伴要在dev分支上开发，就必须创建远程origin的dev分支到本地，于是他用这个命令创建本地dev分支：
$git checkout -b dev origin/dev
现在，他就可以在dev上继续修改，然后，时不时地把dev分支push到远程：
$ git push origin dev

** tag
git tag v1.0 创建tag
git tag 查看tag
$git tag v0.9 commitId
git show <tagname>参考tag

git tag -d v0.1 删除tag
git push origin v1.0 推送tag到远程
git push origin --tags 推送全部tag到远程
git push origin :refs/tags/<tagname>可以删除一个远程标签。










