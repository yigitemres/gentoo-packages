# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3

DESCRIPTION="Sweet looking lockscreen for linux system."
HOMEPAGE="https://github.com/pavanjadhaw/betterlockscreen"
EGIT_REPO_URI="https://github.com/pavanjadhaw/betterlockscreen.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	x11-misc/i3lock-color
	media-gfx/imagemagick
	x11-apps/xdpyinfo
	x11-apps/xrandr
	sys-devel/bc
	media-gfx/feh
"
BDEPEND="${DEPEND}"
RDEPEND="${DEPEND}"


src_install(){
	exeinto /usr/bin
	doexe betterlockscreen

	insinto /usr/share/doc/betterlockscreen
	doins examples/betterlockscreenrc
}
