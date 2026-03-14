# Maintainer: Mubashshir <ahmubashshir@gmail.com>
pkgname=jelling
pkgver=r19.3661895
pkgrel=1
pkgdesc='A FreeOTP token receiver for Linux.'
arch=(x86_64)
url='https://github.com/freeotp/jelling-linux'
license=(Apache-2.0)
depends=(bluez systemd-libs)
makedepends=(git meson)
source=(
	"$pkgname::git+$url.git#branch=master"
	"sd-eventloop.patch::https://github.com/freeotp/jelling-linux/pull/7.patch"
)
sha256sums=('SKIP'
            '86da4758f75cb5101464f9b3f5f8742dd9fb6eb7075dcd4f199d11cd2c487a90')

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
