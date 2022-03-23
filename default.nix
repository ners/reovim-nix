{ lib
, fetchFromGitHub
, rustPlatform
, pkg-config
, graphene
, gtk4
, libadwaita
}:

rustPlatform.buildRustPackage rec {
  pname = "reovim";
  version = "unstable-2022-03-05";

  src = fetchFromGitHub {
    owner = "songww";
    repo = pname;
    rev = "8ea5c097667e6b54874ad3ddb4559fa66af4d70d";
    sha256 = "sha256-TOZ1F3iTVhlrXcwUOIZbPdI23t3fOPUSfzXeD6JpS6g=";
  };

  cargoSha256 = "sha256-hHa9LoUd1oZwffrdUVpG0+5NOjIkIBR8k7jDAIoHca8=";

  nativeBuildInputs = [ pkg-config ];
  buildInputs = [ graphene gtk4 libadwaita ];

  meta = with lib; {
    license = licenses.mit;
    homepage = "https://github.com/${owner}/${repo}";
    description = "Neovim GUI written in Rust, using relm4(gtk4-rs)";
    maintainer = with maintainers; [ ners ];
  };
}
