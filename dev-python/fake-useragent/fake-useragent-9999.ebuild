# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python{2_7,3_{6,7,8}} )

inherit distutils-r1 git-r3

DESCRIPTION="Up to date simple useragent faker with real world database"
HOMEPAGE="https://github.com/hellysmile/fake-useragent"
EGIT_REPO_URI="https://github.com/hellysmile/fake-useragent.git"

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
