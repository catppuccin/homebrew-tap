class Whiskers < Formula
  desc "A sweet program that takes in four showcase images and displays them all at once."
  homepage "https://github.com/catppuccin/toolbox/tree/main/whiskers"
  url "https://github.com/catppuccin/toolbox/archive/refs/tags/whiskers-v1.1.1.tar.gz"
  sha256 "baae7de466b48a808f25ef87f7dc94765c67ddda656d4b2813a19012580b00af"
  license "MIT"
  head "https://github.com/catppuccin/toolbox.git", branch: "main"

  depends_on "rust" => :build

  on_macos do
    on_intel do
      url "https://github.com/catppuccin/toolbox/releases/download/whiskers-v1.1.1/whiskers-x86_64-apple-darwin"
      sha256 "f29d9c165d8bc7d5ae4fecd6bbd534c93d4155bf941b0c8624813b0e75e4fcde"

      def install
        bin.install "whiskers-x86_64-apple-darwin" => "whiskers"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/catppuccin/toolbox/releases/download/whiskers-v1.1.1/whiskers-x86_64-unknown-linux-gnu"
      sha256 "2940e5707bec2da0384d713bfb62bf905be3c891c502a3037554073d6f9e0e99"

      def install
        bin.install "whiskers-x86_64-unknown-linux-gnu" => "whiskers"
      end
    end
  end

  def install
    system "cargo", "install", *std_cargo_args(path: "whiskers")
  end

  test do
    assert_equal "catppuccin-whiskers 1.1.1", shell_output("#{bin}/whiskers --version").strip
  end
end
