resource "helm_release" "metrics_server" {
  name       = "metrics-server"
  repository = "https://kubernetes-sigs.github.io/metrics-server/"
  chart      = "metrics-server"
  namespace  = "kube-system"
  version    = "3.12.1"

  set {
    name  = "metrics.enabled"
    value = "false"
  }

  set {
    name  = "apiService.create"
    value = "true"
  }
  
  depends_on = [ module.eks ]
}
