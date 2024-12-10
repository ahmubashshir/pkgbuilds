# Maintainer: Ahmad Hasan Mubashshir <ahmubashshir@gmail.com>
# from: gitlab gitlab.gnome.org
# what: GNOME/gedit
# match! alpha[0-9]*$

pkgname=gedit-menubar
pkgver=48.1
pkgrel=1
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
  libpeas
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
        "menubar.patch")
sha256sums=('517f3afbaaf60db0b7376c17aff0da43de1161b267330c4864d74e5ad38bf8a0'
            'SKIP'
            '80692c1e39bc59f997f7d6857fc7b7d65a94aa53ff0f20de6e633a3596b20163')

pkgver() {
  git -C gedit describe --tags | sed 's/-/+/g'
}

prepare() {
  cd gedit

  git submodule init
  git submodule set-url subprojects/libgd "$srcdir/libgd"
  git -c protocol.file.allow=always submodule update

  patch -p1 < "$srcdir/menubar.patch"
}

build() {
  local meson_options=(
    -D gtk_doc=true
    -D require_all_tests=true
  )

  arch-meson gedit build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
