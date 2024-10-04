job "kuma" {
	datacenters = ["uneunet"]
	type = "service"

	group "kuma" {
		count = 1
		
		network {
			port "http" {
				to = 3001
			}
		}

		service {
			name = "kuma"
			port = "http"

			tags = [
				"traefik.enable=true",
				"traefik.http.routers.kuma.rule=Host(`kuma.localhost`)",
			]
		}

		ephemeral_disk {
			size = 300
    }

		task "kuma" {
			driver = "docker"

			config {
				image = "louislam/uptime-kuma:latest"
				ports = ["http"]
			}

			resources {
				cpu = 100
				memory = 256
			}
		}
	}
}
