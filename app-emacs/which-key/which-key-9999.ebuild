# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit elisp git-r3

DESCRIPTION="Emacs package that displays available keybindings in popup."
HOMEPAGE="https://github.com/justbur/emacs-which-key"
EGIT_REPO_URI="https://github.com/justbur/emacs-which-key.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
BDEPEND="${DEPEND}"
RDEPEND="${DEPEND}"

SITEFILE="99${PN}-gentoo.el"

src_compile(){
	elisp-compile which-key.el
	elisp-make-autoload-file
}

src_install(){
	elisp-install ${PN} which-key.el* which-key-autoloads.el
}
