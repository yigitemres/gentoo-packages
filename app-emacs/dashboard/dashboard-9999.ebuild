# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit elisp git-r3

DESCRIPTION="An extensible emacs dashboard."
HOMEPAGE="https://github.com/emacs-dashboard/emacs-dashboard"
EGIT_REPO_URI="https://github.com/emacs-dashboard/emacs-dashboard.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="app-emacs/page-break-lines"
BDEPEND="${DEPEND}"
RDEPEND="${DEPEND}"

SITEFILE="99${PN}-gentoo.el"

src_compile(){
	elisp_src_compile
	elisp-make-autoload-file
}

src_install(){
	elisp_src_install
	insinto /usr/share/emacs/site-lisp/dashboard/banners
	doins banners/*
}
