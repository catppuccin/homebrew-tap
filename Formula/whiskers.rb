class Whiskers < Formula
  desc "Soothing port creation tool for the high-spirited!"
  homepage "https://github.com/catppuccin/toolbox/tree/main/whiskers"
  url "https://github.com/catppuccin/toolbox/archive/refs/tags/whiskers-v1.1.4.tar.gz"
  sha256 "dd4298874ac17e30736b90432d92ca56a6f22183782a5e96ea46520695088f16"
  license "MIT"
  head "https://github.com/catppuccin/toolbox.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/catppuccin/tap"
    sha256 cellar: :any_skip_relocation, ventura:      "90e22a07c91d887e8cad29f1592a319892a67b55d7062b72c108fa439db8411c"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "9ae003db7c21c2ce628f948b776f70f90dc7d3b89e7ab113a584d6d6bcc0f559"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "whiskers")
  end

  test do
    assert_predicate (bin/"whiskers"), :exist?
  end
end
