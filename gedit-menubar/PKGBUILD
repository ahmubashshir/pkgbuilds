# Maintainer: Ahmad Hasan Mubashshir <ahmubashshir@gmail.com>
# from: gitlab gitlab.gnome.org
# what: GNOME/gedit
# match! alpha[0-9]*$

pkgname=gedit-menubar
pkgver=48.2
pkgrel=3
pkgdesc="GNOME Text Editor (Patched to show menubar)"
url="https://wiki.gnome.org/Apps/Gedit"
arch=(x86_64)
license=('GPL-2.0-or-later')
depends=(
  bash
  cairo
  dconf
  gcc-libs
  gdk-pixbuf2
  glib2
  glibc
  gobject-introspection-runtime
  gsettings-desktop-schemas
  gspell
  gtk3
  hicolor-icon-theme
  libgedit-amtk
  libgedit-gfls
  libgedit-gtksourceview
  libgedit-tepl
  libgirepository
  'libpeas>=1.38'
  pango
  python
  python-gobject
)
makedepends=(
	appstream
	appstream-glib
	desktop-file-utils
	git
	gobject-introspection
	gtk-doc
	meson
	vala
	yelp-tools
	glib2-devel
)
optdepends=('gedit-plugins: Additional features'
            'gedit-externaltools-plugin: External Tools support')
conflicts=('gedit-code-assistance<=3.16.0+4+gd19b879-1' 'gedit')
provides=('gedit')
groups=(gnome-extra)

source=("git+https://gitlab.gnome.org/GNOME/gedit.git#tag=$pkgver"
        "git+https://gitlab.gnome.org/GNOME/libgd.git"
        "menubar.patch"
        gedit-new-tab.patch
        gedit-prgname.patch
        gir2.patch
)
sha256sums=('5aec8e65b9e0e5bf0e99233a55080216ec80ba0502212ff96c651dea4631eb08'
            'SKIP'
            '80692c1e39bc59f997f7d6857fc7b7d65a94aa53ff0f20de6e633a3596b20163'
            'faadcf029fe7e6505314547ff53ab61b9e843be1f9f749ea08a1297baa77c13c'
            '774dbbf0023ec97b2c9c67c33ecf0c721b94519e86846efe013d671277048b08'
            '9446c65fc8b392c07575566e4c8943c3f3d23abd354ba240d7529ee65f95aa32')

pkgver() {
  git -C gedit describe --tags | sed 's/-/+/g'
}

prepare() {
  cd gedit

  git submodule init
  git submodule set-url subprojects/libgd "$srcdir/libgd"
  git -c protocol.file.allow=always submodule update
  git revert -n 8559f20790e67fe189477b2ea503425fa75c0411
  git revert -n ed13f96587f3516e16d562f6b4c2513dca3793af
  git revert -n ab7bb15d742a5cf647eea8e809e87217c2196b9d

  # Don't create new tab unless requested
  git apply -3 ../gedit-new-tab.patch

  # Set prgname to application ID
  git apply -3 ../gedit-prgname.patch

  patch -p1 < "$srcdir/menubar.patch"
  patch -p1 < "$srcdir/gir2.patch"
}

build() {
  arch-meson gedit build \
    -D gtk_doc=true \
    -D require_all_tests=true
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
