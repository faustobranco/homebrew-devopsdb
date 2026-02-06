class Pssql < Formula
  desc "PostgreSQL Connection Manager"
  homepage "https://github.com/faustobranco/pssql"
  url "https://github.com/faustobranco/pssql/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "ea6648eb363bd72b7d4c4cf07c850e70751037bd5787e47d2b20bb7c24b1825f"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", "-o", bin/"pssql", "."
    
    zsh_completion.install "completion/_pssql.zsh" => "_pssql"
    bash_completion.install "completion/_pssql.bash" => "pssql"
    etc.install "pssql.json" => "pssql.json.example"
  end  

  def caveats
    <<~EOS
    To get started, create your configuration directory and copy the example file:
        mkdir -p ~/.pssql
        cp #{etc}/pssql.json.example ~/.pssql/pssql.json
    EOS
  end

  test do
    system "#{bin}/pssql", "--version"
  end
end