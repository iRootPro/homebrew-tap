# typed: false
# frozen_string_literal: true

class Mmux < Formula
  desc "Keyboard-first TUI for Mattermost-compatible chat"
  homepage "https://github.com/iRootPro/mmux"
  version "0.1.8"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/iRootPro/mmux/releases/download/v0.1.8/mmux_v0.1.8_darwin_amd64.tar.gz"
      sha256 "643f622bc2c5eb3dbd50dfef998e2abdeb31dad21bd480b6a7a33c90bc302fa9"

      define_method(:install) do
        install_binary
      end
    end

    if Hardware::CPU.arm?
      url "https://github.com/iRootPro/mmux/releases/download/v0.1.8/mmux_v0.1.8_darwin_arm64.tar.gz"
      sha256 "eb1c76c204a87111ef7ab5c274a0b857a42596d243d7a9823e39678fabaa6a8e"

      define_method(:install) do
        install_binary
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/iRootPro/mmux/releases/download/v0.1.8/mmux_v0.1.8_linux_amd64.tar.gz"
      sha256 "c17aa5c34211881f1b63a5422f9d8544259d072ac297dc124e8441c4e8504b0b"

      define_method(:install) do
        install_binary
      end
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/iRootPro/mmux/releases/download/v0.1.8/mmux_v0.1.8_linux_arm64.tar.gz"
      sha256 "56c321cfac37436c372f68e1e648b3ce134f4689b8622ffa9bb996e92230d41b"

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
