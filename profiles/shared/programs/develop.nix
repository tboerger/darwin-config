{ pkgs, lib, config, options, ... }:
with lib;

let
  cfg = config.profile.programs.develop;

  python3 = pkgs.python3.withPackages (p: with p; [
    boto3
    botocore
    hcloud
    passlib
    requests
  ]);

in
{
  options = {
    profile = {
      programs = {
        develop = {
          enable = mkEnableOption "Develop";
        };
      };
    };
  };

  config = mkIf cfg.enable {
    home = {
      packages = with pkgs; [
        cfssl
        coreutils
        gettext
        gnumake
        gnused
        go-jsonnet
        gomplate
        graphviz
        httpie
        ipcalc
        jq
        jsonnet-bundler
        mediainfo
        mediawriter
        nmap
        p7zip
        reflex
        rsync
        shellcheck
        sops
        upx
        yamale
        yamllint
        yq-go

        python3

        ansible
        # ansible-doctor
        # ansible-later
        molecule

        checkov
        terraform
        tflint
        tfsec

        nodejs_20
      ];

      file = {
        ".local/bin/search-and-replace" = {
          executable = true;
          text = ''
            #!/usr/bin/env bash
            set -e

            [ "$1" = "-h" ] && exec sed -ne '/^#/!q;s/.\{1,2\}//;1d;p' < "$0"

            word=""
            if [ "$1" == "-w" ]; then
              word="$1"
              shift 1
            fi

            hidden=""
            if [ "$1" == "-H" ]; then
              hidden="--hidden"
              shift 1
            fi

            num_files=0
            has_error=0

            ag -l $word $hidden "$1" | while read file; do
              sed -i.bak "s|''${word:+[[:<:]]}$1''${word:+[[:>:]]}|$2|g" "$file"

              if diff -q "$file" "$file.bak" >/dev/null; then
                echo "Warning: $file: pattern found, but no substitutions made" >&2
                : $((has_error++))
              else
                echo "$file"
              fi

              rm "$file.bak"
              : $((num_files++))
            done

            if [ $num_files -eq 0 ] || [ $has_error -gt 0 ]
            then
              exit 1
            fi

          '';
        };

        ".local/bin/each-dir" = {
          executable = true;
          text = ''
            #!/usr/bin/env bash

            for DIR in $(find $(pwd) -mindepth 1 -maxdepth 1 -type d -a -not -iname _\* | sort); do
                echo "-----> $(basename $DIR)"
                pushd $DIR >/dev/null
                "$@"
                popd >/dev/null
            done
          '';
        };

        ".local/bin/sort-requirements" = {
          executable = true;
          text = ''
            #!${pkgs.ruby}/bin/ruby
            require "yaml"

            if ARGV.length != 1
              puts "Usage: #{File.basename __FILE__} path/to/requirements.yml"
              exit 1
            end

            unless File.exist? ARGV.first
              puts "Error: Input file does not exist"
              exit 1
            end

            YAML.load_file(ARGV.first).tap do |yaml|
              if yaml.kind_of? Array
                yaml.sort! { |a, b| a["src"] <=> b["src"] }
              else
                if yaml.has_key? "roles"
                  yaml["roles"].sort! { |a, b| a["src"] <=> b["src"] }
                end

                if yaml.has_key? "collections"
                  yaml["collections"].sort! { |a, b| a["name"] <=> b["name"] }
                end
              end

              File.open(ARGV.first, "w+") do |file|
                file.write "# Standards: 1.2\n"
                if yaml.kind_of? Array
                  file.write yaml.to_yaml
                else
                  result = []

                  if yaml.has_key? "collections"
                    result.push({
                      "collections" => yaml["collections"]
                    }.to_yaml)
                  end

                  if yaml.has_key? "roles"
                    result.push({
                      "roles" => yaml["roles"]
                    }.to_yaml)
                  end

                  file.write result.join("\n")
                end

                file.write "\n...\n"
              end
            end
          '';
        };
      };
    };
  };
}
