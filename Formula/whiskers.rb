class Whiskers < Formula
  desc "Soothing port creation tool for the high-spirited!"
  homepage "https://github.com/catppuccin/toolbox/tree/main/whiskers"
  url "https://github.com/catppuccin/toolbox/archive/refs/tags/whiskers-v2.0.1.tar.gz"
  sha256 "9b63415ac1b942b1bb651ce8a2994fbf862aef8eb26a00d042d1a96c05f3ebcf"
  license "MIT"
  head "https://github.com/catppuccin/toolbox.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/catppuccin/tap"
    sha256 cellar: :any_skip_relocation, ventura:      "ed639f3a78b251c0e62b32a621549e7518bcd0bc66287fe816b2bdb0c72ef2ed"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "93e421ed598f52df5c2cd57e9d77621dcea7fb77510292377683184bce2b0b86"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "whiskers")
  end

  test do
    assert_predicate (bin/"whiskers"), :exist?
  end
end
