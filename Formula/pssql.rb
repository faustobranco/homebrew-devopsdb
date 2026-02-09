class Pssql < Formula
  desc "PostgreSQL Connection Manager"
  homepage "https://github.com/faustobranco/pssql"
  url "https://github.com/faustobranco/pssql/archive/refs/tags/v1.1.2.tar.gz"
  sha256 "c2e5169a6aeee34e46f76264af5e393dcc586b79071ea3b076e25c76c3aa281c"
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