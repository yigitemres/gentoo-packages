# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit elisp

DESCRIPTION="avy is a GNU Emacs package for jumping to visible text using a char-based decision tree."
HOMEPAGE="https://github.com/abo-abo/avy"
SRC_URI="https://github.com/abo-abo/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 amd64 ~x86 x86"

DEPEND=""
BDEPEND="${DEPEND}"
RDEPEND="${DEPEND}"

SITEFILE="99${PN}-gentoo.el"

src_compile(){
	rm avy-test.el
	elisp_src_compile
	elisp-make-autoload-file
}

src_install(){
	elisp_src_install
}
