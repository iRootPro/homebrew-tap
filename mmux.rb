# typed: false
# frozen_string_literal: true

class Mmux < Formula
  desc "Keyboard-first TUI for Mattermost-compatible chat"
  homepage "https://github.com/iRootPro/mmux"
  version "0.1.7"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/iRootPro/mmux/releases/download/v0.1.7/mmux_v0.1.7_darwin_amd64.tar.gz"
      sha256 "d50349d79e7547754209087a12b6ba0874506885e74ae678f93c935e6dbbb7a6"

      define_method(:install) do
        install_binary
      end
    end

    if Hardware::CPU.arm?
      url "https://github.com/iRootPro/mmux/releases/download/v0.1.7/mmux_v0.1.7_darwin_arm64.tar.gz"
      sha256 "43f24c06e4af7b06036c3172e253e22a243cfc4e4d039b136a9f72a27c3770af"

      define_method(:install) do
        install_binary
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/iRootPro/mmux/releases/download/v0.1.7/mmux_v0.1.7_linux_amd64.tar.gz"
      sha256 "616412749be530fde28c3a83097ba8d808f471fd33bbd8d7b715240acce1b39f"

      define_method(:install) do
        install_binary
      end
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/iRootPro/mmux/releases/download/v0.1.7/mmux_v0.1.7_linux_arm64.tar.gz"
      sha256 "cbbc553f8315b65dd159a316de6b9a2bb91b6aba9f627e58c6a5a0cb4e86de5a"

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
