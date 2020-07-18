# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit elisp git-r3

DESCRIPTION="Group buffers into workspaces with programmable rules."
HOMEPAGE="https://github.com/alphapapa/bufler.el"
EGIT_REPO_URI="https://github.com/alphapapa/bufler.el.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="helm"

DEPEND="
	app-emacs/dash
	app-emacs/f
	app-emacs/pretty-hydra
	app-emacs/magit
	helm? ( app-emacs/helm )
"
BDEPEND="${DEPEND}"
RDEPEND="${DEPEND}"

SITEFILE="99${PN}-gentoo.el"

src_compile(){
	if ! use helm ; then
		rm helm-bufler.el
	fi

	elisp_src_compile
	elisp-make-autoload-file
}

src_install(){
	elisp_src_install
}
