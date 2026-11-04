# typed: false
# frozen_string_literal: true

class AwsS3CostExplorer < Formula
  desc "CLI to retrieve S3 storage costs and storage tiers for AWS buckets"
  homepage "https://github.com/idvoretskyi/aws-s3-cost-explorer"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/idvoretskyi/aws-s3-cost-explorer/releases/download/v0.0.1/aws-s3-cost-explorer_0.0.1_darwin_amd64.tar.gz"
      sha256 "4eb5314ec04c77c81431791164ed9f6d4f14bc1be8772a3776007b7cdc2d2528"
    end
    if Hardware::CPU.arm?
      url "https://github.com/idvoretskyi/aws-s3-cost-explorer/releases/download/v0.0.1/aws-s3-cost-explorer_0.0.1_darwin_arm64.tar.gz"
      sha256 "77c525df957b9c11d9d77eb29a601e4753d60a5318121994aa9e925248723d8e"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/idvoretskyi/aws-s3-cost-explorer/releases/download/v0.0.1/aws-s3-cost-explorer_0.0.1_linux_amd64.tar.gz"
      sha256 "8683993b1097550af3e21897c691774a44c9d8fbae94fdcfc1cb8fcce509fadb"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/idvoretskyi/aws-s3-cost-explorer/releases/download/v0.0.1/aws-s3-cost-explorer_0.0.1_linux_arm64.tar.gz"
      sha256 "51c701423b5349653db40cdba03854203563dc0ea6e6e22215c1094b5ac0169c"
    end
  end

  def install
    bin.install "aws-s3-cost-explorer"
  end

  test do
    system "#{bin}/aws-s3-cost-explorer", "--help"
  end
end
