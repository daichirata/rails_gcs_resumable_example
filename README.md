# GCS resumable upload example with Rails.

Example for doing resumable upload of GCS with Rails.

## Configuration

environment variables

* `GOOGLE_CLOUD_PROJECT`
  * GCP project name.
* `GOOGLE_CLOUD_KEYFILE` or `GOOGLE_CLOUD_KEYFILE_JSON`
  * `GOOGLE_CLOUD_KEYFILE`: Path of GCS service account credentials JSON file.
  * `GOOGLE_CLOUD_KEYFILE_JSON`: Text of GCS service account credentials JSON file.
* `GCS_BUCKET`
  * Upload GCS bucket name.

