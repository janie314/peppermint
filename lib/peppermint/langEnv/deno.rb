module Peppermint
  class Deno < LangEnv
    def install_lang
      system "command -v deno || curl -fsSL https://deno.land/x/install/install.sh | sh"
    end

    def install_dev_config
      # TODO copy to gitroot, not pwd
    end

    def fmt
      system <<~SHELL
        find . \\( -not -path '*target*' \\) \
          -and \\( -not -path '*node_modules*' \\) \
          -and \\( -not -path '*/doc' \\) \
          -and \\( -name '*.json' -o -name '*.md' -o -name '*.js' \
            -o -name '*.ts' -o -name '*.jsx' -o -name '*.tsx' \\) \
          -and \\( -not -name 'project.json' \\) \
          -and \\( -not -name 'personal.json' \\) \
          -and -type f | xargs -r deno fmt
      SHELL
    end
  end
end
