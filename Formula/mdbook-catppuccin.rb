class MdbookCatppuccin < Formula
  desc "Soothing pastel theme for mdBook"
  homepage "https://github.com/catppuccin/mdBook"
  url "https://github.com/catppuccin/mdBook/archive/refs/tags/v2.1.0.tar.gz"
  sha256 "eb4a1024ecdaae490b994ae0cb88873ad6c11c0b94cd7b0cb73db77e7138d8af"
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
