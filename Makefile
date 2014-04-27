HTDOCS = htdocs
IMAGES = img/*
PRODUCTION = hhsw.de@ssh.strato.de:sites/proto/ld29/
OPTIONS = --recursive \
	--links \
	--update \
	--delete-after \
	--times \
	--compress

production: atlas
	rsync $(OPTIONS) \
		$(HTDOCS)/* \
		$(PRODUCTION)

atlas: $(IMAGES)
	cd $(HTDOCS) && BORDER=2 DONT_TRIM=1 mkatlas \
		../$(IMAGES) | patchatlas index.html
