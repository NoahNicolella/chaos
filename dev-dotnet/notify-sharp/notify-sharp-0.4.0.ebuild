# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:
inherit eutils mono

DESCRIPTION="notify-sharp is a C# client implementation for Desktop Notifications"
HOMEPAGE="http://www.ndesk.org/NotifySharp"
SRC_URI="http://green.hivalley.com/data/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="alpha amd64 ~arm hppa ~ia64 ~mips ppc ppc64 sparc x86"

RDEPEND=""

DEPEND="${RDEPEND}
	dev-lang/mono
	dev-dotnet/ndesk-dbus"

src_compile() {
	
	cd ${S}
	./configure --prefix=/usr --sysconfdir=/etc || die
	make || die

}

src_install() {

	cd ${S}
	make DESTDIR=${D} install

}
