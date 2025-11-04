local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

return {
  -- Basic Pod
  s("k8s_pod", {
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
  s("k8s_deployment", {
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
  s("k8s_service", {
    t({"apiVersion: v1", "kind: Service", "metadata:", "  name: "}), i(1, "service-name"),
    t({"", "spec:", "  selector:", "    app: "}), i(2, "app-name"),
    t({"", "  type: "}), i(3, "ClusterIP"),
    t({"", "  ports:", "  - protocol: TCP", "    port: "}), i(4, "80"),
    t({"", "    targetPort: "}), i(5, "8080")
  }),

  -- ConfigMap
  s("k8s_configmap", {
    t({"apiVersion: v1", "kind: ConfigMap", "metadata:", "  name: "}), i(1, "configmap-name"),
    t({"", "data:", "  "}), i(2, "key"), t(": "), i(3, "value")
  }),

  -- Secret
  s("k8s_secret", {
    t({"apiVersion: v1", "kind: Secret", "metadata:", "  name: "}), i(1, "secret-name"),
    t({"", "type: Opaque", "data:", "  "}), i(2, "key"), t(": "), i(3, "base64-encoded-value")
  }),

  -- Namespace
  s("k8s_namespace", {
    t({"apiVersion: v1", "kind: Namespace", "metadata:", "  name: "}), i(1, "namespace-name")
  }),

  -- Ingress
  s("k8s_ingress", {
    t({"apiVersion: networking.k8s.io/v1", "kind: Ingress", "metadata:", "  name: "}), i(1, "ingress-name"),
    t({"", "  annotations:", "    "}), i(2, "key"), t(": "), i(3, "value"),
    t({"", "spec:", "  rules:", "  - host: "}), i(4, "example.com"),
    t({"", "    http:", "      paths:", "      - path: "}), i(5, "/"),
    t({"", "        pathType: Prefix", "        backend:", "          service:", "            name: "}), i(6, "service-name"),
    t({"", "            port:", "              number: "}), i(7, "80")
  }),

  -- PersistentVolumeClaim
  s("k8s_pvc", {
    t({"apiVersion: v1", "kind: PersistentVolumeClaim", "metadata:", "  name: "}), i(1, "pvc-name"),
    t({"", "spec:", "  accessModes:", "  - "}), i(2, "ReadWriteOnce"),
    t({"", "  resources:", "    requests:", "      storage: "}), i(3, "1Gi")
  }),

  -- StatefulSet
  s("k8s_statefulset", {
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
  s("k8s_daemonset", {
    t({"apiVersion: apps/v1", "kind: DaemonSet", "metadata:", "  name: "}), i(1, "daemonset-name"),
    t({"", "spec:", "  selector:", "    matchLabels:", "      app: "}), i(2, "app-name"),
    t({"", "  template:", "    metadata:", "      labels:", "        app: "}), f(function(args) return args[1][1] end, {2}),
    t({"", "    spec:", "      containers:", "      - name: "}), i(3, "container-name"),
    t({"", "        image: "}), i(4, "image:tag")
  }),

  -- Job
  s("k8s_job", {
    t({"apiVersion: batch/v1", "kind: Job", "metadata:", "  name: "}), i(1, "job-name"),
    t({"", "spec:", "  template:", "    spec:", "      containers:", "      - name: "}), i(2, "container-name"),
    t({"", "        image: "}), i(3, "image:tag"),
    t({"", "        command: ["}), i(4, "\"command\""), t({"]", "      restartPolicy: "}), i(5, "Never")
  }),

  -- CronJob
  s("k8s_cronjob", {
    t({"apiVersion: batch/v1", "kind: CronJob", "metadata:", "  name: "}), i(1, "cronjob-name"),
    t({"", "spec:", "  schedule: \""}), i(2, "0 0 * * *"),
    t({"\"", "  jobTemplate:", "    spec:", "      template:", "        spec:", "          containers:", "          - name: "}), i(3, "container-name"),
    t({"", "            image: "}), i(4, "image:tag"),
    t({"", "            command: ["}), i(5, "\"command\""), t({"]", "          restartPolicy: "}), i(6, "OnFailure")
  }),
}
