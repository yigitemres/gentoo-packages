# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7,8} )

inherit distutils-r1 git-r3

DESCRIPTION="Generate and change color-schemes on the fly."
HOMEPAGE="https://github.com/pre-commit/pre-commit"
EGIT_REPO_URI="https://github.com/pre-commit/pre-commit.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	>=dev-lang/python-3.6[sqlite]
	dev-python/setuptools[${PYTHON_USEDEP}]
	dev-python/setuptools_scm

	dev-python/cfgv
	dev-python/identify
	dev-python/importlib_metadata
	dev-python/importlib_resources
	dev-python/nodeenv
	dev-python/pyyaml
	dev-python/toml
	dev-python/virtualenv
"
BDEPEND="${DEPEND}"
RDEPEND="${DEPEND}"

distutils_enable_tests setup.py
