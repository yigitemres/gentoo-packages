# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

NODE_DEPEND="
	nan:2.14.0
	prebuild-install:5.3.3
	prebuild:10.0.0
"
NODE_BIN="

"

inherit node

DESCRIPTION="Bash grammer for tree-sitter"
HOMEPAGE="https://github.com/tree-sitter/tree-sitter-bash"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	sys-apps/yarn
	net-libs/nodejs
	sys-devel/clang
	sys-devel/make
"
BDEPEND="${DEPEND}"
RDEPEND="${DEPEND}"

src_install(){
	node_src_install
}
