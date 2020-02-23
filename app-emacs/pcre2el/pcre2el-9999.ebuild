# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit elisp git-r3

DESCRIPTION="Convert between PCRE, Emacs and rx regexp syntax."
HOMEPAGE="https://github.com/joddie/pcre2el"
EGIT_REPO_URI="https://github.com/joddie/pcre2el.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
BDEPEND="${DEPEND}"
RBDEPEND="${DEPEND}"

SITEFILE="99${PN}-gentoo.el"

src_compile(){
	rm pcre2el-tests.el
	elisp_src_compile
	elisp-make-autoload-file
}

src_install(){
	elisp_src_install
}
