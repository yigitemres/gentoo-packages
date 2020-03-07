# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit elisp git-r3

DESCRIPTION="Treemacs - a tree layout file explorer for Emacs."
HOMEPAGE="https://github.com/Alexander-Miller/treemacs"
EGIT_REPO_URI="https://github.com/Alexander-Miller/treemacs.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="dired evil magit persp projectile"

DEPEND="
	app-emacs/ace-window
	app-emacs/dash
	app-emacs/f
	app-emacs/all-the-icons
	app-emacs/ht
	app-emacs/hydra
	app-emacs/pfuture
	app-emacs/s

	evil? ( app-emacs/evil )
	magit? ( app-emacs/magit )
	persp? ( app-emacs/persp )
	projectile? ( app-emacs/projectile )
"
BDEPEND="${DEPEND}"
RDEPEND="${DEPEND}"

SITEFILE="99${PN}-gentoo.el"

src_compile(){
	if use dired ; then
		mv src/extra/treemacs-icons-dired.el .
	fi
	if use evil ; then
		mv src/extra/treemacs-evil.el .
	fi
	if use magit ; then
		mv src/extra/treemacs-magit.el .
	fi
	if use persp ; then
		mv src/extra/treemacs-persp.el .
	fi
	if use projectile ; then
		mv src/extra/treemacs-projectile.el .
	fi

	mv  src/elisp/* .

	elisp_src_compile
	elisp-make-autoload-file
}

src_install(){
	elisp_src_install

	insinto /usr/share/emacs/site-lisp/treemacs/icons
	doins -r icons/.

	insinto /usr/share/emacs/site-lisp/treemacs/
	doins -r src/scripts/.
}
