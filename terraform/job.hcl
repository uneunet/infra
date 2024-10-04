job "uptime-kuma" {
	datacenters = ["*"]
	type = "service"

	group "uptime-kuma" {
		count = 1
		
		network {
			port "http" {
				to = "3001"
			}
		}

		service {
			name = "uptime-kuma"
			port = "http"
		}

		ephemeral_disk {
      size = 300
    }

		task "uptime-kuma" {
			driver = "docker"

			config {
				image = "louislam/uptime-kuma:latest"
				ports = ["http"]
			}

			resources {
				cpu = 500
				memory = 128
			}
		}
	}
}

