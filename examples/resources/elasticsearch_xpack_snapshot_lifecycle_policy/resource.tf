resource "elasticsearch_xpack_snapshot_lifecycle_policy" "terraform-test" {
  name = "test"
  body = <<EOF
{
  "schedule": "0 30 1 * * ?",
  "name": "<daily-snap-{now/d}>",
  "repository": "terraform-test",
  "config": {
    "indices": ["data-*", "important"],
    "ignore_unavailable": false,
    "include_global_state": false
  },
  "retention": {
    "expire_after": "30d",
    "min_count": 5,
    "max_count": 50
  }
}
EOF
}
