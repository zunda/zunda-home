default: verify
.PHONY: verify
verify:
	for html in *.html; do \
		sig=`basename $$html .html`.sig.txt; \
		echo $$html; \
		git diff --exit-code $$html $$sig && \
		gpg --verify $$sig $$html || exit 1 \
	; done
