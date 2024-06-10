class Catwalk < Formula
  desc "Soothing preview image generator for the high-spirited!"
  homepage "https://github.com/catppuccin/catwalk"
  url "https://github.com/catppuccin/catwalk/archive/refs/tags/v1.3.2.tar.gz"
  sha256 "3ca3ee11824d67f7e5f3ccaae0504af3273060f085bf284737e57b7140c1080c"
  license "MIT"
  head "https://github.com/catppuccin/catwalk.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/catppuccin/tap"
    sha256 cellar: :any_skip_relocation, ventura:      "9029cd1bcc0a2671ee04114e49920106fb80fb19f4c01f69c156c56ded5fe7c0"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "f2efe34b962812037c092f8df553a06860cbd1a02407ea6c5f0a0b94bcc42d75"
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
