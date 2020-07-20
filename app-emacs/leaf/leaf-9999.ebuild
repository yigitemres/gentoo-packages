# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit elisp git-r3

DESCRIPTION="Flexible, declarative, and modern init.el package configuration."
HOMEPAGE="https://github.com/conao3/leaf.el"
EGIT_REPO_URI="https://github.com/conao3/leaf.el.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
BDEPEND="${DEPEND}"
RDEPEND="${DEPEND}"

SITEFILE="99${PN}-gentoo.el"

src_prepare(){
	default
	rm cort-test.el leaf-tests.el
}

src_compile(){
	elisp_src_compile
	elisp-make-autoload-file
}

src_install(){
	elisp_src_install
}
