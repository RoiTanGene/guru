# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{7,8} )
DISTUTILS_USE_SETUPTOOLS=rdepend

inherit distutils-r1

SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.zip"
KEYWORDS="~amd64"
DESCRIPTION="A CFF table subroutinizer for FontTools"
HOMEPAGE="https://github.com/googlefonts/compreffor"
LICENSE="Apache-2.0"
SLOT="0"

RDEPEND="
	>=dev-python/fonttools-4.2.0[${PYTHON_USEDEP}]
"
DEPEND="
	${RDEPEND}
"
BDEPEND="
	app-arch/unzip
	dev-python/cython[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

src_prepare() {
	#undesired dependency
	sed -i "s|setup_requires=pytest_runner + wheel,|setup_requires=wheel,|" setup.py
	default
}

python_test() {
	distutils_install_for_testing
	default
}
