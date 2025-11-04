local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

return {
  -- Basic Pod
  s("pod", {
    t({"apiVersion: v1", "kind: Pod", "metadata:", "  name: "}), i(1, "pod-name"),
    t({"", "  labels:", "    app: "}), i(2, "app-name"),
    t({"", "spec:", "  containers:", "  - name: "}), i(3, "container-name"),
    t({"", "    image: "}), i(4, "image:tag"),
    t({"", "    ports:", "    - containerPort: "}), i(5, "80"),
    t({"", "    resources:", "      requests:", "        memory: \""}), i(6, "64Mi"),
    t({"\"", "        cpu: \""}), i(7, "250m"),
    t({"\"", "      limits:", "        memory: \""}), i(8, "128Mi"),
    t({"\"", "        cpu: \""}), i(9, "500m"), t("\"")
  }),

  -- Deployment
  s("deployment", {
    t({"apiVersion: apps/v1", "kind: Deployment", "metadata:", "  name: "}), i(1, "deployment-name"),
    t({"", "  labels:", "    app: "}), i(2, "app-name"),
    t({"", "spec:", "  replicas: "}), i(3, "3"),
    t({"", "  selector:", "    matchLabels:", "      app: "}), f(function(args) return args[1][1] end, {2}),
    t({"", "  template:", "    metadata:", "      labels:", "        app: "}), f(function(args) return args[1][1] end, {2}),
    t({"", "    spec:", "      containers:", "      - name: "}), i(4, "container-name"),
    t({"", "        image: "}), i(5, "image:tag"),
    t({"", "        ports:", "        - containerPort: "}), i(6, "80"),
    t({"", "        resources:", "          requests:", "            memory: \""}), i(7, "64Mi"),
    t({"\"", "            cpu: \""}), i(8, "250m"),
    t({"\"", "          limits:", "            memory: \""}), i(9, "128Mi"),
    t({"\"", "            cpu: \""}), i(10, "500m"), t("\"")
  }),

  -- Service
  s("service", {
    t({"apiVersion: v1", "kind: Service", "metadata:", "  name: "}), i(1, "service-name"),
    t({"", "spec:", "  selector:", "    app: "}), i(2, "app-name"),
    t({"", "  type: "}), i(3, "ClusterIP"),
    t({"", "  ports:", "  - protocol: TCP", "    port: "}), i(4, "80"),
    t({"", "    targetPort: "}), i(5, "8080")
  }),

  -- ConfigMap
  s("configmap", {
    t({"apiVersion: v1", "kind: ConfigMap", "metadata:", "  name: "}), i(1, "configmap-name"),
    t({"", "data:", "  "}), i(2, "key"), t(": "), i(3, "value")
  }),

  -- Secret
  s("secret", {
    t({"apiVersion: v1", "kind: Secret", "metadata:", "  name: "}), i(1, "secret-name"),
    t({"", "type: Opaque", "data:", "  "}), i(2, "key"), t(": "), i(3, "base64-encoded-value")
  }),

  -- Namespace
  s("namespace", {
    t({"apiVersion: v1", "kind: Namespace", "metadata:", "  name: "}), i(1, "namespace-name")
  }),

  -- Ingress
  s("ingress", {
    t({"apiVersion: networking.k8s.io/v1", "kind: Ingress", "metadata:", "  name: "}), i(1, "ingress-name"),
    t({"", "  annotations:", "    "}), i(2, "key"), t(": "), i(3, "value"),
    t({"", "spec:", "  rules:", "  - host: "}), i(4, "example.com"),
    t({"", "    http:", "      paths:", "      - path: "}), i(5, "/"),
    t({"", "        pathType: Prefix", "        backend:", "          service:", "            name: "}), i(6, "service-name"),
    t({"", "            port:", "              number: "}), i(7, "80")
  }),

  -- PersistentVolumeClaim
  s("pvc", {
    t({"apiVersion: v1", "kind: PersistentVolumeClaim", "metadata:", "  name: "}), i(1, "pvc-name"),
    t({"", "spec:", "  accessModes:", "  - "}), i(2, "ReadWriteOnce"),
    t({"", "  resources:", "    requests:", "      storage: "}), i(3, "1Gi")
  }),

  -- StatefulSet
  s("statefulset", {
    t({"apiVersion: apps/v1", "kind: StatefulSet", "metadata:", "  name: "}), i(1, "statefulset-name"),
    t({"", "spec:", "  serviceName: "}), i(2, "service-name"),
    t({"", "  replicas: "}), i(3, "3"),
    t({"", "  selector:", "    matchLabels:", "      app: "}), i(4, "app-name"),
    t({"", "  template:", "    metadata:", "      labels:", "        app: "}), f(function(args) return args[1][1] end, {4}),
    t({"", "    spec:", "      containers:", "      - name: "}), i(5, "container-name"),
    t({"", "        image: "}), i(6, "image:tag"),
    t({"", "        ports:", "        - containerPort: "}), i(7, "80")
  }),

  -- DaemonSet
  s("daemonset", {
    t({"apiVersion: apps/v1", "kind: DaemonSet", "metadata:", "  name: "}), i(1, "daemonset-name"),
    t({"", "spec:", "  selector:", "    matchLabels:", "      app: "}), i(2, "app-name"),
    t({"", "  template:", "    metadata:", "      labels:", "        app: "}), f(function(args) return args[1][1] end, {2}),
    t({"", "    spec:", "      containers:", "      - name: "}), i(3, "container-name"),
    t({"", "        image: "}), i(4, "image:tag")
  }),

  -- Job
  s("job", {
    t({"apiVersion: batch/v1", "kind: Job", "metadata:", "  name: "}), i(1, "job-name"),
    t({"", "spec:", "  template:", "    spec:", "      containers:", "      - name: "}), i(2, "container-name"),
    t({"", "        image: "}), i(3, "image:tag"),
    t({"", "        command: ["}), i(4, "\"command\""), t({"]", "      restartPolicy: "}), i(5, "Never")
  }),

  -- CronJob
  s("cronjob", {
    t({"apiVersion: batch/v1", "kind: CronJob", "metadata:", "  name: "}), i(1, "cronjob-name"),
    t({"", "spec:", "  schedule: \""}), i(2, "0 0 * * *"),
    t({"\"", "  jobTemplate:", "    spec:", "      template:", "        spec:", "          containers:", "          - name: "}), i(3, "container-name"),
    t({"", "            image: "}), i(4, "image:tag"),
    t({"", "            command: ["}), i(5, "\"command\""), t({"]", "          restartPolicy: "}), i(6, "OnFailure")
  }),

  -- FluxCD Kustomization
  s("kustomization", {
    t({"apiVersion: kustomize.toolkit.fluxcd.io/v1", "kind: Kustomization", "metadata:", "  name: "}), i(1, "kustomization-name"),
    t({"", "  namespace: "}), i(2, "flux-system"),
    t({"", "spec:", "  interval: "}), i(3, "5m"),
    t({"", "  path: "}), i(4, "./clusters/production"),
    t({"", "  prune: "}), i(5, "true"),
    t({"", "  sourceRef:", "    kind: "}), i(6, "GitRepository"),
    t({"", "    name: "}), i(7, "flux-system"),
    t({"", "  targetNamespace: "}), i(8, "default")
  }),

  -- FluxCD HelmRelease
  s("helmrelease", {
    t({"apiVersion: helm.toolkit.fluxcd.io/v2", "kind: HelmRelease", "metadata:", "  name: "}), i(1, "release-name"),
    t({"", "  namespace: "}), i(2, "default"),
    t({"", "spec:", "  interval: "}), i(3, "5m"),
    t({"", "  chart:", "    spec:", "      chart: "}), i(4, "chart-name"),
    t({"", "      version: "}), i(5, "1.0.0"),
    t({"", "      sourceRef:", "        kind: HelmRepository", "        name: "}), i(6, "repository-name"),
    t({"", "        namespace: "}), i(7, "flux-system"),
    t({"", "      interval: "}), i(8, "1m"),
    t({"", "  values:", "    "}), i(9, "# helm values here")
  }),

  -- FluxCD HelmRepository
  s("helmrepository", {
    t({"apiVersion: source.toolkit.fluxcd.io/v1", "kind: HelmRepository", "metadata:", "  name: "}), i(1, "repository-name"),
    t({"", "  namespace: "}), i(2, "flux-system"),
    t({"", "spec:", "  interval: "}), i(3, "1h"),
    t({"", "  url: "}), i(4, "https://charts.example.com")
  }),

  -- FluxCD ImageRepository
  s("imagerepository", {
    t({"apiVersion: image.toolkit.fluxcd.io/v1", "kind: ImageRepository", "metadata:", "  name: "}), i(1, "image-repo-name"),
    t({"", "  namespace: "}), i(2, "flux-system"),
    t({"", "spec:", "  image: "}), i(3, "ghcr.io/org/app"),
    t({"", "  interval: "}), i(4, "1m"),
    t({"", "  secretRef:", "    name: "}), i(5, "registry-credentials")
  }),

  -- FluxCD ImagePolicy
  s("imagepolicy", {
    t({"apiVersion: image.toolkit.fluxcd.io/v1", "kind: ImagePolicy", "metadata:", "  name: "}), i(1, "image-policy-name"),
    t({"", "  namespace: "}), i(2, "flux-system"),
    t({"", "spec:", "  imageRepositoryRef:", "    name: "}), i(3, "image-repo-name"),
    t({"", "  policy:", "    "}), i(4, "semver"), t({":", "      range: "}), i(5, ">=1.0.0")
  }),

  -- FluxCD ImageUpdateAutomation
  s("imageupdateautomation", {
    t({"apiVersion: image.toolkit.fluxcd.io/v1", "kind: ImageUpdateAutomation", "metadata:", "  name: "}), i(1, "image-update-name"),
    t({"", "  namespace: "}), i(2, "flux-system"),
    t({"", "spec:", "  interval: "}), i(3, "1m"),
    t({"", "  sourceRef:", "    kind: GitRepository", "    name: "}), i(4, "flux-system"),
    t({"", "  git:", "    checkout:", "      ref:", "        branch: "}), i(5, "main"),
    t({"", "    commit:", "      author:", "        email: "}), i(6, "flux@example.com"),
    t({"", "        name: "}), i(7, "Flux"),
    t({"", "      messageTemplate: \""}), i(8, "Automated image update"),
    t({"\"", "    push:", "      branch: "}), i(9, "main"),
    t({"", "  update:", "    path: "}), i(10, "./clusters/production"),
    t({"", "    strategy: Setters"})
  }),
}
