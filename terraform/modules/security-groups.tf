
resource "aws_security_group" "security_group" {
    for_each = var.security_groups

    name = each.key
    description = each.value.desc
    vpc_id = aws_vpc.vpc.id

    dynamic "ingress" {
        for_each = each.value.ingress

        content {
          description = ingress.key
          from_port = ingress.value.from_port
          to_port = ingress.value.to_port
          protocol = ingress.value.protocol
          cidr_blocks = ingress.value.cidr_blocks
        }
    }

    dynamic "egress" {
        for_each = each.value.egress

        content {
          description = egress.key
          from_port = egress.value.from_port
          to_port = egress.value.to_port
          protocol = egress.value.protocol
          cidr_blocks = egress.value.cidr_blocks
        }
    }


}
