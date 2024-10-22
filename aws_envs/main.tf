# First file for openTofu Code related to the workload.
resource "aws_vpc" "test" {
cidr_block = "10.55.0.0/16"

}