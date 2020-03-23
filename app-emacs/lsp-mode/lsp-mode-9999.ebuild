# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit elisp git-r3

DESCRIPTION="Emacs client/library for the Language Server Protocol."
HOMEPAGE="https://github.com/emacs-lsp/lsp-mode"
EGIT_REPO_URI="https://github.com/emacs-lsp/lsp-mode.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="ui flycheck company treemacs helm ivy dap ada angular bash cpp csharp clojure cmake crystal css d dart dhall dockerfile dart elixir elm erlang eslinf fsharp  go groovy hack html haskell lua java js jsflow json julia kotlin nim ocaml php powershell python r ruby rust scala (swift) terraform tex verilog vhdl vimscript vue xml yaml"

# fortran adds auto use itself... removed.
# lsp-mode needs hdyra because of lv-el

DEPEND="
	app-emacs/dash
	app-emacs/f
	app-emacs/ht
	app-emacs/hydra
	app-emacs/markdown-mode
	app-emacs/spinner

	ui? ( app-emacs/lsp-ui )
	flycheck? ( app-emacs/flycheck )
	company? ( app-emacs/company-lsp )
	treemacs? ( app-emacs/lsp-treemacs )
	helm? ( app-emacs/helm-lsp )
	ivy?  ( app-emacs/lsp-ivy )
	dap? ( app-emacs/dap-mode )

	python? ( || ( dev-python/python-language-server dev-python/ms-python-language-server ) )
	bash? ( dev-node/bash-language-server )
	java? ( app-emacs/lsp-java )
"

# TODO: Create other lsp-servers.

BDEPEND="${DEPEND}"
RDEPEND="${DEPEND}"

SITEFILE="99${PN}-gentoo.el"

src_compile(){
	elisp_src_compile
	elisp-make-autoload-file
}

src_install(){
	elisp_src_install
}
