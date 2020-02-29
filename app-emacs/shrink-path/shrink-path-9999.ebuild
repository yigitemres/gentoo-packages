# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit elisp git-r3

DESCRIPTION="Small utility functions that allow for fish-style trunctated directories in eshell and for example modeline."
HOMEPAGE="https://gitlab.com/bennya/shrink-path.el"
EGIT_REPO_URI="https://gitlab.com/bennya/shrink-path.el.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	app-emacs/dash
	app-emacs/f
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
