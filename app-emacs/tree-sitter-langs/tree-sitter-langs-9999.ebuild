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
	unpack tree-sitter-grammars-linux-0.1.0.tar.gz

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
