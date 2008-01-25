
# Copyright 1999-2004 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils
inherit mono

BUILDDATE="20061222-0545"

DESCRIPTION="Simias SimpleServer"
HOMEPAGE="http://www.ifolder.com/"
SRC_URI="http://forgeftp.novell.com/ifolder/client/3.5/${BUILDDATE}/src/${P}.tar.gz"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~x86 ~ppc ~amd64"

DEPEND=">=dev-lang/mono-1.2.2.1
	>=dev-dotnet/xsp-1.2.1
	>=dev-dotnet/log4net-1.2.9
	>=dev-db/libflaim-4.9.617
	!dev-dotnet/ifolder-server"



simiasdatadir="${ROOT}var/lib/simias"

src_unpack() {
	unpack ${A} || die "Error unpacking ${PN}"
	cd ${S} || die "Error entering ${PN} source directory"
#	epatch ${FILESDIR}/webdir-prefix.patch
#	epatch ${FILESDIR}/SimiasSetup.cs.in.patch
#	epatch ${FILESDIR}/wildcard.patch
}

src_compile() {
	local myconf

#	sed -i -e "s|@_simiasdatadir_@|${simiasdatadir}|g" ${S}/other/SimpleServer/simpleserver.in || die "Error patching simpleserver.in"
	myconf="--sysconfdir=${ROOT}etc/simias --with-simiasdatadir=${simiasdatadir} --with-runasclient"
	econf ${myconf}
	emake

}

src_install() {
	make DESTDIR=${D} install
}
