{ pkgs, ... }:

{
  enable = true;

  matchBlocks = {
    "*.cloudpunks.io !jumphost*.cloudpunks.io" = {
      user = "oper";
      forwardAgent = true;
      proxyJump = "tboerger@jumphost1.cloudpunks.io";
    };
    "jumphost1.cloudpunks.io" = {
      user = "tboerger";
      forwardAgent = true;
    };
    "jumphost2.cloudpunks.io" = {
      user = "tboerger";
      forwardAgent = true;
    };

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
      proxyJump = "thomas@bastion.webhippie.de";
    };
    "bastion.webhippie.de" = {
      user = "thomas";
      forwardAgent = true;
    };

    "*.easy01.proactcloud.de !bastion-01.easy01.proactcloud.de" = {
      user = "detbo";
      forwardAgent = true;
      proxyJump = "detbo@bastion-01.easy01.proactcloud.de";
    };
    "bastion-01.easy01.proactcloud.de" = {
      user = "detbo";
      forwardAgent = true;
    };

    "*.easy02.proactcloud.de !bastion-01.easy02.proactcloud.de" = {
      user = "detbo";
      forwardAgent = true;
      proxyJump = "detbo@bastion-01.easy02.proactcloud.de";
    };
    "bastion-01.easy02.proactcloud.de" = {
      user = "detbo";
      forwardAgent = true;
    };

    "*.ins01.proactcloud.de !bastion-01.ins01.proactcloud.de" = {
      user = "detbo";
      forwardAgent = true;
      proxyJump = "detbo@bastion-01.ins01.proactcloud.de";
    };
    "bastion-01.ins01.proactcloud.de" = {
      user = "detbo";
      forwardAgent = true;
    };

    "*.chef01.proactcloud.de !bastion-01.chef01.proactcloud.de" = {
      user = "detbo";
      forwardAgent = true;
      proxyJump = "detbo@bastion-01.chef01.proactcloud.de";
    };
    "bastion-01.chef01.proactcloud.de" = {
      user = "detbo";
      forwardAgent = true;
    };

    "*.sch01.proactcloud.de !bastion-01.sch01.proactcloud.de" = {
      user = "detbo";
      forwardAgent = true;
      proxyJump = "detbo@bastion-01.sch01.proactcloud.de";
    };
    "bastion-01.sch01.proactcloud.de" = {
      user = "detbo";
      forwardAgent = true;
    };

    "*.internal.proactcloud.de !bastion-01.internal.proactcloud.de" = {
      user = "detbo";
      forwardAgent = true;
      proxyJump = "detbo@bastion-01.internal.proactcloud.de";
    };
    "bastion-01.internal.proactcloud.de" = {
      user = "detbo";
      forwardAgent = true;
    };

    "mothership.proactcloud.de" = {
      user = "detbo";
      forwardAgent = true;
    };
  };
}
