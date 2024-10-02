terraform {
	required_providers {
		proxmox = {
			source = "Telmate/proxmox"
			version = "3.0.1-rc4"
		}
	}
}

provider "proxmox" {
	pm_api_url = "https://192.168.1.30:8006/api2/json"
}
