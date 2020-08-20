# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit elisp git-r3

DESCRIPTION="Parallel thread modern Emacs package manager."
HOMEPAGE="https://github.com/conao3/feather.el"
EGIT_REPO_URI="https://github.com/conao3/feather.el.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	app-emacs/async
	app-emacs/async-await
	app-emacs/page-break-lines
	app-emacs/ppp
"
BDEPEND="${DEPEND}"
RDEPEND="${DEPEND}"

SITEFILE="99${PN}-gentoo.el"

src_configure(){
	elisp_src_configure
	elisp-make-autoload-file
}

src_install(){
	elisp_src_install
}
