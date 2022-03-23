{ lib
, fetchFromGitHub
, rustPlatform
}:

rustPlatform.buildRustPackage rec {
  pname = "reovim";
  version = "0.1";

  src = fetchFromGitHub {
    owner = "songww";
    repo = pname;
    rev = "v${version}";
    sha256 = "0pdcjzfi0fclbzmmf701fdizb95iw427vy3m1svy6gdn2zwj4ldr";
  };

  cargoSha256 = "1kfdgh8dra3jxgcdb0lln5wwrimz0dpp33bq3h7jgs8ngaq2a9wp";

  meta = with lib; {
    license = licenses.mit;
    homepage = "https://github.com/${owner}/${repo}";
    description = "Neovim GUI written in Rust, using relm4(gtk4-rs)";
    maintainer = with maintainers; [ ners ];
  };
}
