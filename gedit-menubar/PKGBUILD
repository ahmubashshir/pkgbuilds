# Maintainer: Ahmad Hasan Mubashshir <ahmubashshir@gmail.com>
# from: gitlab gitlab.gnome.org
# what: GNOME/gedit
# match! alpha[0-9]*$

pkgname=gedit-menubar
pkgver=47.0
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
  libpeas
  pango
  python
  python-gobject
)
makedepends=(
	appstream-glib
	desktop-file-utils
	git
	gobject-introspection
	gtk-doc
	meson
	vala
	yelp-tools
)
optdepends=('gedit-plugins: Additional features')
conflicts=('gedit-code-assistance<=3.16.0+4+gd19b879-1' 'gedit')
provides=('gedit')
groups=(gnome-extra)

source=("git+https://gitlab.gnome.org/GNOME/gedit.git#tag=$pkgver"
        "git+https://gitlab.gnome.org/GNOME/libgd.git"
        "menubar.patch"
        "bottom-panel.patch")
sha256sums=('fe9f6e5acb3a6dff0c8d6ea150eb85b3923e05acb4ce10c4b3e65c04f049895a'
            'SKIP'
            '80692c1e39bc59f997f7d6857fc7b7d65a94aa53ff0f20de6e633a3596b20163'
            '139e3001397f1c716261dbefaefe92ce5165b4e1f4254a57d079234f85c46de3')

pkgver() {
  git -C gedit describe --tags | sed 's/-/+/g'
}

prepare() {
  cd gedit

  git submodule init
  git submodule set-url subprojects/libgd "$srcdir/libgd"
  git -c protocol.file.allow=always submodule update

  patch -p1 < "$srcdir/menubar.patch"
  patch -p1 < "$srcdir/bottom-panel.patch"
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
