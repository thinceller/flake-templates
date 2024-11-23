{
  description = "thinceller's flake templates";

  outputs = { self, ... }: {
    templates = {
      minimal = {
        path = ./minimal;
        description = "Minimal project template";
      };

      nodejs = {
        path = ./nodejs;
        description = "Node.js project template";
      };
    };
  };
}
