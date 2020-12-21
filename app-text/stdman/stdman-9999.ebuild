# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Formatted C++ stdlib man pages (cppreference)"
HOMEPAGE="https://github.com/jeaye/stdman"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/jeaye/stdman.git"
else
	KEYWORDS="~amd64"
	SRC_URI="https://github.com/jeaye/stdman/archive/${PV}.tar.gz -> ${P}.tar.gz"
fi

LICENSE="MIT"
SLOT="0"

src_prepare() {
	default
	# Avoid compressing files
	sed -i '/gzip/d' do_install || die
}

src_compile() {
	# don't need to compile anything
	true
}
