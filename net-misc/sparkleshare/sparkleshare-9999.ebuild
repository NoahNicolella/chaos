# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
PYTHON_DEPEND="2"

WANT_AUTOMAKE="1.11"

inherit base eutils mono python


if [[ ${PV} == "9999" ]] ; then
	EGIT_REPO_URI="git://github.com/hbons/SparkleShare.git"
	EGIT_BOOTSTRAP="autogen.sh"
	inherit git
fi

DESCRIPTION="SparkleShare is a file sharing and collaboration tool inspired by Dropbox"
HOMEPAGE="http://www.sparkleshare.org"
SRC_URI=""

LICENSE="GPL-3"
KEYWORDS="-*"
SLOT="0"
IUSE="nautilus"

#MY_PV="${PV/_beta/-beta}"
#MY_P="${PN}-${MY_PV}"

#SRC_URI="http://www.sparkleshare.org/${MY_P}.tar.gz"

DEPEND=">=dev-lang/mono-2.2
		>=dev-dotnet/gtk-sharp-2.12.7
		>=dev-dotnet/ndesk-dbus-0.6
		>=dev-dotnet/ndesk-dbus-glib-0.4.1
		>=dev-dotnet/webkit-sharp-0.3
		nautilus? ( dev-python/nautilus-python )"
RDEPEND="${DEPEND}
		 >=dev-vcs/git-1.7
		 net-misc/openssh
		 >=gnome-base/gvfs-1.3
		 dev-util/intltool
		 x11-misc/xdg-utils"

src_configure() {
	ewarn "fix configure to properly enable/disable the nautilus extension"
	ewarn "also documentation"
	base_src_configure $(use_enable nautilus nautilus-extension)
}

src_compile() {
	emake || die "make failed"
}

pkg_postinst() {
	python_mod_optimize /usr/share/nautilus-python/extensions/
}

pkg_postrm() {
	python_mod_cleanup /usr/share/nautilus-python/extensions/
}
