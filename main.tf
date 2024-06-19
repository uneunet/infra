resource "proxmox_lxc" "cf-tunnel" {
	target_node = "uneunet-main"
	hostname = "cf-tunnel"
	ostemplate = "local:vztmpl/ubuntu-24.04-standard_24.04-2_amd64.tar.zst"
	password = "password"
	unprivileged = true

	cores = 1
	memory = 512

	rootfs {
		storage = "local-lvm"
		size = "4G"
	}

	network {
		name = "eno1"
		bridge = "vmbr0"
		ip = "192.168.1.31/24"
		gw = "192.168.1.254"
	}
}

resource "proxmox_lxc" "vaultwarden" {
	target_node = "uneunet-main"
	hostname = "vaultwarden"
	ostemplate = "local:vztmpl/ubuntu-24.04-standard_24.04-2_amd64.tar.zst"
	password = "password"
	unprivileged = true

	features {
		nesting = true
	}

	cores = 1
	memory = 512

	rootfs {
		storage = "local-lvm"
		size = "4G"
	}

	network {
		name = "eno1"
		bridge = "vmbr0"
		ip = "192.168.1.32/24"
		gw = "192.168.1.254"
	}
}

resource "proxmox_lxc" "nostr" {
	target_node = "uneunet-main"
	hostname = "nostr"
	ostemplate = "local:vztmpl/ubuntu-24.04-standard_24.04-2_amd64.tar.zst"
	password = "password"
	unprivileged = true

	features {
		nesting = true
	}

	cores = 1
	memory = 1024

	rootfs {
		storage = "local-lvm"
		size = "8G"
	}

	network {
		name = "eno1"
		bridge = "vmbr0"
		ip = "192.168.1.33/24"
		gw = "192.168.1.254"
	}
}

resource "proxmox_lxc" "metrics" {
	target_node = "uneunet-main"
	hostname = "metrics"
	ostemplate = "local:vztmpl/ubuntu-24.04-standard_24.04-2_amd64.tar.zst"
	password = "password"
	unprivileged = true

	features {
		nesting = true
	}

	cores = 1
	memory = 512

	rootfs {
		storage = "local-lvm"
		size = "4G"
	}

	network {
		name = "eno1"
		bridge = "vmbr0"
		ip = "192.168.1.34/24"
		gw = "192.168.1.254"
	}
}

resource "proxmox_lxc" "tailscale" {
	target_node = "uneunet-main"
	hostname = "tailscale"
	ostemplate = "local:vztmpl/ubuntu-24.04-standard_24.04-2_amd64.tar.zst"
	password = "password"
	unprivileged = true

	cores = 1
	memory = 256

	rootfs {
		storage = "local-lvm"
		size = "4G"
	}

	network {
		name = "eno1"
		bridge = "vmbr0"
		ip = "192.168.1.35/24"
		gw = "192.168.1.254"
	}
}

