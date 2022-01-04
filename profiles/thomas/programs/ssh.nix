{ pkgs, ... }:

{
  enable = true;

  matchBlocks = {
    "bous" = {
      hostname = "bous.kleister.tech";
      port = 22022;
      user = "root";
      forwardAgent = true;
    };
    "eitri" = {
      hostname = "eitri.umschlag.tech";
      port = 22022;
      user = "root";
      forwardAgent = true;
    };
    "iring" = {
      hostname = "iring.gopad.tech";
      port = 22022;
      user = "root";
      forwardAgent = true;
    };
    "gefjon" = {
      hostname = "gefjon.gomematic.tech";
      port = 22022;
      user = "root";
      forwardAgent = true;
    };

    "wodan" = {
      hostname = "wodan.webhippie.de";
      port = 22022;
      user = "root";
      forwardAgent = true;
    };
    "fialar" = {
      hostname = "fialar.webhippie.de";
      port = 22022;
      user = "root";
      forwardAgent = true;
    };
    "garm" = {
      hostname = "garm.webhippie.de";
      port = 22022;
      user = "root";
      forwardAgent = true;
    };
    "harti" = {
      hostname = "harti.webhippie.de";
      port = 22022;
      user = "root";
      forwardAgent = true;
    };
    "skalli" = {
      hostname = "skalli.webhippie.de";
      port = 22022;
      user = "root";
      forwardAgent = true;
    };
    "nidhoegg" = {
      hostname = "nidhoegg.webhippie.de";
      port = 22022;
      user = "root";
      forwardAgent = true;
    };
    "balder" = {
      hostname = "balder.webhippie.de";
      port = 22022;
      user = "root";
      forwardAgent = true;
    };

    "*.webhippie.de !bastion.webhippie.de" = {
      user = "thomas";
      forwardAgent = true;
    };
    "bastion.webhippie.de" = {
      user = "thomas";
      forwardAgent = true;
      proxyJump = "thomas@bastion.webhippie.de";
    };
  };
}
