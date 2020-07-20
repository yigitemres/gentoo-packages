# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit elisp git-r3

DESCRIPTION="Emacs Lisp binding and tooling for tree-sitter."
HOMEPAGE="https://github.com/ubolonton/emacs-tree-sitter"
EGIT_REPO_URI="https://github.com/ubolonton/emacs-tree-sitter.git"
SRC_URI="
	https://dl.bintray.com/ubolonton/emacs/tree-sitter-grammars-linux-0.1.0.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
BDEPEND="${DEPEND}"
RDEPEND="${DEPEND}"

SITEFILE="99${PN}-gentoo.el"

src_prepare(){
	default
	unpack "tree-sitter-grammars-linux-0.1.0.tar.gz"

	#removing json so fix module is not gpl error.
	rm json.so
}

src_compile(){
	elisp-compile langs/tree-sitter-langs-build.el

	cd ${S}/langs
	elisp-make-autoload-file
}

src_install(){
	insinto /usr/share/emacs/site-lisp/tree-sitter-langs/
	doins langs/*.el*

	insinto /usr/share/emacs/site-lisp/tree-sitter-langs/queries/c
	doins langs/queries/c/highlights.scm

	insinto /usr/share/emacs/site-lisp/tree-sitter-langs/queries/cpp
	doins langs/queries/cpp/highlights.scm

	insinto /usr/share/emacs/site-lisp/tree-sitter-langs/queries/css
	doins langs/queries/css/highlights.scm

	insinto /usr/share/emacs/site-lisp/tree-sitter-langs/queries/go
	doins langs/queries/go/highlights.scm

	insinto /usr/share/emacs/site-lisp/tree-sitter-langs/queries/html
	doins langs/queries/html/highlights.scm

	insinto /usr/share/emacs/site-lisp/tree-sitter-langs/queries/java
	doins langs/queries/java/highlights.scm

	insinto /usr/share/emacs/site-lisp/tree-sitter-langs/queries/javascript
	doins langs/queries/javascript/highlights.scm

	insinto /usr/share/emacs/site-lisp/tree-sitter-langs/queries/php
	doins langs/queries/php/highlights.scm

	insinto /usr/share/emacs/site-lisp/tree-sitter-langs/queries/python
	doins langs/queries/python/highlights.scm

	insinto /usr/share/emacs/site-lisp/tree-sitter-langs/queries/ruby
	doins langs/queries/ruby/highlights.scm

	insinto /usr/share/emacs/site-lisp/tree-sitter-langs/queries/rust
	doins langs/queries/rust/highlights.scm

	insinto /usr/share/emacs/site-lisp/tree-sitter-langs/queries/typescript
	doins langs/queries/typescript/highlights.scm

	exeinto /usr/share/emacs/site-lisp/tree-sitter-langs/bin
	doexe *.so

	elisp-site-file-install "${FILESDIR}/${SITEFILE}"
}

pkg_postinst(){
	elisp-site-regen
}

pkg_postrm(){
	elisp-site-regen
}
