pkgname=smartdns-plugin-ui
pkgver=47.1
pkgrel=1
pkgdesc="Dashboard UI plugin for smartdns"
arch=('x86_64')
license=('GPL')
url="https://github.com/pymumu/smartdns"
depends=("smartdns=$pkgver")
makedepends=('git' 'rust' 'rust-bindgen')
source=("git+https://github.com/pymumu/smartdns.git#tag=Release$pkgver")
sha512sums=('aef917257bf3cf3d2b9f93d6eaa72d460fc1b149ee0bf114c1e3651401c6bca67de5a255c3b2010a7f9517b60051c21368369ef72d0132e0635e2f4747e08574')

build() {
  cd smartdns
  make -C plugin/smartdns-ui RUNSTATEDIR=/run SBINDIR=/usr/bin
}

package() {
  cd smartdns
  make -C plugin/smartdns-ui RUNSTATEDIR=/run SBINDIR=/usr/bin DESTDIR="$pkgdir" install
}
