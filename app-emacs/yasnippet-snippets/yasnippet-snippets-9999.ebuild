# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit elisp git-r3

DESCRIPTION="A collection of yasnippet snippets for many languages."
HOMEPAGE="https://github.com/AndreaCrotti/yasnippet-snippets"
EGIT_REPO_URI="https://github.com/AndreaCrotti/yasnippet-snippets.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="a ~amd64 ~x86"

DEPEND=""
BDEPEND="${DEPEND}"
RDEPEND="${DEPEND}"

SITEFILE="99${PN}-gentoo.el"

src_compile(){
	elisp_src_compile
	elisp-make-autoload-file
}

src_install(){
	elisp_src_install
	insinto /usr/share/emacs/site-lisp/yasnippet-snippets/snippets
	doins -r snippets/.
}
