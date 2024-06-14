resource "proxmox_lxc" "basic" {
	target_node = "uneunet-main"
	hostname = "cf-tunnel"
	ostemplate = "local:vztmpl/ubuntu-24.04-standard_24.04-2_amd64.tar.zst"
	password = "password"
	unprivileged = true

	memory = 512

	rootfs {
		storage = "local-lvm"
		size = "8G"
	}

	network {
		name = "eno1"
		bridge = "vmbr0"
		ip = "192.168.1.31/24"
		gw = "192.168.1.254"
	}
}
