class Whiskers < Formula
  desc "Soothing port creation tool for the high-spirited!"
  homepage "https://github.com/catppuccin/whiskers"
  url "https://github.com/catppuccin/whiskers/archive/refs/tags/v2.5.1.tar.gz"
  sha256 "519246f1d6d18836a71ae422fab6f64b9401e26310c4da383e00dc636c5acfb7"
  license "MIT"
  head "https://github.com/catppuccin/whiskers.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/catppuccin/tap"
    sha256 cellar: :any_skip_relocation, ventura:      "8fd0a905e600f88c308783a922a01dd44ec4c20a929ffe765b752f2f066c6dde"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "fbacf84ffda1a336e8467577e1d894e95b0a2dcb02de515e2fd057ddffcdc34c"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_predicate (bin/"whiskers"), :exist?
  end
end
