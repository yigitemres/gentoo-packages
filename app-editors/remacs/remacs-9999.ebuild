# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3 autotools

DESCRIPTION="Remacs - Rust Emacs Editor."
HOMEPAGE="https://github.com/remacs/remacs"
EGIT_REPO_URI="https://github.com/remacs/remacs.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="network-sandbox"

DEPEND="
	dev-libs/libxml2
	media-libs/giflib
	media-libs/tiff
	net-libs/gnutls
	sys-apps/texinfo
	sys-devel/automake
	sys-devel/clang
	sys-libs/ncurses
	x11-libs/gtk+
	x11-libs/libXpm
	x11-libs/libXt
	|| ( dev-lang/rust-bin dev-lang/rust )
	|| ( media-libs/libjpeg-turbo media-libs/jpeg )
"
BDEPEND="${DEPEND}"
RDEPEND="${DEPEND}"

src_configure(){
	eautoreconf
	eautoconf
	emake LIBCLANG_PATH=$(llvm-config --libdir)
}

src_install(){
	emake DESTDIR=${D} install-strip
}
