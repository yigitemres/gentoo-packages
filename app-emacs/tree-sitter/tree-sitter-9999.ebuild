# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit elisp prefix git-r3

DESCRIPTION="Emacs Lisp binding and tooling for tree-sitter."
HOMEPAGE="https://github.com/ubolonton/emacs-tree-sitter"
EGIT_REPO_URI="https://github.com/ubolonton/emacs-tree-sitter.git"
SRC_URI="
	https://github.com/ubolonton/emacs-tree-sitter/releases/download/0.4.0/tree-sitter-dyn.so.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	app-misc/tree-sitter
	app-emacs/tree-sitter-langs
"
BDEPEND="${DEPEND}"
RDEPEND="${DEPEND}"

SITEFILE="99${PN}-gentoo.el"

src_prepare(){
	default

	unpack tree-sitter-dyn.so.gz
}

src_compile(){
	elisp-compile lisp/tree-sitter-cli.el
	elisp-compile langs/tree-sitter-langs-build.el

	cd ${S}/lisp
	elisp-make-autoload-file
}

src_install(){
	insinto /usr/share/emacs/site-lisp/tree-sitter/
	doins lisp/*

	insinto /usr/share/emacs/site-lisp/tree-sitter/src
	doins src/*

	elisp-site-file-install "${FILESDIR}/${SITEFILE}"

	exeinto /usr/share/emacs/site-lisp/tree-sitter/
	doexe tree-sitter-dyn.so
}

pkg_postinst(){
	elisp-site-regen
}

pkg_postrm(){
	elisp-site-regen
}
