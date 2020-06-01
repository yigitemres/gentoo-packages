# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3

DESCRIPTION="A pretty system information tool written in POSIX sh."
HOMEPAGE="https://github.com/dylanaraps/pfetch"
EGIT_REPO_URI="https://github.com/dylanaraps/pfetch.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
BDEPEND="${DEPEND}"
RDEPEND="${DEPEND}"

src_install(){
	exeinto /usr/bin
	doexe pfetch
}
