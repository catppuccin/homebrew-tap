class Whiskers < Formula
  desc "Soothing port creation tool for the high-spirited!"
  homepage "https://github.com/catppuccin/whiskers"
  url "https://github.com/catppuccin/whiskers/archive/refs/tags/v2.5.1.tar.gz"
  sha256 "519246f1d6d18836a71ae422fab6f64b9401e26310c4da383e00dc636c5acfb7"
  license "MIT"
  head "https://github.com/catppuccin/whiskers.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/catppuccin/tap"
    sha256 cellar: :any_skip_relocation, ventura:      "094ec9d9c0ddf02e52c9db42146cd1b39e338d1cf851c71d570c9030cc9075f4"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "99b2d548265bb026cea6d56cf35cdac6f84a6d0b0b345f34a24bfdd911cfa02a"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_predicate (bin/"whiskers"), :exist?
  end
end
