class MdbookCatppuccin < Formula
  desc "Soothing pastel theme for mdBook"
  homepage "https://github.com/catppuccin/mdBook"
  url "https://github.com/catppuccin/mdBook/archive/refs/tags/v3.1.0.tar.gz"
  sha256 "43fa49aa77bc1746d95cebcae6eb5f22293915db93572f0e3ff2e012d4c8f220"
  license "MIT"
  head "https://github.com/catppuccin/mdbook.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/catppuccin/tap"
    sha256 cellar: :any_skip_relocation, ventura:      "e672ee25ba2c77557365cf5f0333770920c33b889f6757253a829c5fa6df1d96"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "7d80ab83980e796d5640c77ab7390d7586cdbf2ff5553179fb3218530440a671"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end
end
