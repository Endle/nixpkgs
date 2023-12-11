{ lib
, stdenv
, fetchFromGitHub
, swift
, swiftpm
, swiftpm2nix
, swiftPackages
, Foundation
, XCTest
}:

stdenv.mkDerivation rec {
  pname = "xcodegen";
  version = "2.38.0";

  src = fetchFromGitHub {
    owner = "yonaskolb";
    repo = "XcodeGen";
    rev = "${version}";
    sha256 = "sha256-5N0ZNQec1DUV4rWqqOC1Aikn+RKrG8it0Ee05HG2mn4=";
  };


  # nativeBuildInputs = [ autoreconfHook pkg-config wrapGAppsHook ];

  buildInputs = [
    swift
    swiftpm
    XCTest
    Foundation
  ];


  meta = with lib; {
    homepage = "https://filezilla-project.org/";
    description = "Graphical FTP, FTPS and SFTP client";
    longDescription = ''
      FileZilla Client is a free, open source FTP client. It supports
      FTP, SFTP, and FTPS (FTP over SSL/TLS). The client is available
      under many platforms, binaries for Windows, Linux and macOS are
      provided.
    '';
    license = licenses.gpl2;
    platforms = platforms.darwin;
    maintainers = with maintainers; [ pSub ];
  };
}
