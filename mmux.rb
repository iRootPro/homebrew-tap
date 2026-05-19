# typed: false
# frozen_string_literal: true

class Mmux < Formula
  desc "Keyboard-first TUI for Mattermost-compatible chat"
  homepage "https://github.com/iRootPro/mmux"
  version "0.1.2"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/iRootPro/mmux/releases/download/v0.1.2/mmux_v0.1.2_darwin_amd64.tar.gz"
      sha256 "70f2ffc903117aed53fa393dee9df243d92e812922f7a02f7689151b38f8a4a3"

      define_method(:install) do
        install_binary
      end
    end

    if Hardware::CPU.arm?
      url "https://github.com/iRootPro/mmux/releases/download/v0.1.2/mmux_v0.1.2_darwin_arm64.tar.gz"
      sha256 "1c7e3d09f07a990ae45ad303366e729092d996d6cbcc9b3876583a40a7d36a1d"

      define_method(:install) do
        install_binary
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/iRootPro/mmux/releases/download/v0.1.2/mmux_v0.1.2_linux_amd64.tar.gz"
      sha256 "5273339da3a778f20197848d1a53b29d216266b6d9c6440796a375b26494a791"

      define_method(:install) do
        install_binary
      end
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/iRootPro/mmux/releases/download/v0.1.2/mmux_v0.1.2_linux_arm64.tar.gz"
      sha256 "28223e5e04e9a202936f57257b5a97733aaecf39d39b1598f07c5df5e5e3ca9c"

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
