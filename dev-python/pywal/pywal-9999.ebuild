# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7,8} )

inherit distutils-r1 git-r3

DESCRIPTION="Generate and change color-schemes on the fly."
HOMEPAGE="https://github.com/dylanaraps/pywal"
EGIT_REPO_URI="https://github.com/dylanaraps/pywal.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	dev-python/setuptools_scm

	media-gfx/imagemagick
	>=dev-lang/python-3.5
	sys-process/procps
	|| ( media-gfx/feh x11-misc/nitrogen x11-misc/hsetroot x11-misc/habak )
"
BDEPEND="${DEPEND}"
RDEPEND="${DEPEND}"

distutils_enable_tests setup.py
