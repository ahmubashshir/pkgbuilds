# Maintainer  : Mubashshir <ahmubashshir@gmail.com>
# Contributor : Tom Gundersen <teg@jklm.no>
# Contributor : Ionut Biru <ibiru@archlinux.org>
# Contributor : Thomas Weißschuh <thomas t-8ch de>
# Contributor : Florian Pritz <bluewind@xinu.at>
# from: github
# what: transmission/transmission
# match! -beta\.?[0-9]+$

pkgname=transmission-gtk3
pkgver=4.0.6
pkgrel=3
arch=(x86_64)
url="http://www.transmissionbt.com/"
pkgdesc='Fast, easy, and free BitTorrent client (GTK+ GUI)'
license=(GPL)
provides=('transmission-gtk')
conflicts=('transmission-gtk')
depends=(curl libevent gtk3 hicolor-icon-theme libb64 miniupnpc libnatpmp libdeflate gtkmm3)
optdepends=('libnotify: Desktop notification support'
            'transmission-cli: daemon and web support')

makedepends=(
  cmake
  curl
  dht
  glibmm-2.68
  gtk3
  gtkmm3
  intltool
  libb64
  libdeflate
  libevent
  libnatpmp
  miniupnpc
  ninja
)
source=("https://github.com/transmission/transmission/releases/download/$pkgver/transmission-$pkgver.tar.xz")
source+=("miniupnpc.patch::https://gitlab.archlinux.org/archlinux/packaging/packages/transmission/-/raw/main/febfe49c.patch")
sha256sums=('2a38fe6d8a23991680b691c277a335f8875bdeca2b97c6b26b598bc9c7b0c45f'
            '1e5917c79a0c17595f18b544c5c1ab101ecbef5b2ffb0ca42a0a3b221a85e044')

prepare() {
  cd "${pkgname%-*}-$pkgver"
  patch -p1 < ../miniupnpc.patch # Fix build with miniupnpc 2.2.8
}

build() {
  export CFLAGS+=" -ffat-lto-objects -Wno-all"
  cmake -G Ninja -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_{CLI,DAEMON,MAC,QT,UTILS}=OFF \
    -DINSTALL_{WEB,LIB}=OFF \
    -DUSE_SYSTEM_UTP=OFF \
    -DENABLE_{GTK,TESTS,UTP}=ON \
    -DUSE_GTK_VERSION=3 \
    -DUSE_SYSTEM_{B64,DEFLATE,DHT,EVENT2,MINIUPNPC,NATPMP,PSL}=ON \
    -DWITH_CRYPTO=openssl \
    -S "${pkgname%-gtk3}-$pkgver" -B build

  cmake --build build --config Release
}

check() {
  cd build
  ctest --output-on-failure -j "$(nproc)" -E "DhtTest\\.usesBootstrapFile"
}

package() {
  for comp in gtk po
  do DESTDIR="$pkgdir" ninja -C build "$comp/install"
  done

  install -Dm644 "${pkgname%-gtk3}-$pkgver/COPYING" "$pkgdir/usr/share/licenses/transmission-gtk/COPYING"
}

# vim:  ft=sh:ts=2:et
