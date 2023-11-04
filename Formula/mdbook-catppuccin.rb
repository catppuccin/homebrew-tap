class MdbookCatppuccin < Formula
  desc "🎊 Soothing pastel theme for mdBook"
  homepage "https://github.com/catppuccin/mdBook"
  url "https://github.com/catppuccin/mdBook/archive/refs/tags/v2.0.1.tar.gz"
  sha256 "75062a0e4561d0b067c8b200ba4fc7eb66df59e15e568de08bcf800ab76c8781"
  license "MIT"
  head "https://github.com/catppuccin/mdbook.git", branch: "main"

  depends_on "rust" => :build

  on_macos do
    on_intel do
      url "https://github.com/catppuccin/mdBook/releases/download/v2.0.1/mdbook-catppuccin-x86_64-apple-darwin.tar.gz"
      sha256 "ce2c10b5bee597d5ce063796b410d8841b23c94f7c548a515e9bd22cc31c4a75"

      def install
        bin.install "mdbook-catppuccin-x86_64-apple-darwin" => "mdbook-catppuccin"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/catppuccin/mdBook/releases/download/v2.0.1/mdbook-catppuccin-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "38abdc0998402d975485757b2477dd9d5ad736f67706872988e890d0d641c6c9"

      def install
        bin.install "mdbook-catppuccin-x86_64-unknown-linux-gnu" => "mdbook-catppuccin"
      end
    end
  end

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    (testpath/"book.toml").write("")

    system bin/"mdbook-catppuccin", "install"

    assert_predicate (testpath/"theme/index.hbs"), :exist?
    assert_predicate (testpath/"theme/catppuccin.css"), :exist?
    assert_predicate (testpath/"theme/catppuccin-admonish.css"), :exist?
  end
end
