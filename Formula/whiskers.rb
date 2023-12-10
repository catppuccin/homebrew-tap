class Whiskers < Formula
  desc "Soothing port creation tool for the high-spirited!"
  homepage "https://github.com/catppuccin/toolbox/tree/main/whiskers"
  url "https://github.com/catppuccin/toolbox/archive/refs/tags/whiskers-v1.1.4.tar.gz"
  sha256 "dd4298874ac17e30736b90432d92ca56a6f22183782a5e96ea46520695088f16"
  license "MIT"
  head "https://github.com/catppuccin/toolbox.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/catppuccin/tap"
    sha256 cellar: :any_skip_relocation, ventura:      "e2b5f93ecedc039e7992be20a3bd656b5ee2e24d654658f8c6aaff66b1c15aee"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "6f754f6742fcf5f918995be9237955cd56ae055a631cb195a3905cc4af215190"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "whiskers")
  end

  test do
    assert_predicate (bin/"whiskers"), :exist?
  end
end
