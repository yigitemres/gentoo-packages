# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit elisp git-r3

DESCRIPTION="Transient commands."
HOMEPAGE="https://github.com/magit/transient"
EGIT_REPO_URI="https://github.com/magit/transient.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="app-emacs/dash"
BDEPEND="${DEPEND}"
RDEPEND="${DEPEND}"

SITEFILE="99${PN}-gentoo.el"

src_compile(){
	sed -i \
		-e 's/addprefix -L ..\/..\/,$(DEPS)/addprefix -L \/usr\/share\/emacs\/site-lisp\/,$(DEPS)/' \
		default.mk

	emake
}

src_install(){
	insinto /usr/share/emacs/site-lisp/transient/
	doins lisp/transient*
}
