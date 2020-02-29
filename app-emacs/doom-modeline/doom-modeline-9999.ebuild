# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit elisp git-r3

DESCRIPTION="A fancy and fast mode-line inspired by minimalism design."
HOMEPAGE="https://github.com/seagle0128/doom-modeline"
EGIT_REPO_URI="https://github.com/seagle0128/doom-modeline.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	app-emacs/all-the-icons
	app-emacs/dash
	app-emacs/shrink-path
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
