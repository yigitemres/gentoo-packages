# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit elisp git-r3

DESCRIPTION="Company completion backend for lsp-mode."
HOMEPAGE="https://github.com/tigersoldier/company-lsp"
EGIT_REPO_URI="https://github.com/tigersoldier/company-lsp.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	app-emacs/company
	app-emacs/lsp-mode
	app-emacs/dash
	app-emacs/s
"
BDEPEND="${DEPEND}"
RDEPEND="${DEPEND}"


SITEFILE="99${PN}-gentoo.el"

src_compile(){
	elisp_src_compile
	elisp-make-autoload-file
}

src_install(){
	elisp_src_install
}
