class Whiskers < Formula
  desc "Soothing port creation tool for the high-spirited!"
  homepage "https://github.com/catppuccin/toolbox/tree/main/whiskers"
  url "https://github.com/catppuccin/toolbox/archive/refs/tags/whiskers-v2.2.0.tar.gz"
  sha256 "6a8c72649ea10160a558cb26eb166bedce5259eede29bffa849c817594ae8d6b"
  license "MIT"
  head "https://github.com/catppuccin/toolbox.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/catppuccin/tap"
    sha256 cellar: :any_skip_relocation, ventura:      "42df248ec9bef26840e0375e4f96848623c5f9bff5a2ba46fd1b3bf8da9279f2"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "fa0afae6a67ca87152c3b11e19ec0154c350c6b7e57c61de2f1b0400fc047a48"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "whiskers")
  end

  test do
    assert_predicate (bin/"whiskers"), :exist?
  end
end
