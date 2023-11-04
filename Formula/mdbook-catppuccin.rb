class MdbookCatppuccin < Formula
  desc "Soothing pastel theme for mdBook"
  homepage "https://github.com/catppuccin/mdBook"
  url "https://github.com/catppuccin/mdBook/archive/refs/tags/v2.0.1.tar.gz"
  sha256 "75062a0e4561d0b067c8b200ba4fc7eb66df59e15e568de08bcf800ab76c8781"
  license "MIT"
  head "https://github.com/catppuccin/mdbook.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/catppuccin/tap"
    sha256 cellar: :any_skip_relocation, ventura:      "d933396fd696d07d4ad59bf4fb3804e4c5c7d3c10e8e86b1f584de8dd0520650"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b8362ca2a94bbbd274e7bf4c2a60ff97b843f0a0fa4a1a11426907f884e66a26"
  end

  depends_on "rust" => :build

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
