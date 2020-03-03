# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="An incremental parsing system for programming tools."
HOMEPAGE="https://github.com/tree-sitter/tree-sitter"
SRC_URI="https://github.com/tree-sitter/${PN}/releases/download/${PV}/${PN}-linux-x64.gz -> ${PN}.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
BDEPEND="${DEPEND}"
RDEPEND="${DEPEND}"

S=${WORKDIR}

src_install(){
	exeinto /usr/bin
	doexe tree-sitter
}
