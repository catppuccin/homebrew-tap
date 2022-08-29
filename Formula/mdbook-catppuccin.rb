class MdbookCatppuccin < Formula
  desc "🎊 Soothing pastel theme for mdBook"
  homepage "https://github.com/catppuccin/mdBook"
  # url "https://github.com/catppuccin/mdBook/archive/refs/tags/v0.1.1.tar.gz"
  # sha256 "3ca0e75569d8123fcf14f60614f014a13462bfc16446df82bea0dc999b08137d"
  license "MIT"

  on_macos do
    url "https://github.com/catppuccin/mdBook/releases/download/v0.1.1/mdbook-catppuccin-x86_64-apple-darwin.tar.gz"
    sha256 "7a0a2d543fbaa815bdc522491af75b182d0c1be2855c1562a35baa1f9fe23713"
  end

  on_linux do
    url "https://github.com/catppuccin/mdBook/releases/download/v0.1.1/mdbook-catppuccin-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "9e6cd573de0afdb4838ab71a3d23db4cf29a3d51468cba60579819ed11c15c11"
  end

  # bottle do
  #   root_url "https://github.com/catppuccin/homebrew-tap/releases/download"
  #   sha256 cellar: :any_skip_relocation, big_sur:        "7a0a2d543fbaa815bdc522491af75b182d0c1be2855c1562a35baa1f9fe23713"
  #   sha256 cellar: :any_skip_relocation, x86_64_linux:   "9e6cd573de0afdb4838ab71a3d23db4cf29a3d51468cba60579819ed11c15c11"
  # end

  # depends_on "rust" => :build

  # def install
  #   system "cargo", "install", *std_cargo_args
  # end

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
