# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Change package name org-mode -> org. For more information:
# https://orgmode.org/worg/dev/org-build-system.html#orga3184f7

EAPI=7

inherit elisp git-r3 readme.gentoo-r1

DESCRIPTION="Org mode is a fast and effective plain-text system."
HOMEPAGE="https://orgmode.org/"
EGIT_REPO_URI="https://code.orgmode.org/bzg/org-mode.git"
EGIT_CHECKOUT_DIR="${WORKDIR}/org"
S="${WORKDIR}/org"

LICENSE="GPL-3"
SLOT="0"
IUSE="contrib doc odt-schema"
KEYWORDS="~amd64"

DEPEND="
	doc? ( virtual/texi2dvi )
	dev-lang/perl
"
BDEPEND="${DEPEND}"
RDEPEND="${DEPEND}"

SITEFILE="99${PN}-gentoo.el"

src_compile(){
	emake datadir="${EPREFIX}${SITEETC}/${PN}"
	use doc && emake pdf card
}

src_install(){
	emake \
		DESTDIR="${D}" \
		ETCDIRS="styles $(use odt-schema && echo schema)" \
		lispdir="${EPREFIX}${SITELISP}/${PN}" \
		datadir="${EPREFIX}${SITEETC}/${PN}" \
		infodir="${EPREFIX}/usr/share/info" \
		install

	cp "${FILESDIR}/${SITEFILE}" "${T}/${SITEFILE}" || die

	if use contrib; then
		elisp-install ${PN}/contrib contrib/lisp/{org,ob,ox,ol,}*.el
		( docinto contrib; dodoc -r contrib/README contrib/scripts )
		find "${ED}/usr/share/doc/${PF}/contrib" -type f -name '.*' \
			 -exec rm -f '{}' '+'

		sed -i -e 's:\(.*@SITELISP@\)\(.*\):&\n\1/contrib\2:' \
			"${T}/${SITEFILE}" || die
	fi

	elisp-site-file-install "${T}/${SITEFILE}"
	dodoc README etc/ORG-NEWS
	use doc && dodoc doc/org.pdf doc/orgcard.pdf doc/orgguide.pdf

	DOC_CONTENTS="Org mode has a large variety of run-time dependencies,
				  so you may have to install one or more additional packages.
				  A non-exhaustive list of these dependencies may be found at
				  <http://orgmode.org/worg/org-dependencies.html>."

	readme.gentoo_create_doc
}
