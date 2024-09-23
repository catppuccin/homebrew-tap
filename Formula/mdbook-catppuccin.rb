class MdbookCatppuccin < Formula
  desc "Soothing pastel theme for mdBook"
  homepage "https://github.com/catppuccin/mdBook"
  url "https://github.com/catppuccin/mdBook/archive/refs/tags/v2.2.0.tar.gz"
  sha256 "74f46c619371e8898bec4b0d7b3765f6fd9a91e14fcc2f4ef2f718bb08f10f47"
  license "MIT"
  head "https://github.com/catppuccin/mdbook.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/catppuccin/tap"
    sha256 cellar: :any_skip_relocation, ventura:      "42dd5c85c3f1371f967b76c411b5838cfd01097b4cf66c0b6e8dbadf57461721"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "8ecec05eaecb58657cb80195ecafce93522bc958bb819b4356f07c66f0f1edad"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end
end
