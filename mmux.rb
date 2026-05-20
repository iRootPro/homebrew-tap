# typed: false
# frozen_string_literal: true

class Mmux < Formula
  desc "Keyboard-first TUI for Mattermost-compatible chat"
  homepage "https://github.com/iRootPro/mmux"
  version "0.1.6"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/iRootPro/mmux/releases/download/v0.1.6/mmux_v0.1.6_darwin_amd64.tar.gz"
      sha256 "d048cc746d821b6f2038ea162fa2a968fe1f0209100cafded297bea6f1a677c4"

      define_method(:install) do
        install_binary
      end
    end

    if Hardware::CPU.arm?
      url "https://github.com/iRootPro/mmux/releases/download/v0.1.6/mmux_v0.1.6_darwin_arm64.tar.gz"
      sha256 "f9ab8ae9eca30c6d22f58753c3442528f57e92478b75315b725657c408923768"

      define_method(:install) do
        install_binary
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/iRootPro/mmux/releases/download/v0.1.6/mmux_v0.1.6_linux_amd64.tar.gz"
      sha256 "26f5c80de6198c5531e077d76e6da1c188e50f1b2eb55240642d3d5924e720b7"

      define_method(:install) do
        install_binary
      end
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/iRootPro/mmux/releases/download/v0.1.6/mmux_v0.1.6_linux_arm64.tar.gz"
      sha256 "20286233c2602cf267c079adebaca78066b81b0412de7bf19fec47f6073587b7"

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
