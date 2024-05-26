class Whiskers < Formula
  desc "Soothing port creation tool for the high-spirited!"
  homepage "https://github.com/catppuccin/toolbox/tree/main/whiskers"
  url "https://github.com/catppuccin/toolbox/archive/refs/tags/whiskers-v2.2.0.tar.gz"
  sha256 "6a8c72649ea10160a558cb26eb166bedce5259eede29bffa849c817594ae8d6b"
  license "MIT"
  head "https://github.com/catppuccin/toolbox.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/catppuccin/tap"
    sha256 cellar: :any_skip_relocation, ventura:      "f25aeda80674468912b71815e189cebdf036a8c82ac96808ef620154db6abcce"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "fe2e679033be8d1daec01a062b367cf22d336a703107e2f4ec1e74e2418cf423"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "whiskers")
  end

  test do
    assert_predicate (bin/"whiskers"), :exist?
  end
end
