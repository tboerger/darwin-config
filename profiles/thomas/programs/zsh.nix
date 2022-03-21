{ pkgs, ... }:

{
  enable = true;
  enableCompletion = true;
  enableAutosuggestions = true;
  enableSyntaxHighlighting = true;

  history = {
    size = 10000000;
    save = 10000000;
    extended = true;
  };

  shellAliases = {
    ".." = "cd ..";
    "..." = "cd ../..";

    git = "hub";
    gs = "git status";
    gc = "git commit";
    gp = "git push";
    gl = "git pull";

    status = "git status";
    commit = "git commit";
    push = "git push";
    pull = "git pull";

    k = "kubectl";
    kaf = "kubectl apply -f";
    kgns = "kubectl get namespaces";
    kgs = "kubectl get svc";
    kgsa = "kubectl get svc --all-namespaces";
    kgi = "kubectl get ingress";
    kgia = "kubectl get ingress --all-namespaces";
    kgcm = "kubectl get configmaps";
    kgcma = "kubectl get configmaps --all-namespaces";
    kgsec = "kubectl get secret";
    kgseca = "kubectl get secret --all-namespaces";
    kgd = "kubectl get deployment";
    kgda = "kubectl get deployment --all-namespaces";
    kgss = "kubectl get statefulset";
    kgssa = "kubectl get statefulset --all-namespaces";
    kgpvc = "kubectl get pvc";
    kgpvca = "kubectl get pvc --all-namespaces";
    kgds = "kubectl get daemonset";
    kgdsw = "kgds --watch";
    kgall = "kubectl get all --all-namespaces";
    kunusedrs = "kubectl get replicaset -o jsonpath=\"{ .items[?(@.spec.replicas==0)].metadata.name }\"";

    rgrep = "grep -Rn";
    hgrep = "fc -El 0 | grep";
    history = "fc -l 1";
    sha256sum = "shasum -a 256";
  };

  sessionVariables = {
    # GITHUB_TOKEN = "";

    # CLOUDFLARE_EMAIL = "thomas@webhippie.de";
    # CLOUDFLARE_API_KEY = "";

    EDITOR = "vim";
    PAGER = "less";
    CLICOLOR = "1";
    GREP_COLOR = "1;33";
    IGNOREEOF = "1";
  };

  oh-my-zsh = {
    enable = true;

    plugins = [
      "systemd"
      "sudo"
      "history-substring-search"
      "encode64"
      "rsync"
      "tmux"
    ];
  };
}
