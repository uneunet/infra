datacenter = "uneunet"
data_dir  = "/opt/nomad/data"
bind_addr = "0.0.0.0"

client {
  enabled = true
  servers = ["192.168.1.31:4647"]
}
