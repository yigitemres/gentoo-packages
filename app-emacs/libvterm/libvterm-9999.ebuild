# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit elisp git-r3

DESCRIPTION="Emacs Libvterm"
HOMEPAGE="https://github.com/akermu/emacs-libvterm/"
EGIT_REPO_URI="https://github.com/akermu/emacs-libvterm.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="dev-libs/libvterm"
BDEPEND="${DEPEND}"
RDEPEND="${DEPEND}"

SITEFILE="99${PN}-gentoo.el"

src_compile(){
	elisp_src_compile
	elisp-make-autoload-file

	mkdir -p ${WORKDIR}/${P}/build
	cd ${WORKDIR}/${P}/build

	cmake -DUSE_SYSTEM_LIBVTERM=yes ..
	emake
}

src_install(){
	elisp_src_install

	exeinto /usr/share/emacs/site-lisp/libvterm/
	doexe vterm-module.so
}
