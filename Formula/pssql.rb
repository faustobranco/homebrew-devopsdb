class Pssql < Formula
  desc "PostgreSQL Connection Manager"
  homepage "https://github.com/faustobranco/pssql"
  url "https://github.com/faustobranco/pssql/archive/refs/tags/v1.1.3.tar.gz"
  sha256 "e39349b3c8cece65ccdbde77eed79f77f3c37cb2bb6d3193ab4a07c1b8213246"
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
