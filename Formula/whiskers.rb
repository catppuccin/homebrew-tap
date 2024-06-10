class Whiskers < Formula
  desc "Soothing port creation tool for the high-spirited!"
  homepage "https://github.com/catppuccin/whiskers"
  url "https://github.com/catppuccin/whiskers/archive/refs/tags/v2.3.0.tar.gz"
  sha256 "4ce03d8cbb7135c0a34c834c4cfa2995af3a266f63d55fd7eb1146a022ed2244"
  license "MIT"
  head "https://github.com/catppuccin/whiskers.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/catppuccin/tap"
    sha256 cellar: :any_skip_relocation, ventura:      "4a2a601b29006a787bf46a5e3e7b1d1616f0dfbf62870ce1cd96830376d70340"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "2305de4dad05d5e50a7a6141b72e55ee59d220ba61cae3805904d1b5eafb6251"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "whiskers")
  end

  test do
    assert_predicate (bin/"whiskers"), :exist?
  end
end
