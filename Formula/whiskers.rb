class Whiskers < Formula
  desc "Soothing port creation tool for the high-spirited!"
  homepage "https://github.com/catppuccin/whiskers"
  url "https://github.com/catppuccin/whiskers/archive/refs/tags/v2.4.0.tar.gz"
  sha256 "2316ec0ccd71f241147b32802247b33a9739cef191d8c3bfd53dbe7cbe6dccd7"
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
