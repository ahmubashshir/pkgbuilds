pkgname=smartdns-plugin-ui
pkgver=48
pkgrel=1
pkgdesc="Dashboard UI plugin for smartdns"
arch=('x86_64')
license=('GPL')
url="https://github.com/pymumu/smartdns"
depends=("smartdns=$pkgver" 'smartdns-webui')
makedepends=('git' 'rust' 'rust-bindgen')
source=("git+https://github.com/pymumu/smartdns.git#tag=Release$pkgver")
sha512sums=('b3d1b882d40b9c2098627e3461ab577e8ee0ebfddf36de8a16c70ada66ff356cb5cfeb21f35a146554f7a48b534f15f7394a5f71047caac38ee17b4e96c77056')

build() {
  cd smartdns
  make -C plugin/smartdns-ui RUNSTATEDIR=/run SBINDIR=/usr/bin
}

package() {
  cd smartdns
  make -C plugin/smartdns-ui RUNSTATEDIR=/run SBINDIR=/usr/bin DESTDIR="$pkgdir" install
}
