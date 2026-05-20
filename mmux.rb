# typed: false
# frozen_string_literal: true

class Mmux < Formula
  desc "Keyboard-first TUI for Mattermost-compatible chat"
  homepage "https://github.com/iRootPro/mmux"
  version "0.1.10"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/iRootPro/mmux/releases/download/v0.1.10/mmux_v0.1.10_darwin_amd64.tar.gz"
      sha256 "ed36a9113e32f1b6d4eb33b63c3ea42cc171aaec1a184d3b9d5db0c87ea138c8"

      define_method(:install) do
        install_binary
      end
    end

    if Hardware::CPU.arm?
      url "https://github.com/iRootPro/mmux/releases/download/v0.1.10/mmux_v0.1.10_darwin_arm64.tar.gz"
      sha256 "42cddd6837495d3d4ff402c84a1909e736dcde85a8e26a11b70168fce7bda0ba"

      define_method(:install) do
        install_binary
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/iRootPro/mmux/releases/download/v0.1.10/mmux_v0.1.10_linux_amd64.tar.gz"
      sha256 "a61b008368eaaaf54be182d2a401ffaf9ab11d4ad3fc12265936998e026777bf"

      define_method(:install) do
        install_binary
      end
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/iRootPro/mmux/releases/download/v0.1.10/mmux_v0.1.10_linux_arm64.tar.gz"
      sha256 "1e50f6adcbc66f8678cceddbd24503956cbc3fdab7e9fecb71e310036b063d29"

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
