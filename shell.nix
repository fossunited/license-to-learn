with import <nixpkgs> { };

pkgs.mkShell {
  name = "license-to-learn";

  nativeBuildInputs = [ pkgs.bashInteractive ];

  buildInputs = with pkgs; [
    # site generator
    zola
    # task runner (records the off-the-shelf CLI invocations; no logic to maintain)
    just
    # data: validate CSV against JSON Schema  +  pull sheets / convert docs
    qsv pandoc curl
    # linters / formatters
    taplo # TOML
    typos # spellcheck
    htmltest # built-site link / alt / anchor checker
    nodejs # runtime for the node linters below
    stylelint markdownlint-cli prettier treefmt
  ];

  shellHook = ''
    echo "license-to-learn dev shell — run 'just' to list tasks"
  '';
}
