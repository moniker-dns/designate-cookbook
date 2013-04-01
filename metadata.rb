name             "moniker"
maintainer       "Kiall Mac Innes"
maintainer_email "kiall@hp.com"
license          "Apache 2.0"
description      "Installs/Configures Moniker"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.1.0"

depends          "apt"
depends          "database", "~> 1.3.12"