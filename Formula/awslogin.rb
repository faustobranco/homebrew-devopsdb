class awslogin < Formula
  desc "AWS Connection Manager"
  homepage "https://github.com/faustobranco/awslogin"
  url "https://github.com/faustobranco/awslogin/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "c02b4c18f95bb02c3703bcf6e01cba12df7e547d63226b8f7d8cbbaeaa78f812"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", "-o", bin/"awslogin", "."
  end  


  test do
    system "#{bin}/awslogin", "--version"
  end
end