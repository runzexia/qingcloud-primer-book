# Copyright 2018 <chaishushan{AT}gmail.com>. All rights reserved.
# Use of this source code is governed by a Apache
# license that can be found in the LICENSE file.

default:
	gitbook build

pdf:
	gitbook pdf

server:
	go run server.go

cover:
	convert -resize 1800x2360! cover.png cover.jpg
	convert -resize 200x262!   cover.png cover_small.jpg


# https://chai2010.cn/qingcloud-primer-book
deploy:
	-rm -rf _book
	gitbook build

	cd _book && \
		git init && \
		git add . && \
		git commit -m "Update github pages" && \
		git push --force --quiet "https://github.com/chai2010/qingcloud-primer-book.git" master:gh-pages

	@echo deploy done

clean:
	-rm -rf _book
