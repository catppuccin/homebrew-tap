class Catwalk < Formula
  desc "Soothing preview image generator for the high-spirited!"
  homepage "https://github.com/catppuccin/catwalk"
  url "https://github.com/catppuccin/catwalk/archive/refs/tags/v1.3.2.tar.gz"
  sha256 "3ca3ee11824d67f7e5f3ccaae0504af3273060f085bf284737e57b7140c1080c"
  license "MIT"
  head "https://github.com/catppuccin/catwalk.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/catppuccin/tap"
    sha256 cellar: :any_skip_relocation, ventura:      "360dbeac75682cc14b6cca257d94b3a5d795fd1ae49f5a69c4363273761eb694"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "743173b145c594325f3fcd453624b3ab2c030578f42d3cc23842f338a54cff44"
  end

  depends_on "pkg-config" => :build
  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
    generate_completions_from_executable(bin/"catwalk", "completion")
  end

  test do
    assert_predicate (bin/"catwalk"), :exist?
  end
end
