# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{7,8} )
DISTUTILS_USE_SETUPTOOLS=rdepend

inherit distutils-r1

DESCRIPTION="Async Python 3.6+ web server/framework | Build fast. Run fast."
HOMEPAGE="
	https://pypi.python.org/pypi/sanic
	https://github.com/huge-success/sanic
"
SRC_URI="https://github.com/huge-success/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

# lots of these
# ValueError: Exception during request: [AttributeError("'AsyncConnectionPool' object has no attribute 'arequest'")]
RESTRICT="test"

RDEPEND="
	dev-python/aiofiles[${PYTHON_USEDEP}]
	dev-python/httpx[${PYTHON_USEDEP}]
	>=dev-python/httptools-0.0.10[${PYTHON_USEDEP}]
	dev-python/multidict[${PYTHON_USEDEP}]
	dev-python/ujson[${PYTHON_USEDEP}]
	dev-python/uvloop[${PYTHON_USEDEP}]
	>=dev-python/websockets-8.1[${PYTHON_USEDEP}]
	<dev-python/websockets-9.0[${PYTHON_USEDEP}]
"
DEPEND="
	${RDEPEND}
	test? (
		dev-python/beautifulsoup[${PYTHON_USEDEP}]
		>=dev-python/httpcore-0.3.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-5.2.1[${PYTHON_USEDEP}]
		dev-python/pytest-benchmark[${PYTHON_USEDEP}]
		dev-python/pytest-sanic[${PYTHON_USEDEP}]
		dev-python/uvicorn[${PYTHON_USEDEP}]
		www-servers/gunicorn[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
distutils_enable_sphinx docs \
				dev-python/docutils \
				dev-python/pygments \
				dev-python/sphinx_rtd_theme \
				dev-python/recommonmark \
				www-servers/gunicorn

python_prepare_all() {
	# 'dependency' not found in `markers` configuration option
	# requires pytest version which is no longer in ::gentoo
	rm tests/test_load_module_from_file_location.py || die
	rm tests/test_update_config.py || die

	distutils-r1_python_prepare_all
}
