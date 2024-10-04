job "traefik" {
	datacenters = ["uneunet"]
	type = "service"
	
	group "traefik" {
		count = 1

		network {
			port "http" {
				static = 80
			}

			port "traefik" {
				static = 8080
			}
		}

		service {
			name = "traefik"
		}

		task "traefik" {
			driver = "docker"

			config {
				image = "traefik:v3.2"
				network_mode = "host"
				args = [
					"--api.dashboard=true",
					"--api.insecure=true",
					"--entrypoints.web.address=:80",
					"--entrypoints.traefik.address=:8080",
					"--providers.consulcatalog=true",
					"--providers.consulcatalog.exposedByDefault=false",
					"--providers.consulcatalog.endpoint.address=http://192.168.1.31:8500",
					"--providers.consulcatalog.prefix=traefik",
				]
				ports = ["http", "traefik"]
			}

			resources {
				cpu = 100
				memory = 128
			}
		}
	}
}
