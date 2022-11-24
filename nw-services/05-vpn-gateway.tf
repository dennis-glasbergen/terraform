# Create a public IP for the VPN Gateway
resource "azurerm_public_ip" "vpngw" {
  name                = "${var.rg_prefix}-vpngw-pubip"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  allocation_method   = "Dynamic"
  sku                 = "Basic"

  tags = var.tags
}

# Create VPN Gateway
resource "azurerm_virtual_network_gateway" "vpngw" {
  name                = "${var.rg_prefix}-vpngw"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  type     = "Vpn"
  vpn_type = "RouteBased"

  active_active = false
  enable_bgp    = false
  sku           = "VpnGw1"
  generation    = "Generation1"

  ip_configuration {
    name                          = "vnetGatewayConfig"
    public_ip_address_id          = azurerm_public_ip.vpngw.id
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = azurerm_subnet.gwsubnet.id
  }

  vpn_client_configuration {
    address_space = ["172.22.200.0/23"]

    root_certificate {
      name             = "DHL-Root-CA-1"
      public_cert_data = <<EOF
MIIDXzCCAkegAwIBAgILBAAAAAABIVhTCKIwDQYJKoZIhvcNAQELBQAwTDEgMB4G
A1UECxMXR2xvYmFsU2lnbiBSb290IENBIC0gUjMxEzARBgNVBAoTCkdsb2JhbFNp
Z24xEzARBgNVBAMTCkdsb2JhbFNpZ24wHhcNMDkwMzE4MTAwMDAwWhcNMjkwMzE4
MTAwMDAwWjBMMSAwHgYDVQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSMzETMBEG
A1UEChMKR2xvYmFsU2lnbjETMBEGA1UEAxMKR2xvYmFsU2lnbjCCASIwDQYJKoZI
hvcNAQEBBQADggEPADCCAQoCggEBAMwldpB5BngiFvXAg7aEyiie/QV2EcWtiHL8
RgJDx7KKnQRfJMsuS+FggkbhUqsMgUdwbN1k0ev1LKMPgj0MK66X17YUhhB5uzsT
gHeMCOFJ0mpiLx9e+pZo34knlTifBtc+ycsmWQ1z3rDI6SYOgxXG71uL0gRgykmm
KPZpO/bLyCiR5Z2KYVc3rHQU3HTgOu5yLy6c+9C7v/U9AOEGM+iCK65TpjoWc4zd
QQ4gOsC0p6Hpsk+QLjJg6VfLuQSSaGjlOCZgdbKfd/+RFO+uIEn8rUAVSNECMWEZ
XriX7613t2Saer9fwRPvm2L7DWzgVGkWqQPabumDk3F2xmmFghcCAwEAAaNCMEAw
DgYDVR0PAQH/BAQDAgEGMA8GA1UdEwEB/wQFMAMBAf8wHQYDVR0OBBYEFI/wS3+o
LkUkrk1Q+mOai97i3Ru8MA0GCSqGSIb3DQEBCwUAA4IBAQBLQNvAUKr+yAzv95ZU
RUm7lgAJQayzE4aGKAczymvmdLm6AC2upArT9fHxD4q/c2dKg8dEe3jgr25sbwMp
jjM5RcOO5LlXbKr8EpbsU8Yt5CRsuZRj+9xTaGdWPoO4zzUhw8lo/s7awlOqzJCK
6fBdRoyV3XpYKBovHd7NADdBj+1EbddTKJd+82cEHhXXipa0095MJ6RMG3NzdvQX
mcIfeg7jLQitChws/zyrVQ4PkX4268NXSb7hLi18YIvDQVETI53O9zJrlAGomecs
Mx86OyXShkDOOyyGeMlhLxS67ttVb9+E7gUJTb0o2HLO02JQZR7rkpeDMdmztcpH
WD9f
EOF
    }
    root_certificate {
      name             = "DHL-Root-CA-2"
      public_cert_data = <<EOF
MIIEpDCCA4ygAwIBAgIQeAMYWGakf/vHAnBwTN6H/zANBgkqhkiG9w0BAQsFADBM
MSAwHgYDVQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSMzETMBEGA1UEChMKR2xv
YmFsU2lnbjETMBEGA1UEAxMKR2xvYmFsU2lnbjAeFw0yMDA3MjgwMDAwMDBaFw0y
OTAzMTgwMDAwMDBaMEMxCzAJBgNVBAYTAkRFMRkwFwYDVQQKExBEZXV0c2NoZSBQ
b3N0IEFHMRkwFwYDVQQDExBEUERITCBVc2VyIENBIEk1MIIBIjANBgkqhkiG9w0B
AQEFAAOCAQ8AMIIBCgKCAQEAsEkP5rc6MYY06GDnqt5R1OVrmw+XWslTJhBT6InH
Xl9mJB5IkILkE19JeCeEpmfHcronCPWUPrKB0ij+DM6LnVt07IcKfDqvQdd6hlV9
bqGeA80laqacrtoNiJMo6XdtrQYEsPzAYMWwWZvBJAtfpST+wN9zVuUsNK7Kk+m1
zaYePK/a30p3tKRNK1F0mMckDem+EAnKDB4ll6R/pVJz6I0G2++yHpyfQ8OeOdMF
6cFWKAy0bW/BCFkJgJ8hDxd1RjAEj2NFKFvdzn5Au+MsHVpsC1P8vGYJ74FtIia8
6J2lZFmkRrrl1OQuQuv756aDCnENoTeW1O8RHyzkgYP9awIDAQABo4IBiTCCAYUw
DgYDVR0PAQH/BAQDAgGGMB0GA1UdJQQWMBQGCCsGAQUFBwMCBggrBgEFBQcDBDAS
BgNVHRMBAf8ECDAGAQH/AgEAMB0GA1UdDgQWBBTTtA8bB9x/fg7gAtrUVlIORpzJ
JzAfBgNVHSMEGDAWgBSP8Et/qC5FJK5NUPpjmove4t0bvDB6BggrBgEFBQcBAQRu
MGwwLQYIKwYBBQUHMAGGIWh0dHA6Ly9vY3NwLmdsb2JhbHNpZ24uY29tL3Jvb3Ry
MzA7BggrBgEFBQcwAoYvaHR0cDovL3NlY3VyZS5nbG9iYWxzaWduLmNvbS9jYWNl
cnQvcm9vdC1yMy5jcnQwNgYDVR0fBC8wLTAroCmgJ4YlaHR0cDovL2NybC5nbG9i
YWxzaWduLmNvbS9yb290LXIzLmNybDBMBgNVHSAERTBDMEEGCSsGAQQBoDIBKDA0
MDIGCCsGAQUFBwIBFiZodHRwczovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0
b3J5LzANBgkqhkiG9w0BAQsFAAOCAQEAlLVpOzNL7eG3Sm6u05CJxvNdPzcVBVOR
mJ4BB+PKGsYvT6/jV+Z9mzZypoG8LfqTCFTILXWBvyuvBkTFnqw9yfX/BT1U5ub7
in/n0Yjvey5tagYpIIVy1/JRI0kgeLUKSHsb6MqgvmSGc0fzDCxv/ZswlNUnhQPN
P4C+XfWIHkatx4kS8TgoLwX3KCZ/nTn1mjZHIzup31HQkEbO5166dEQl9QRxh+QS
k+4dzLQf6v8mE75Onzo6LlFxPg92kBaUt3HbH3ICXbJmrTMqIYHoZwZKF3Vxbcqx
wc862flXphovvp2NvYM3XNYHL3fofbJeWev0+JT+Bt2HKYn3VibObA==
EOF
    }
  }

  lifecycle {
    ignore_changes = [
      vpn_client_configuration
    ]
  }

  tags = var.tags

}
