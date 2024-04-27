class Whiskers < Formula
  desc "Soothing port creation tool for the high-spirited!"
  homepage "https://github.com/catppuccin/toolbox/tree/main/whiskers"
  url "https://github.com/catppuccin/toolbox/archive/refs/tags/whiskers-v2.1.0.tar.gz"
  sha256 "5a3da3f7453ffc8929b6c5f6a3e925fa7bec0eb072e6b3ddaf1dcc511c464ae9"
  license "MIT"
  head "https://github.com/catppuccin/toolbox.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/catppuccin/tap"
    sha256 cellar: :any_skip_relocation, ventura:      "38689863c9e33523c000a225b85e5b5949569944074938e15c737698624a1735"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "3a924ba919d8e5f49faf3225e225df8d4dc10515a45ed3a391fcb0e4edc70b66"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "whiskers")
  end

  test do
    assert_predicate (bin/"whiskers"), :exist?
  end
end
