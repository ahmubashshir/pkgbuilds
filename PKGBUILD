# Maintainer: EP <epcollabs at outlook dot com>

pkgname=crqt-ng-git
pkgver=1.0.15.r22.41e0367
pkgrel=1
pkgdesc='Cross-platform open source e-book reader using crengine-ng and Qt (CoolReader fork)'
arch=(x86_64)
url=https://gitlab.com/coolreader-ng/crqt-ng
license=(GPL)
depends=(crengine-ng-git qt6-base qt6-declarative)
makedepends=(git cmake qt6-tools)
provides=(crqt-ng)
conflicts=(crqt-ng)
source=("git+${url}.git")
sha256sums=(SKIP)

pkgver() {
    cd "${srcdir}/crqt-ng"
    git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
    cmake -B build -S crqt-ng -Wno-dev \
        -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DCMAKE_BUILD_TYPE=Release
    make -C build
}

package() {
    make -C build DESTDIR="$pkgdir/" install
}
