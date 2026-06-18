# Maintainer: Mubashshir <ahmubashshir@gmail.com>
pkgname=jelling
pkgver=r19.3661895
pkgrel=2
pkgdesc='A FreeOTP token receiver for Linux.'
arch=(x86_64)
url='https://github.com/freeotp/jelling-linux'
license=(Apache-2.0)
depends=(bluez systemd-libs)
makedepends=(git meson bluez-libs)
source=(
	"$pkgname::git+$url.git#branch=master"
	"sd-eventloop.patch::https://github.com/freeotp/jelling-linux/pull/7.patch"
)
sha256sums=('SKIP'
            '7fc54ec7c469831fc845e81ca908540994085b0dfac978521a867efd008b2a40')

pkgver() {
	(
		cd "$pkgname"
		set -o pipefail
		git describe --tags --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

prepare()
{
	git -C "$pkgname" apply -3 < sd-eventloop.patch
}

build() {
	arch-meson "$pkgname" build
	ninja -C build
}

package() {
	meson install -C build --destdir "${pkgdir}"
}
