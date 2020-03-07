# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit elisp git-r3

DESCRIPTION="lsp-mode + treemacs"
HOMEPAGE="https://github.com/emacs-lsp/lsp-treemacs"
EGIT_REPO_URI="https://github.com/emacs-lsp/lsp-treemacs.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	app-emacs/dash
	app-emacs/f
	app-emacs/ht
	app-emacs/lsp-mode
	app-emacs/treemacs
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

	insinto /usr/share/emacs/site-lisp/lsp-treemacs/icons
	doins -r icons/.
}
