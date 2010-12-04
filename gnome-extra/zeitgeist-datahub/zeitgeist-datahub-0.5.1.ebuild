# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit versionator eutils

DESCRIPTION="Primary data extension for Zeitgeist in GNOME"
HOMEPAGE="https://launchpad.net/zeitgeist-datahub"
SRC_URI="http://launchpad.net/${PN}/$(get_version_component_range 1-2)/${PV}/+download/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="vala"

DEPEND="x11-libs/gtk+
	gnome-extra/zeitgeist"
RDEPEND="${DEPEND}"

src_configure() {
	if use vala;then
		VALAC=/usr/bin/valac-0.10 econf
	else
		econf
	fi
}

src_install() {
	emake install DESTDIR="${D}" || die "Failed to install"
}
