# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( pypy3 python3_7 )

inherit distutils-r1

SRC_URI=""
EGIT_REPO_URI="https://github.com/dreid/${PN}.git"
inherit git-r3

DESCRIPTION="An AtomicLong type using CFFI."
HOMEPAGE="https://github.com/dreid/atomiclong"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""

RDEPEND="virtual/python-cffi[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
