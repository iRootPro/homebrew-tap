# typed: false
# frozen_string_literal: true

class Mmux < Formula
  desc "Keyboard-first TUI for Mattermost-compatible chat"
  homepage "https://github.com/iRootPro/mmux"
  version "0.1.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/iRootPro/mmux/releases/download/v0.1.1/mmux_v0.1.1_darwin_amd64.tar.gz"
      sha256 "9cdeef82e3400ff979bfc60d021026ed57663ade431d30e0855d9b3705952b17"

      define_method(:install) do
        install_binary
      end
    end

    if Hardware::CPU.arm?
      url "https://github.com/iRootPro/mmux/releases/download/v0.1.1/mmux_v0.1.1_darwin_arm64.tar.gz"
      sha256 "45349558c5977dd14543f6a494b7b35a1a85879b80f5b542ac6594bbd75b48d6"

      define_method(:install) do
        install_binary
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/iRootPro/mmux/releases/download/v0.1.1/mmux_v0.1.1_linux_amd64.tar.gz"
      sha256 "64be49fb697f7bc12d7267eaadc3a777b4ae1819d36109b6fba4ad93d4c21e72"

      define_method(:install) do
        install_binary
      end
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/iRootPro/mmux/releases/download/v0.1.1/mmux_v0.1.1_linux_arm64.tar.gz"
      sha256 "b900c2cc66d1992f14fbb30759b7fe94c46db9d3a0b5f6755be1e47ba7d083a7"

      define_method(:install) do
        install_binary
      end
    end
  end

  def install_binary
    binary = Dir["mmux*/mmux"].first || "mmux"
    bin.install binary => "mmux"
  end

  test do
    assert_match "mmux", shell_output("#{bin}/mmux --help")
  end
end
