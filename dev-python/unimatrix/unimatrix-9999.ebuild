# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python{2_7,3_{6,7,8}} )

inherit distutils-r1 git-r3

DESCRIPTION="Python script to simulate the display from \"The Matrix\" in terminal. Uses half-width katakana unicode characters by default, but can use custom character sets. Accepts keyboard controls while running. Based on CMatrix."
HOMEPAGE="https://github.com/will8211/unimatrix"
EGIT_REPO_URI="https://github.com/will8211/unimatrix.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	dev-python/setuptools_scm
"
BDEPEND="${DEPEND}"
RDEPEND="${DEPEND}"

distutils_enable_tests setup.py
