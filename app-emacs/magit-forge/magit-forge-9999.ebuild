# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit elisp git-r3

DESCRIPTION="Work with Git forges from the comfort of Magit."
HOMEPAGE="https://github.com/magit/forge"
EGIT_REPO_URI="https://github.com/magit/forge.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	app-emacs/closql
	app-emacs/dash
	app-emacs/ghub
	app-emacs/emacsql
	app-emacs/magit
	app-emacs/markdown-mode
	app-emacs/transient
	app-emacs/treepy
	app-emacs/with-editor
"
BDEPEND="${DEPEND}"
RDEPEND="${DEPEND}"

SITEFILE="99${PN}-gentoo.el"

src_compile(){

	# Add dependencies
	sed -i \
		-e '/DEPS += with-editor/a DEPS += magit-popup\nDEPS += graphql' \
		default.mk

	# Fix dependencies folder and location
	sed -i \
#		-e 's/magit\/lisp/magit/' \
		-e 's/transient\/lisp/transient/' \
		-e 's/addprefix -L ..\/..\/,$(DEPS)/addprefix -L \/usr\/share\/emacs\/site-lisp\/,$(DEPS)/' \
		default.mk

	emake

}

src_install(){
	elisp_src_install
}
