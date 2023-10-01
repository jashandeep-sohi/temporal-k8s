{ pkgs, ... }:

{
  # See full reference at https://devenv.sh/reference/options/

  # https://devenv.sh/packages/
  packages = [
    pkgs.git
    pkgs.kubectl
    pkgs.kind
    pkgs.kustomize
    pkgs.skaffold
    pkgs.kubernetes-helm
    pkgs.temporal-cli

  ];

  enterShell = ''
    export KUBECONFIG=`pwd`/kind-kubeconfig
    echo "Setting KUBECONFIG to $KUBECONFIG"
    echo "If you don't want that just run 'unset KUBECONFIG'"
  '';

  # https://devenv.sh/languages/
  languages.nix.enable = true;
}
