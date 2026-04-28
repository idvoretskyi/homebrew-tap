# typed: false
# frozen_string_literal: true

class CncfMaintainers < Formula
  desc "CLI to validate GitHub usernames against the CNCF maintainers list"
  homepage "https://github.com/idvoretskyi/cncf-github-maintainers"
  version "0.2.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/idvoretskyi/cncf-github-maintainers/releases/download/v0.2.0/cncf-maintainers_darwin_arm64.tar.gz"
      sha256 "070a7fd67f207aa3db9ccced2a258a7a50aec3c5158d862481a3cbf61de6587d"
    end
    if Hardware::CPU.intel?
      url "https://github.com/idvoretskyi/cncf-github-maintainers/releases/download/v0.2.0/cncf-maintainers_darwin_amd64.tar.gz"
      sha256 "90dd0d621388c48629152b15400704a9b0924e40dd62259c34507ccdf0ff7463"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/idvoretskyi/cncf-github-maintainers/releases/download/v0.2.0/cncf-maintainers_linux_arm64.tar.gz"
      sha256 "f9dc7d2ad59cfaafecbbf021b918aa4e83c4aef2491b21397cdc6dbac977f999"
    end
    if Hardware::CPU.intel?
      url "https://github.com/idvoretskyi/cncf-github-maintainers/releases/download/v0.2.0/cncf-maintainers_linux_amd64.tar.gz"
      sha256 "2c66580b18af67e0906995fc363a86c62daafd3c09df4d57fdf86f8d2d205757"
    end
  end

  def install
    bin.install "cncf-maintainers"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cncf-maintainers --version")
  end
end
