# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit elisp git-r3

DESCRIPTION="A utility package to collect various Icon Fonts."
HOMEPAGE="https://github.com/domtronn/all-the-icons.el"
EGIT_REPO_URI="https://github.com/domtronn/all-the-icons.el.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="app-emacs/memoize"
BDEPEND="${DEPEND}"
RDEPEND="${DEPEND}"

SITEFILE="99${PN}-gentoo.el"

src_compile(){
	elisp_src_compile
	elisp-compile data/*
	elisp-make-autoload-file
}

src_install(){
	elisp_src_install
	insinto /usr/share/emacs/site-lisp/all-the-icons/data
	doins data/*

	insinto /usr/share/fonts/all-the-icons #TODO: What is var $USERHOME?
	doins fonts/*
}

pkg_postinst(){
	elog "Updating font cache..."
	fc-cache -f -v
}
