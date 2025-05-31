# Copyright 1999-2023 Gentoo Authors
# Distrubted under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 autotools

DESCRIPTION="gcli - Simple and portable CLI for interacting with GitHub, GitLab and Gitea from the command line."
HOMEPAGE="https://gitlab.com/herrhotzenplotz/gcli"
EGIT_REPO_URI="https://gitlab.com/herrhotzenplotz/gcli"

LICENSE="Nico Sonack"
SLOT="0"
KEYWORDS="~amd64"

src_prepare(){
	default
}

src_configure(){
	einfo "Running ./configure with no arguments"
    ./configure || die
}

src_compile(){
    emake
}

src_install(){
   exeinto /bin
   doexe gcli

   doman docs/*.1
}
