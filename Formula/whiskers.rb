class Whiskers < Formula
  desc "Soothing port creation tool for the high-spirited!"
  homepage "https://github.com/catppuccin/toolbox/tree/main/whiskers"
  url "https://github.com/catppuccin/toolbox/archive/refs/tags/whiskers-v2.3.0.tar.gz"
  sha256 "aba0e5c17cb6853f25a303480da82e2c2b50fbab1be50d4620e82ecfaa1f183e"
  license "MIT"
  head "https://github.com/catppuccin/toolbox.git", branch: "main"

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

  livecheck do
    url :stable
    regex /^whiskers[._-]v?(\d+(?:\.\d+)+)$/i
  end
end
