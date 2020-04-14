# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit elisp git-r3

DESCRIPTION="A major emacs mode for editing Rust source code."
HOMEPAGE="https://github.com/rust-lang/rust-mode"
EGIT_REPO_URI="https://github.com/rust-lang/rust-mode.git"

LICENSE="|| ( MIT Apache-2.0 )"
SLOT="0"
KEYWORDS="~amd64 ~x86"

SITEFILE="99${PN}-gentoo.el"
DOCS="README.md"

src_compile(){
	elisp-compile rust-mode.el
	elisp-make-autoload-file
}

src_install(){
	elisp-install ${PN} rust-mode.{el,elc}
	elisp-install ${PN} rust-mode-autoloads.el

	elisp-site-file-install "${FILESDIR}/${SITEFILE}"
}
