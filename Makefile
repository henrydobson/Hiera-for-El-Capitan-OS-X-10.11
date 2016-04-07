USE_PKGBUILD=1
include /usr/local/share/luggage/luggage.make
PACKAGE_VERSION=1.3.8
TITLE=hiera
PACKAGE_NAME=hiera
REVERSE_DOMAIN=com.pebbleit
PAYLOAD=\
	pack-hiera \
	pack-gemHiera \
	pack-rubyHiera \
	pack-varHiera

pack-hiera: l_usr_local_bin
	@sudo mkdir -p "${WORK_D}/usr/local/bin/"
	@sudo ${CP} -R hiera "${WORK_D}/usr/local/bin/hiera"
	@sudo chown -R root:admin "${WORK_D}/usr/local/bin/hiera"
	@sudo chmod -R 755 "${WORK_D}/usr/local/bin/hiera"

pack-gemHiera: l_Library
				@sudo mkdir -p "${WORK_D}/Library/Ruby/Gems/2.0.0/gems/hiera-3.0.1/"
				@sudo mkdir -p "${WORK_D}/Library/Ruby/Gems/2.0.0/specifications/"
				@sudo mkdir -p "${WORK_D}/Library/Ruby/Gems/2.0.0/cache/"
				@sudo mkdir -p "${WORK_D}/Library/Ruby/Gems/2.0.0/doc/hiera-3.0.1/"
				@sudo ${CP} -R libraryGems2GemsHiera-3.0.1/ "${WORK_D}/Library/Ruby/Gems/2.0.0/gems/hiera-3.0.1/"
				@sudo ${CP} -R libraryGems2Specifications/ "${WORK_D}/Library/Ruby/Gems/2.0.0/specifications/"
				@sudo ${CP} -R libraryGems2Cache/ "${WORK_D}/Library/Ruby/Gems/2.0.0/cache/"
				@sudo ${CP} -R libraryGems2DocHiera-3.0.1/ "${WORK_D}/Library/Ruby/Gems/2.0.0/doc/hiera-3.0.1/"

pack-rubyHiera: l_Library
				@sudo mkdir -p "${WORK_D}/Library/Ruby/Site/hiera/"
				@sudo ${CP} -R rubySiteHiera/ "${WORK_D}/Library/Ruby/Site/hiera/"
				@sudo chown -R root:wheel "${WORK_D}/Library/Ruby"
				@sudo chmod -R 755 "${WORK_D}/Library/Ruby"

pack-varHiera: l_var_lib
				@sudo mkdir -p "${WORK_D}/private/var/lib/hiera/"
				@sudo chown -R root:wheel "${WORK_D}/private/var/lib/hiera"
				@sudo chmod -R 755 "${WORK_D}/private/var/lib/hiera"
