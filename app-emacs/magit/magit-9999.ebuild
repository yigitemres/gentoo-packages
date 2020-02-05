# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit elisp git-r3

DESCRIPTION="It's Magit! A Git porcelain inside Emacs."
HOMEPAGE="https://github.com/magit/magit"
EGIT_REPO_URI="https://github.com/magit/magit.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	app-emacs/dash
	app-emacs/libegit2
	app-emacs/transient
	app-emacs/with-editor
"
BDEPEND="${DEPEND}"
RDEPEND="${DEPEND}"

SITEFILE="99${PN}-gentoo.el"

src_compile(){

	echo "DASH_DIR = /usr/share/emacs/site-lisp/dash/" >> config.mk
	echo "TRANSIENT_DIR = /usr/share/emacs/site-lisp/transient/" >> config.mk
	echo "WITH_EDITOR_DIR = /usr/share/emacs/site-lisp/with-editor/" >> config.mk
	echo "LIBGIT_DIR = /usr/share/emacs/site-lisp/libegit2/" >> config.mk

	emake
}

src_install(){
	elisp-site-file-install "${FILESDIR}/${SITEFILE}"
	insinto /usr/share/emacs/site-lisp/magit
	doins -r lisp/*
}
