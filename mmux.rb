# typed: false
# frozen_string_literal: true

class Mmux < Formula
  desc "Keyboard-first TUI for Mattermost-compatible chat"
  homepage "https://github.com/iRootPro/mmux"
  version "0.1.9"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/iRootPro/mmux/releases/download/v0.1.9/mmux_v0.1.9_darwin_amd64.tar.gz"
      sha256 "9d2b25a6b8ee3a6131c2cfd69c886f83b070dc3f260d9180eeefbfde1d8324b2"

      define_method(:install) do
        install_binary
      end
    end

    if Hardware::CPU.arm?
      url "https://github.com/iRootPro/mmux/releases/download/v0.1.9/mmux_v0.1.9_darwin_arm64.tar.gz"
      sha256 "b96e049ae3122e528e51e3383aebbce4aa9c521018f7eaaeee1e3346717f8c39"

      define_method(:install) do
        install_binary
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/iRootPro/mmux/releases/download/v0.1.9/mmux_v0.1.9_linux_amd64.tar.gz"
      sha256 "116be404029978b5e8bc54800c2f539c7b28e5d8cec2e50904c4db6a381dfb0a"

      define_method(:install) do
        install_binary
      end
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/iRootPro/mmux/releases/download/v0.1.9/mmux_v0.1.9_linux_arm64.tar.gz"
      sha256 "439b0a0d4818b62731705bce8edb7943c572184ddb51db45c8ce8af90fa6c457"

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
