# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit elisp git-r3

DESCRIPTION="Generate template files/folders from one org document."
HOMEPAGE="https://github.com/conao3/org-generate.el"
EGIT_REPO_URI="https://github.com/conao3/org-generate.el.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	app-emacs/cort
	app-emacs/mustache
"

BDEPEND="${DEPEND}"
RDEPEND="${DEPEND}"

SITEFILE="99${PN}-gentoo.el"

src_prepare(){
	default
	rm org-generate-tests.el
}

src_compile(){
	elisp_src_compile
	elisp-make-autoload-file
}

src_install(){
	elisp_src_install
}
