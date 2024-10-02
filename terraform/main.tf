resource "proxmox_lxc" "k3s-server" {
	target_node = "uneunet-main"
	hostname = "k3s-server"
	ostemplate = "local:vztmpl/ubuntu-24.04-standard_24.04-2_amd64.tar.zst"
	password = "password"
	unprivileged = false
	vmid = 100

	cores = 4
	memory = 4096
	swap = 0

	rootfs {
		storage = "local-lvm"
		size = "20G"
	}

	network {
		name = "eno1"
		bridge = "vmbr0"
		ip = "192.168.1.31/24"
		gw = "192.168.1.254"
	}
}

resource "proxmox_lxc" "k3s-agent-apollo" {
	target_node = "uneunet-main"
	hostname = "k3s-agent-apollo"
	ostemplate = "local:vztmpl/ubuntu-24.04-standard_24.04-2_amd64.tar.zst"
	password = "password"
	unprivileged = false
	vmid = 101

	cores = 4
	memory = 4096
	swap = 0

	rootfs {
		storage = "local-lvm"
		size = "20G"
	}

	network {
		name = "eno1"
		bridge = "vmbr0"
		ip = "192.168.1.32/24"
		gw = "192.168.1.254"
	}
}

resource "proxmox_lxc" "k3s-agent-raputa" {
	target_node = "uneunet-main"
	hostname = "k3s-agent-raputa"
	ostemplate = "local:vztmpl/ubuntu-24.04-standard_24.04-2_amd64.tar.zst"
	password = "password"
	unprivileged = false
	vmid = 102

	cores = 4
	memory = 4096
	swap = 0

	rootfs {
		storage = "local-lvm"
		size = "20G"
	}

	network {
		name = "eno1"
		bridge = "vmbr0"
		ip = "192.168.1.33/24"
		gw = "192.168.1.254"
	}
}

resource "proxmox_lxc" "cf-tunnel" {
	target_node = "uneunet-main"
	hostname = "cf-tunnel"
	ostemplate = "local:vztmpl/ubuntu-24.04-standard_24.04-2_amd64.tar.zst"
	password = "password"
	unprivileged = true
	vmid = 200

	cores = 1
	memory = 512

	rootfs {
		storage = "local-lvm"
		size = "4G"
	}

	network {
		name = "eno1"
		bridge = "vmbr0"
		ip = "192.168.1.36/24"
		gw = "192.168.1.254"
	}
}

resource "proxmox_lxc" "tailscale" {
	target_node = "uneunet-main"
	hostname = "tailscale"
	ostemplate = "local:vztmpl/ubuntu-24.04-standard_24.04-2_amd64.tar.zst"
	password = "password"
	unprivileged = true
	vmid = 201

	cores = 1
	memory = 256

	rootfs {
		storage = "local-lvm"
		size = "4G"
	}

	network {
		name = "eno1"
		bridge = "vmbr0"
		ip = "192.168.1.37/24"
		gw = "192.168.1.254"
	}
}
