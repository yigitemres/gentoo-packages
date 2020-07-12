# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit elisp git-r3

DESCRIPTION="Emacs finally learns how to ctrl+F."
HOMEPAGE="https://github.com/raxod502/ctrlf"
EGIT_REPO_URI="https://github.com/raxod502/ctrlf.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
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
