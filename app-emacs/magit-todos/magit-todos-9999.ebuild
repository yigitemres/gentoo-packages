# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit elisp git-r3

DESCRIPTION="Displays keyword entries from source code comments."
HOMEPAGE="https://github.com/alphapapa/magit-todos"
EGIT_REPO_URI="https://github.com/alphapapa/magit-todos.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	app-emacs/async
	app-emacs/dash
	app-emacs/f
	app-emacs/hl-todo
	app-emacs/magit
	app-emacs/pcre2el
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
