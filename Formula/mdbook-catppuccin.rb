class MdbookCatppuccin < Formula
  desc "Soothing pastel theme for mdBook"
  homepage "https://github.com/catppuccin/mdBook"
  url "https://github.com/catppuccin/mdBook/archive/refs/tags/v2.2.0.tar.gz"
  sha256 "74f46c619371e8898bec4b0d7b3765f6fd9a91e14fcc2f4ef2f718bb08f10f47"
  license "MIT"
  head "https://github.com/catppuccin/mdbook.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/catppuccin/tap"
    sha256 cellar: :any_skip_relocation, ventura:      "4ffdd7760c56a96922306d6b21fe95cb4debdc212648b44de4d343696f447a76"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "a8cd6642b1b46340e853e7597a6b205893fcc7c50d26b26366df11480f995606"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
    generate_completions_from_executable(bin/"mdbook-catppuccin", "completion")
  end

  test do
    (testpath/"book.toml").write("")

    system bin/"mdbook-catppuccin", "install"

    assert_predicate (testpath/"theme/index.hbs"), :exist?
    assert_predicate (testpath/"theme/catppuccin.css"), :exist?
    assert_predicate (testpath/"theme/catppuccin-admonish.css"), :exist?
  end
end
