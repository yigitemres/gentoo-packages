# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit elisp git-r3

DESCRIPTION="Store EIEIO objects using EmacsQL"
HOMEPAGE="https://github.com/emacscollective/closql"
EGIT_REPO_URI="https://github.com/emacscollective/closql.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="app-emacs/emacsql"
BDEPEND="${DEPEND}"
RDEPEND="${DEPEND}"

SITEFILE="99${PN}-gentoo.el"

src_compile(){
	sed -i \
		-e 's/addprefix -L ..\/,$(DEPS)/addprefix -L \/usr\/share\/emacs\/site-lisp\/,$(DEPS)/' \
		Makefile
	emake
}

src_install(){
	elisp_src_install
}
