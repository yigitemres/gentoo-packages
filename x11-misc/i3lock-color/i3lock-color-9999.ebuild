# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools git-r3

DESCRIPTION="Improved i3lock with color customization."
HOMEPAGE="https://github.com/Raymo111/i3lock-color"
EGIT_REPO_URI="https://github.com/Raymo111/i3lock-color.git"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	x11-libs/cairo
	media-libs/fontconfig
	dev-libs/libev
	media-libs/libjpeg-turbo
	x11-libs/libXinerama
	x11-libs/libxkbcommon
	x11-libs/libXrandr
	sys-libs/pam
	dev-util/pkgconf
	x11-libs/xcb-util-image
	x11-libs/xcb-util-xrm
"
BDEPEND="${DEPEND}"
RDEPEND="${DEPEND} !x11-misc/i3lock"

src_configure(){
	eautoreconf -fiv
	econf --prefix=/usr --sysconfdir=/etc --disable-sanitizers
}

src_compile(){
	emake
}

src_install(){
	emake DESTDIR=${D} install
}
