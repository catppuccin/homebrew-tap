class MdbookCatppuccin < Formula
  desc "🎊 Soothing pastel theme for mdBook"
  homepage "https://github.com/catppuccin/mdBook"
  url "https://github.com/catppuccin/mdBook/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "3ca0e75569d8123fcf14f60614f014a13462bfc16446df82bea0dc999b08137d"
  license "MIT"

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
