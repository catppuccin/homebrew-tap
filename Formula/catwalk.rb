class Catwalk < Formula
  desc "Soothing preview image generator for the high-spirited!"
  homepage "https://github.com/catppuccin/toolbox/tree/main/catwalk"
  url "https://github.com/catppuccin/toolbox/archive/refs/tags/catwalk-v1.3.1.tar.gz"
  sha256 "b9093e5f93aa94526675c03f921f8d94d1832640d281b0c3f96fa00c00015213"
  license "MIT"
  head "https://github.com/catppuccin/toolbox.git", branch: "main"

  livecheck do
    url :stable
    regex(/^catwalk[._-]v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://ghcr.io/v2/catppuccin/tap"
    sha256 cellar: :any_skip_relocation, ventura:      "20a88a941680a641a88bff0d6e5ebdde2d1f8d8efc7e4db0ae91ef70bb8388ee"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "a854dabeb866c6bb6a9d8220334a704267a93a46496a5ccfa06c3d82055c103f"
  end

  depends_on "pkg-config" => :build
  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "catwalk")
    generate_completions_from_executable(bin/"catwalk", "completion")
  end

  test do
    assert_predicate (bin/"catwalk"), :exist?
  end
end
