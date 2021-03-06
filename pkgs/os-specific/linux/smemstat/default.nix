{ stdenv, lib, fetchurl, ncurses }:

stdenv.mkDerivation rec {
  pname = "smemstat";
  version = "0.02.07";
  src = fetchurl {
    url = "https://kernel.ubuntu.com/~cking/tarballs/smemstat/smemstat-${version}.tar.xz";
    sha256 = "09i5n1zjw45qrfbc2vglh1xk1jwqnc91bgsq7bkp29d9dpfpzhdc";
  };
  buildInputs = [ ncurses ];
  installFlags = [ "DESTDIR=$(out)" ];
  postInstall = ''
    mv $out/usr/* $out
    rm -r $out/usr
  '';
  meta = with lib; {
    description = "Memory usage monitoring tool";
    homepage = "https://kernel.ubuntu.com/~cking/smemstat/";
    license = licenses.gpl2;
    platforms = platforms.linux;
    maintainers = with maintainers; [ womfoo ];
  };
}
