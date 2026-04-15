# typed: false
# frozen_string_literal: true

class CncfMaintainers < Formula
  desc "CLI to validate GitHub usernames against the CNCF maintainers list"
  homepage "https://github.com/idvoretskyi/cncf-github-maintainers"
  version "0.1.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/idvoretskyi/cncf-github-maintainers/releases/download/v0.1.0/cncf-maintainers_darwin_arm64.tar.gz"
      sha256 "bce0db61fbedeb7cfd2b3a9d1fa1eb1853b107264221f8d122fc0161e57237fd"
    end
    if Hardware::CPU.intel?
      url "https://github.com/idvoretskyi/cncf-github-maintainers/releases/download/v0.1.0/cncf-maintainers_darwin_amd64.tar.gz"
      sha256 "5c4fa6b5b6408a3101e450619e1c7098eda2683f30311cc52caf455f49392d60"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/idvoretskyi/cncf-github-maintainers/releases/download/v0.1.0/cncf-maintainers_linux_arm64.tar.gz"
      sha256 "15d7cc2ccd75e36d2be0cfe50a679985d818f9ae08f5831ea5f15a637ab1fd8d"
    end
    if Hardware::CPU.intel?
      url "https://github.com/idvoretskyi/cncf-github-maintainers/releases/download/v0.1.0/cncf-maintainers_linux_amd64.tar.gz"
      sha256 "928fdf68f2f95083f2e3b7464319dcca410bca8e5f83ef355990a028949f4bca"
    end
  end

  def install
    bin.install "cncf-maintainers"
  end

  test do
    assert_match "0.1.0", shell_output("#{bin}/cncf-maintainers --version")
  end
end
