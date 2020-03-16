# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3

DESCRIPTION="powerlevel10k zsh theme."
HOMEPAGE="https://github.com/romkatv/powerlevel10k"
EGIT_REPO_URI="https://github.com/romkatv/powerlevel10k.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="app-shells/zsh"
BDEPEND="${DEPEND}"
RDEPEND="${DEPEND}"

src_install(){
	insinto /usr/share/zsh/powerlevel10k
	doins *.zsh-theme prompt_*_setup

	insinto /usr/share/zsh/powerlevel10k/config
	doins -r config/*

	insinto /usr/share/zsh/powerlevel10k/gitstatus
	doins  gitstatus/*.zsh

	exeinto /usr/share/zsh/powerlevel10k/gitstatus/bin
	doexe  gitstatus/bin/gitstatusd-linux-x86_64*

	insinto /usr/share/zsh/powerlevel10k/internal
	doins -r internal/*

}

pkg_postinst(){
	elog "Dont forget to add:"
	elog "\"source /usr/share/zsh/powerlevel10k/powerlevel10k.zsh-theme\""
	elog "into your ~/.zshrc"
}
