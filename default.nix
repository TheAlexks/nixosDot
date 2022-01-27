{ self, unstable, ... } @ inputs:

{
  "alex@buupy" = self.lib.mkHome {
    username = "alex";
    hostname = "buupy";
    system = "x86_64-linux";
    pkgs = unstable;

    extraModules = [
      #./profiles/populate.nix
      #./profiles/base
      #./profiles/browsing
      #./profiles/development
      #./profiles/messaging
      #./profiles/multimedia
      #./profiles/research
    ];

    version = "21.11";
  };
}
