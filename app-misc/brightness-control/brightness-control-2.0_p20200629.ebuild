# Copyright 2019-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7,8} )
DISTUTILS_SINGLE_IMPL=1

inherit distutils-r1 desktop

COMMIT="39c297e98621e4604e8fbeb4a155a224418460ed"

DESCRIPTION="Qt Brightness Controller in Python"
HOMEPAGE="https://github.com/lordamit/Brightness"
SRC_URI="https://github.com/lordamit/Brightness/archive/${COMMIT}.tar.gz -> ${P}.tar.gz"

KEYWORDS="~amd64 ~x86"
LICENSE="GPL-1"
SLOT="0"

BDEPEND="$(python_gen_cond_dep \
	'dev-python/cx_Freeze[${PYTHON_USEDEP}]'
)"

RDEPEND="$(python_gen_cond_dep \
	'dev-python/QtPy[${PYTHON_USEDEP}]'
)"

S="${WORKDIR}/Brightness-${COMMIT}/src"

PATCHES=(
	"${FILESDIR}/${PN}-use-qtpy.patch"
)

python_install_all () {
	distutils-r1_python_install_all

	doicon -s scalable icons/brightness-controller.svg
	make_desktop_entry brightness "Brightness Controller"  brightness-controller Settings
}
