class MdbookCatppuccin < Formula
  desc "🎊 Soothing pastel theme for mdBook"
  homepage "https://github.com/catppuccin/mdBook"
  license "MIT"

  on_macos do
    url "https://github.com/catppuccin/mdBook/releases/download/v0.1.1/mdbook-catppuccin-x86_64-apple-darwin.tar.gz"
    sha256 "7a0a2d543fbaa815bdc522491af75b182d0c1be2855c1562a35baa1f9fe23713"
  end

  on_linux do
    url "https://github.com/catppuccin/mdBook/releases/download/v0.1.1/mdbook-catppuccin-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "9e6cd573de0afdb4838ab71a3d23db4cf29a3d51468cba60579819ed11c15c11"
  end

  def install
    bin.install "mdbook-catppuccin"
  end

  test do
    (testpath/"book.toml").write("")

    system bin/"mdbook-catppuccin", "install"

    assert_predicate (testpath/"theme/index.hbs"), :exist?
    assert_predicate (testpath/"theme/catppuccin.css"), :exist?
    assert_predicate (testpath/"theme/catppuccin-highlight.css"), :exist?
  end
end
