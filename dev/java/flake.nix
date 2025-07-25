{
  inputs.nixpkgs.url = "nixpkgs/release-25.05";
  outputs = inputs: let
    supportedSystems = ["x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin"];
    forEachSupportedSystem = f:
      inputs.nixpkgs.lib.genAttrs supportedSystems (system:
        f {
          pkgs = import inputs.nixpkgs {
            inherit system;
            overlays = [inputs.self.overlays.default];
          };
        });
  in {
    overlays.default = final: prev: let
      jdk = prev."jdk23";
    in {
      inherit jdk;
      maven = prev.maven.override {jdk_headless = jdk;};
      gradle = prev.gradle.override {java = jdk;};
      lombok = prev.lombok.override {inherit jdk;};
    };

    devShells = forEachSupportedSystem ({pkgs}: {
      default = pkgs.mkShell {
        packages = with pkgs; [
          gcc
          gradle
          jdk
          maven
          ncurses
          patchelf
          zlib
        ];

        shellHook = let
          loadLombok = "-javaagent:${pkgs.lombok}/share/java/lombok.jar";
          prev = "\${JAVA_TOOL_OPTIONS:+ $JAVA_TOOL_OPTIONS}";
        in ''
          export JAVA_TOOL_OPTIONS="${loadLombok}${prev}"
        '';
      };
    });
  };
}
