# checkov

Checkov will read the Terraform files in this directory and complain about the `bad_disk` resource for not having a disk that is encrypted with a CSEK.

```
checkov -d .

       _               _              
   ___| |__   ___  ___| | _______   __
  / __| '_ \ / _ \/ __| |/ / _ \ \ / /
 | (__| | | |  __/ (__|   < (_) \ V / 
  \___|_| |_|\___|\___|_|\_\___/ \_/  
                                      
By bridgecrew.io | version: 2.3.110 

terraform scan results:

Passed checks: 1, Failed checks: 1, Skipped checks: 0

Check: CKV_GCP_37: "Ensure VM disks for critical VMs are encrypted with Customer Supplied Encryption Keys (CSEK)"
	PASSED for resource: google_compute_disk.good_disk
	File: /good-compute-disk.tf:2-14
	Guide: https://docs.bridgecrew.io/docs/bc_gcp_general_x
Check: CKV_GCP_37: "Ensure VM disks for critical VMs are encrypted with Customer Supplied Encryption Keys (CSEK)"
	FAILED for resource: google_compute_disk.bad_disk
	File: /bad-compute-disk.tf:2-11
	Guide: https://docs.bridgecrew.io/docs/bc_gcp_general_x

		2  | resource "google_compute_disk" "bad_disk" {
		3  |   name  = "evil-hello-atl-cloud-conf"
		4  |   type  = "pd-ssd"
		5  |   zone  = "us-central1-a"
		6  |   image = "debian-11-bullseye-v20220719"
		7  |   labels = {
		8  |     environment = "dev"
		9  |   }
		10 |   physical_block_size_bytes = 4096
		11 | }
```
