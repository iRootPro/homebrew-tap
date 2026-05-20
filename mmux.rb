# typed: false
# frozen_string_literal: true

class Mmux < Formula
  desc "Keyboard-first TUI for Mattermost-compatible chat"
  homepage "https://github.com/iRootPro/mmux"
  version "0.1.12"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/iRootPro/mmux/releases/download/v0.1.12/mmux_v0.1.12_darwin_amd64.tar.gz"
      sha256 "3cf76493a5e0eb7479aa6b6f5aea5adf385372b523d2915f2c93a014be6c9f59"

      define_method(:install) do
        install_binary
      end
    end

    if Hardware::CPU.arm?
      url "https://github.com/iRootPro/mmux/releases/download/v0.1.12/mmux_v0.1.12_darwin_arm64.tar.gz"
      sha256 "28395bf7d302eeeb5ac42eddc7eb02ff4fd523d89873f474b948e60a189bfee5"

      define_method(:install) do
        install_binary
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/iRootPro/mmux/releases/download/v0.1.12/mmux_v0.1.12_linux_amd64.tar.gz"
      sha256 "83a0b1b895bc44f318aeb733b85bcd65df35e9cb60ac00d9544e9b7f669bef5b"

      define_method(:install) do
        install_binary
      end
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/iRootPro/mmux/releases/download/v0.1.12/mmux_v0.1.12_linux_arm64.tar.gz"
      sha256 "29c5f7bf6a2a7e3c57b8927f52eccdc57d36326e60b67c4831e6f49214118e0f"

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
