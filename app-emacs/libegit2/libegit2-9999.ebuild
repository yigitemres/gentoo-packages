# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit elisp git-r3

DESCRIPTION="It's Magit! A Git porcelain inside Emacs."
HOMEPAGE="https://github.com/magit/libegit2"
EGIT_REPO_URI="https://github.com/magit/libegit2.git"
#EGIIT_SUBMODULES=(libgit2)

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
BDEPEND="${DEPEND}"
RDEPEND="${DEPEND}"

SITEFILE="99${PN}-gentoo.el"

src_compile(){
	emake
	elisp-make-autoload-file
}

src_install(){
	elisp-site-file-install "${FILESDIR}/${SITEFILE}"

	# TODO: Clean installed files.
	insinto /usr/share/emacs/site-lisp/libegit2
	doins -r  *
}
