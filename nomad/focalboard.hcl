job "focalboard" {
	datacenters = ["uneunet"]
	type = "service"

	group "focalboard" {
		count = 1
		
		network {
			port "http" {
				to = 8000
			}
		}

		service {
			name = "focalboard"
			port = "http"

			tags = [
				"traefik.enable=true",
				"traefik.http.routers.focalboard.rule=Host(`focalboard.localhost`)",
			]
		}

		task "focalboard" {
			driver = "docker"

			config {
				image = "mattermost/focalboard:latest"
				ports = ["http"]
			}

			resources {
				cpu = 100
				memory = 256
			}
		}
	}
}

