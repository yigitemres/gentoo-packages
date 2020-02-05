# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit elisp git-r3

DESCRIPTION="An opinionated pack of modern color-themes."
HOMEPAGE="https://github.com/hlissner/emacs-doom-themes"
EGIT_REPO_URI="https://github.com/hlissner/emacs-doom-themes.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

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
	insinto /usr/share/emacs/site-lisp/doom-themes/
	doins themes/*
}
