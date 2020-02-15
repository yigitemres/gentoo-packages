# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit elisp git-r3

DESCRIPTION="Swiper - isearch with an overview and more, Ivy - a generic completion frontend for Emacs."
HOMEPAGE="https://github.com/abo-abo/swiper"
EGIT_REPO_URI="https://github.com/abo-abo/swiper.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
BDEPEND="${DEPEND}"
RDEPEND="${DEPEND}"

SITEFILE="99${PN}-gentoo.el"

src_compile(){
	rm ivy-test.el
	elisp_src_compile
	elisp-make-autoload-file
}

src_install(){
	elisp_src_install
}
