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
    homepage = "https://github.com/yonaskolb/XcodeGen";
    description = "A Swift command line tool for generating your Xcode project";
    longDescription = ''
      XcodeGen is a command line tool written in Swift that generates your Xcode project using your folder structure and a project spec.
    '';
    license = licenses.mit;
    platforms = platforms.darwin;
    maintainers = with maintainers; [ endle ];
  };
}
