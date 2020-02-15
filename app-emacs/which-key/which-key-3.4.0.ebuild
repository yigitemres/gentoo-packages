# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit elisp

DESCRIPTION="Emacs package that displays available keybindings in popup."
HOMEPAGE="https://github.com/justbur/emacs-which-key"
SRC_URI="https://github.com/justbur/emacs-${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 amd64 ~x86 x86"

DEPEND=""
BDEPEND="${DEPEND}"
RDEPEND="${DEPEND}"

SITEFILE="99${PN}-gentoo.el"

src_unpack(){
	default_src_unpack
	mv ${WORKDIR}/emacs-${P} ${WORKDIR}/${P}
}

src_compile(){
	rm which-key-tests.el
	elisp_src_compile
	elisp-make-autoload-file
}

src_install(){
	elisp_src_install
}
