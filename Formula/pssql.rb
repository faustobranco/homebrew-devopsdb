class Pssql < Formula
  desc "PostgreSQL Connection Manager"
  homepage "https://github.com/faustobranco/pssql"
  url "https://github.com/faustobranco/pssql/archive/refs/tags/v1.1.1.tar.gz"
  sha256 "8ee43e1d3757decdb5d171cdc8d0002ae771905a2af3aaa09fe969febd17dad0"
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