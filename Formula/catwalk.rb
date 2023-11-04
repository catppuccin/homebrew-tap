class Catwalk < Formula
  desc "A sweet program that takes in four showcase images and displays them all at once."
  homepage "https://github.com/catppuccin/toolbox/tree/main/catwalk"
  url "https://github.com/catppuccin/toolbox/archive/refs/tags/catwalk-v1.2.0.tar.gz"
  sha256 "79b8f28432a97d20c99d8e6015fcc7e459c05e5932a07e693cf05231e6e9be05"
  license "MIT"
  head "https://github.com/catppuccin/toolbox.git", branch: "main"

  depends_on "rust" => :build
  depends_on "pkg-config" => :build
  depends_on "webp" => :build

  on_macos do
    on_intel do
      url "https://github.com/catppuccin/toolbox/releases/download/catwalk-v1.2.0/catwalk-x86_64-apple-darwin"
      sha256 "d5d918a23424cef7c07f4e41408671d7f88bed3ba1f352b620ef7fcef4396983"

      def install
        bin.install "catwalk-x86_64-apple-darwin" => "catwalk"
        generate_completions_from_executable(bin/"catwalk", "completion")
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/catppuccin/toolbox/releases/download/catwalk-v1.2.0/catwalk-x86_64-unknown-linux-gnu"
      sha256 "413459bb5cd6bd937c49bf9a6c10ab164bd05b1a7c09c2a0c2dac9a841fb9b06"

      def install
        bin.install "catwalk-x86_64-unknown-linux-gnu" => "catwalk"
        generate_completions_from_executable(bin/"catwalk", "completion")
      end
    end
  end

  def install
    system "cargo", "install", *std_cargo_args(path: "catwalk")
    generate_completions_from_executable(bin/"catwalk", "completion")
  end

  test do
    assert_equal "catppuccin-catwalk 1.2.0", shell_output("#{bin}/catwalk --version").strip
  end
end
