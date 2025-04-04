resource "datadog_monitor" "healthcheck" {
  name    = "Healthcheck monitor"
  type    = "service check"
  query   = "\"http.can_connect\".over(\"instance:datadog_health_check\").by(\"host\",\"instance\",\"url\").last(4).count_by_status()"
  message = "{{host.name}} not available"

  monitor_thresholds {
    ok      = 2
    warning = 2
  }
}