default: verify
.PHONY: verify

verify:
	for b in `git ls-files | sed -n 's/\.html$$//p'`; do \
		echo "$$b.html"; \
		git diff --exit-code "$$b.sig.txt" "$$b.html" && \
		gpg --verify "$$b.sig.txt" "$$b.html" || exit 1 \
	; done
