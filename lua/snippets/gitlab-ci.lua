local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

return {
  -- Basic GitLab CI structure
  s("gitlab", {
    t({"stages:", "  - "}), i(1, "build"),
    t({"", "  - "}), i(2, "test"),
    t({"", "  - "}), i(3, "deploy"),
    t({"", "", "variables:", "  "}), i(4, "VAR_NAME"), t(": "), i(5, "value"),
    t({"", "", ""}), i(6, "job-name"), t(":"),
    t({"", "  stage: "}), i(7, "build"),
    t({"", "  script:", "    - "}), i(8, "echo 'Hello World'")
  }),

  -- Job definition
  s("gitlab_job", {
    i(1, "job-name"), t(":"),
    t({"", "  stage: "}), i(2, "build"),
    t({"", "  image: "}), i(3, "docker:latest"),
    t({"", "  script:", "    - "}), i(4, "echo 'Running job'"),
    t({"", "  tags:", "    - "}), i(5, "docker")
  }),

  -- Job with artifacts
  s("gitlab_job_artifacts", {
    i(1, "job-name"), t(":"),
    t({"", "  stage: "}), i(2, "build"),
    t({"", "  script:", "    - "}), i(3, "make build"),
    t({"", "  artifacts:", "    paths:", "      - "}), i(4, "build/"),
    t({"", "    expire_in: "}), i(5, "1 week")
  }),

  -- Job with cache
  s("gitlab_job_cache", {
    i(1, "job-name"), t(":"),
    t({"", "  stage: "}), i(2, "build"),
    t({"", "  script:", "    - "}), i(3, "npm install"),
    t({"", "  cache:", "    key: "}), i(4, "${CI_COMMIT_REF_SLUG}"),
    t({"", "    paths:", "      - "}), i(5, "node_modules/")
  }),

  -- Docker build job
  s("gitlab_docker_build", {
    i(1, "docker-build"), t(":"),
    t({"", "  stage: "}), i(2, "build"),
    t({"", "  image: docker:latest"}),
    t({"", "  services:", "    - docker:dind"}),
    t({"", "  script:", "    - docker login -u $CI_REGISTRY_USER -p $CI_REGISTRY_PASSWORD $CI_REGISTRY"}),
    t({"", "    - docker build -t $CI_REGISTRY_IMAGE:"}), i(3, "$CI_COMMIT_SHORT_SHA"), t(" ."),
    t({"", "    - docker push $CI_REGISTRY_IMAGE:"}), f(function(args) return args[1][1] end, {3})
  }),

  -- Rules with conditions
  s("gitlab_rules", {
    t({"rules:", "  - if: "}), i(1, "$CI_COMMIT_BRANCH == 'main'"),
    t({"", "    when: "}), i(2, "always"),
    t({"", "  - when: "}), i(3, "never")
  }),

  -- Variables
  s("gitlab_variables", {
    t({"variables:", "  "}), i(1, "VAR_NAME"), t(": "), i(2, "value")
  }),

  -- Only/Except (deprecated but still used)
  s("gitlab_only", {
    t({"only:", "  - "}), i(1, "main")
  }),

  s("gitlab_except", {
    t({"except:", "  - "}), i(1, "tags")
  }),

  -- Extends
  s("gitlab_extends", {
    t("extends: ."), i(1, "template-name")
  }),

  -- Include
  s("gitlab_include", {
    t({"include:", "  - template: "}), i(1, "Auto-DevOps.gitlab-ci.yml")
  }),

  -- Include local
  s("gitlab_include_local", {
    t({"include:", "  - local: "}), i(1, ".gitlab-ci-template.yml")
  }),

  -- Template job
  s("gitlab_template", {
    t("."), i(1, "template-name"), t(":"),
    t({"", "  image: "}), i(2, "alpine:latest"),
    t({"", "  before_script:", "    - "}), i(3, "setup command"),
    t({"", "  script:", "    - "}), i(4, "main command")
  }),

  -- Retry
  s("gitlab_retry", {
    t({"retry:", "  max: "}), i(1, "2"),
    t({"", "  when:", "    - "}), i(2, "runner_system_failure")
  }),

  s("gitlab_trigger", {
    i(1, "trigger-job"), t(":"),
    t({"", "  stage: "}), i(2, "deploy"),
    t({"", "  trigger:", "    project: "}), i(3, "group/project"),
    t({"", "    branch: "}), i(4, "main")
  }),
}
