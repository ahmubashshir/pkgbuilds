# Maintainer: Ahmad Hasan Mubashshir <ahmubashshir@gmail.com>
# from: github
# what: pymumu/smartdns
# prefix! Release

pkgname=smartdns-plugin-ui
pkgver=48.2
pkgrel=1
pkgdesc="Dashboard UI plugin for smartdns"
arch=('x86_64')
license=('GPL')
url="https://github.com/pymumu/smartdns"
depends=("smartdns=$pkgver" 'smartdns-webui')
makedepends=('git' 'rust' 'rust-bindgen')
source=("git+https://github.com/pymumu/smartdns.git#tag=Release$pkgver")
sha512sums=('f488b4ba40d348d3f79b25d092ef1a987cf9d58bf796c22a352fc896fc61f270abdd14e324da5a83abb0f3052982c93004e828a3f86aa0a24ccb1fcf6f39af4f')

build() {
  cd smartdns
  make -C plugin/smartdns-ui RUNSTATEDIR=/run SBINDIR=/usr/bin
}

package() {
  cd smartdns
  make -C plugin/smartdns-ui RUNSTATEDIR=/run SBINDIR=/usr/bin DESTDIR="$pkgdir" install
}
