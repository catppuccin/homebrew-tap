class Catwalk < Formula
  desc "Sweet program that takes in four showcase images and displays them all at once"
  homepage "https://github.com/catppuccin/toolbox/tree/main/catwalk"
  url "https://github.com/catppuccin/toolbox/archive/refs/tags/catwalk-v1.2.0.tar.gz"
  sha256 "79b8f28432a97d20c99d8e6015fcc7e459c05e5932a07e693cf05231e6e9be05"
  license "MIT"
  head "https://github.com/catppuccin/toolbox.git", branch: "main"

  depends_on "pkg-config" => :build
  depends_on "rust" => :build
  depends_on "webp" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "catwalk")
    generate_completions_from_executable(bin/"catwalk", "completion")
  end

  test do
    assert_predicate (bin/"catwalk"), :exist?
  end
end
