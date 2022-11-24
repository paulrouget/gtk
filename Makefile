SHELL := bash
.ONESHELL:
.SHELLFLAGS := -eu -o pipefail -c
MAKEFLAGS += --warn-undefined-variables
MAKEFLAGS += --no-builtin-rules

.PHONY: build

DESTDIR=/tmp/gtk-local/

clean:
	rm -r build ../libadwaita/build

build-gtk:
	meson setup --prefix ${DESTDIR} build \
			-Dgtk_doc=false \
			-Dman-pages=true \
			-Dintrospection=enabled \
			-Dbuild-examples=true \
			-Dbuild-tests=false \
			-Dmedia-gstreamer=disabled \
			-Dx11-backend=false \
			-Dmacos-backend=true
	meson compile -C build -v
	meson install -C build

build-adw:
	cd ../libadwaita/
	export PKG_CONFIG_PATH=${DESTDIR}/lib/pkgconfig/
	meson setup --prefix ${DESTDIR} build -Dtests=false
	meson compile -C build -v
	meson install -C build

build-app:
	cd ~/git/gtk-todo-demo/
	make build

run:
	cd ~/git/gtk-todo-demo/
	make run

build: build-gtk build-adw build-app

check:
	git diff -U0 --no-color HEAD~ | .gitlab-ci/clang-format-diff.py -binary "clang-format" -p1
