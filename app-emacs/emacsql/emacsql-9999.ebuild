# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit elisp git-r3

DESCRIPTION="A high-level Emacs Lisp RDBMS front-end."
HOMEPAGE="https://github.com/skeeto/emacsql"
EGIT_REPO_URI="https://github.com/skeeto/emacsql.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="app-emacs/pg-el"
BDEPEND="${DEPEND}"
RDEPEND="${DEPEND}"

SITEFILE="99${PN}-gentoo.el"

src_compile(){
	sed -i 's/-L ..\/pg/-L \/usr\/share\/emacs\/site-lisp\/pg-el/' Makefile
	emake
}

src_install(){
	elisp_src_install
	insinto /usr/share/emacs/site-lisp/emacsql/
	doins sqlite/{emacs*,sql*}
}
