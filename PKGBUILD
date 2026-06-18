# Maintainer: Ahmad Hasan Mubashshir <ahmubashshir@gmail.com>
# from: github
# what: pymumu/smartdns
# prefix! Release

pkgname=smartdns-plugin-ui
pkgver=48.1
pkgrel=1
pkgdesc="Dashboard UI plugin for smartdns"
arch=('x86_64')
license=('GPL')
url="https://github.com/pymumu/smartdns"
depends=("smartdns=$pkgver" 'smartdns-webui')
makedepends=('git' 'rust' 'rust-bindgen')
source=("git+https://github.com/pymumu/smartdns.git#tag=Release$pkgver")
sha512sums=('7ea081ec87ca5da876f712238d4c5f27017d91ae12667621eb560fe2526578ac31e46c8385dff6dedfd314c35b4f29e073811bcc39995e67e9e3e4d7f634a31d')

build() {
  cd smartdns
  make -C plugin/smartdns-ui RUNSTATEDIR=/run SBINDIR=/usr/bin
}

package() {
  cd smartdns
  make -C plugin/smartdns-ui RUNSTATEDIR=/run SBINDIR=/usr/bin DESTDIR="$pkgdir" install
}
