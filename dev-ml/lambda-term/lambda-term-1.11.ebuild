# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="A cross-platform library for manipulating the terminal"
HOMEPAGE="https://github.com/diml/lambda-term"
SRC_URI="https://github.com/diml/lambda-term/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
	dev-lang/ocaml:=
	dev-ml/lwt_react:=
	>=dev-ml/lwt-2.4.0:=
	>=dev-ml/zed-1.2:=
	>=dev-ml/react-1.2:=
"
RDEPEND="${DEPEND}"
DEPEND="${DEPEND}
	dev-ml/jbuilder
	dev-ml/opam
"

PATCHES=( "${FILESDIR}/lwtreact.patch" )

src_install() {
	opam-installer -i \
		--prefix="${ED}/usr" \
		--libdir="${D}/$(ocamlc -where)" \
		--mandir="${ED}/usr/share/man" \
		--docdir="${ED}/usr/share/doc/${PF}" \
		${PN}.install || die
}
