# Copyright 2017-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CRATES="
	aho-corasick-0.7.15
	ansi_term-0.11.0
	ansi_term-0.12.1
	anyhow-1.0.36
	assert_cmd-1.0.2
	atty-0.2.14
	autocfg-1.0.1
	bitflags-1.2.1
	cfg-if-0.1.10
	cfg-if-1.0.0
	chrono-0.4.19
	chrono-english-0.1.4
	clap-2.33.3
	crossbeam-channel-0.5.0
	crossbeam-utils-0.8.1
	difference-2.0.0
	doc-comment-0.3.3
	emlop-0.4.1
	errno-0.2.7
	errno-dragonfly-0.1.1
	escargot-0.5.0
	gcc-0.3.55
	hermit-abi-0.1.17
	itoa-0.4.6
	kernel32-sys-0.2.2
	lazy_static-1.4.0
	libc-0.2.81
	log-0.4.11
	memchr-2.3.4
	num-integer-0.1.44
	num-traits-0.2.14
	predicates-1.0.5
	predicates-core-1.0.0
	predicates-tree-1.0.0
	proc-macro2-1.0.24
	quote-1.0.8
	regex-1.4.2
	regex-syntax-0.6.21
	ryu-1.0.5
	scanlex-0.1.4
	serde-1.0.118
	serde_derive-1.0.118
	serde_json-1.0.60
	stderrlog-0.5.0
	strsim-0.8.0
	syn-1.0.55
	sysconf-0.3.4
	tabwriter-1.2.1
	termcolor-1.1.2
	textwrap-0.11.0
	thread_local-1.0.1
	time-0.1.44
	treeline-0.1.0
	unicode-width-0.1.8
	unicode-xid-0.2.1
	vec_map-0.8.2
	wait-timeout-0.2.0
	wasi-0.10.0+wasi-snapshot-preview1
	winapi-0.2.8
	winapi-0.3.9
	winapi-build-0.1.1
	winapi-i686-pc-windows-gnu-0.4.0
	winapi-util-0.1.5
	winapi-x86_64-pc-windows-gnu-0.4.0
"

inherit cargo bash-completion-r1

DESCRIPTION="A fast, accurate, ergonomic emerge.log parser"
HOMEPAGE="https://github.com/vincentdephily/emlop"
SRC_URI="$(cargo_crate_uris ${CRATES})"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86"
IUSE="bash-completion zsh-completion fish-completion"
RESTRICT="mirror"

DOCS=( "README.md" "CHANGELOG.md" )

src_install() {
	cargo_src_install
	einstalldocs
	if use bash-completion; then
		emlop complete bash > emlop
		dobashcomp emlop
	fi
	if use zsh-completion; then
		emlop complete zsh > _emlop
		insinto /usr/share/zsh/site-functions
		doins _emlop
	fi
	if use fish-completion; then
		emlop complete fish > emlop.fish
		insinto /usr/share/fish/vendor_completions.d
		doins emlop.fish
	fi
}
