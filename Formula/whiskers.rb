class Whiskers < Formula
  desc "Soothing port creation tool for the high-spirited!"
  homepage "https://github.com/catppuccin/whiskers"
  url "https://github.com/catppuccin/whiskers/archive/refs/tags/v2.5.0.tar.gz"
  sha256 "0e620f26e8a291e2cdfae73f1e78d30b9f05f7561c2167ce17c42f41afdb47f4"
  license "MIT"
  head "https://github.com/catppuccin/whiskers.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/catppuccin/tap"
    sha256 cellar: :any_skip_relocation, ventura:      "3051b34cb17cd94efa72b6df7f800920ea0fb95477fd79d3bc82caefe9d69b6c"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b7b00e525adfe68bb60fd4fcd60c97796e583f15985a1289c40a213fd15c5c73"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_predicate (bin/"whiskers"), :exist?
  end
end
