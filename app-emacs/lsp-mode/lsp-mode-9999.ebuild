# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit elisp git-r3

DESCRIPTION="Emacs client/library for the Language Server Protocol."
HOMEPAGE="https://github.com/emacs-lsp/lsp-mode"
EGIT_REPO_URI="https://github.com/emacs-lsp/lsp-mode.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

# lsp-mode needs hdyra because of lv-el

DEPEND="
	app-emacs/dash
	app-emacs/f
	app-emacs/ht-el
	app-emacs/hydra
	app-emacs/markdown-mode
	app-emacs/spinner-el
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
