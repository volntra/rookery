# Copyright 2026 Rockhopper Linux
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Rockhopper Linux base branding and defaults"
HOMEPAGE="https://github.com/volntra/rookery"
S="${WORKDIR}"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"

RDEPEND="app-misc/fastfetch"

src_install() {
	insinto /usr/share/rockhopper
	doins "${FILESDIR}"/os-release

	insinto /usr/share/rockhopper/fastfetch
	doins "${FILESDIR}"/logo.txt

	insinto /etc/xdg/fastfetch
	doins "${FILESDIR}"/config.jsonc

	insinto /etc/kernel/config.d
	newins "${FILESDIR}"/kernel.config 99-rockhopper.config
}

pkg_postinst() {
	cp "${EROOT}"/usr/share/rockhopper/os-release "${EROOT}"/etc/os-release || die
	elog "Welcome to Rockhopper Linux."
}
