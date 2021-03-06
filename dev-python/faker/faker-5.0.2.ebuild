# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

DISTUTILS_USE_SETUPTOOLS=rdepend
PYTHON_COMPAT=( python3_{7,8,9} )

inherit distutils-r1

DESCRIPTION="Python package that generates fake data"
HOMEPAGE="
	https://github.com/joke2k/faker
	https://pypi.org/project/Faker
"
SRC_URI="https://github.com/joke2k/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	>=dev-python/python-dateutil-2.4[${PYTHON_USEDEP}]
	>=dev-python/text-unidecode-1.3[${PYTHON_USEDEP}]
"
BDEPEND="test? (
	dev-python/freezegun[${PYTHON_USEDEP}]
	>=dev-python/pytest-6.0.1[${PYTHON_USEDEP}]
	>=dev-python/random2-1.0.1[${PYTHON_USEDEP}]
	>=dev-python/ukpostcodeparser-1.1.1[${PYTHON_USEDEP}]
	>=dev-python/validators-0.13.0[${PYTHON_USEDEP}]
	)
"

src_prepare() {
	export READTHEDOCS=True || die
	default
}

distutils_enable_tests --install pytest
#TODO: make docs working
#Handler <function _create_source_files at 0x7fba9ff481f0> for event 'builder-inited' threw an exception (exception: [Errno 2] No such file or directory: '/var/tmp/portage/dev-python/faker-5.0.0/work/docs/providers.rst')
#distutils_enable_sphinx docs --no-autodoc
