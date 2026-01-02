{
  description = "thinceller's flake templates";

  outputs =
    { self, ... }:
    {
      templates = {
        minimal = {
          path = ./minimal;
          description = "Minimal project template";
        };

        nodejs = {
          path = ./nodejs;
          description = "Node.js project template";
        };

        bun = {
          path = ./bun;
          description = "Bun project template";
        };

        haskell = {
          path = ./haskell;
          description = "Haskell project template";
        };
      };
    };
}
