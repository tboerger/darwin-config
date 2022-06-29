{ pkgs, ... }:

{
  enable = true;

  matchBlocks = {
    "asbru" = {
      hostname = "asbru.webhippie.de";
      port = 22;
      user = "root";
      forwardAgent = true;
    };

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
  };
}
