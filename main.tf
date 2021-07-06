provider "google" {
	#version     = "3.5.0"

	project     = var.project
	region      = var.region
	zone        = var.zone
}


provider "google-beta" {
  #version = 3.14
  project = var.project
  region  = var.region
  zone    = var.zone
}


terraform {
}