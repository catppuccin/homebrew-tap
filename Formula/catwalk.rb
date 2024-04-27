class Catwalk < Formula
  desc "Soothing preview image generator for the high-spirited!"
  homepage "https://github.com/catppuccin/toolbox/tree/main/catwalk"
  url "https://github.com/catppuccin/toolbox/archive/refs/tags/catwalk-v1.3.0.tar.gz"
  sha256 "e660ff504641d0eec9a69c2945970cfd121de9c7e6dd769c6ba3a72fed76700a"
  license "MIT"
  head "https://github.com/catppuccin/toolbox.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/catppuccin/tap"
    rebuild 1
    sha256 cellar: :any_skip_relocation, ventura:      "b89617924c9c54c41dca6cfaf7b92c0ffb8a7e6400742ad1c09927baf8402640"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "986591d5f6a6ce057fe385bb2e2a78d58298121b99aa7554739fc052d5ef300f"
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
