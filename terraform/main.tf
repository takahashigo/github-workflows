# TODO GCSのバケットを作成
terraform {
  backend "gcs" {
    bucket  = "task-app-terraform-state"
    prefix  = "terraform/state"
    region  = "asia-northeast1" # バケットのリージョン
  }

  required_providers {
    google = {
      source  = "hashicorp/google" # プロバイダーのソース
      version = "5.1.0" # プロバイダーのバージョン
    }
  }
}

provider "google" {
  project = local.project_id # プロジェクトIDを設定
  region  = local.region # リージョンを設定
  credentials = file(local.credentials_path) # パスをサービスアカウントキーのJSONファイルに設定
  zone = "asia-northeast1-a" # ゾーンを設定
}

