# Maintainer: Mubashshir <ahmubashshir@gmail.com>
pkgname=libgvo
pkgver=2.0.0.2
pkgrel=2
pkgdesc='Serialization to/from Variant/Json for GObject classes.'
arch=(i686 x86_64)
url='https://gitlab.gnome.org/esodan/libgvo'
license=(LGPL3)
depends=(libgee json-glib)
makedepends=(git meson vala)
source=("git+https://gitlab.gnome.org/esodan/libgvo.git#tag=$pkgver")
sha256sums=('16e17623d14b83dd1f1b0c858a330389b01af5a4861e1d523b710929e9c6df36')

pkgver() {
  git -C "$pkgname" describe --tags  | sed 's/_/./g;s/-/+/g'
}

build() {
  arch-meson "$pkgname" build \
             -Dsubprojects=false \

  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
}
