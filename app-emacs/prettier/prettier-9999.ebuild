# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit elisp git-r3

DESCRIPTION="Formats your JavaScript code using 'prettier' on file save."
HOMEPAGE="https://github.com/prettier/prettier-emacs"
EGIT_REPO_URI="https://github.com/prettier/prettier-emacs.git"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="dev-node/prettier"
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
