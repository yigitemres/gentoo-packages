# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit elisp git-r3

DESCRIPTION="Modular in-buffer completion framework for Emacs."
HOMEPAGE="https://github.com/company-mode/company-mode"
EGIT_REPO_URI="https://github.com/company-mode/company-mode.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
BDEPEND="${DEPEND}"
RDEPEND="${DEPEND}"

SITEFILE="99${PN}-gentoo.el"

src_compile(){
	rm company-tests.el
	elisp_src_compile
	elisp-make-autoload-file
}

src_install(){
	elisp_src_install
}
