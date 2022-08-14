# Creates the filenames of `.css` files from `.less` files in the `stylesheets` directory.
CSS_FILES := $(patsubst %.less, %.css, $(wildcard ./stylesheets/*.less))
# Behind the scenes, `npm x lessc` locates the lessc executable and runs it.
LESSC = npm x lessc

all: css publish

css: $(CSS_FILES)

# Recipe to convert `.less`̉ files to `.css` format.
./stylesheets/%.css: stylesheets/%.less
	@echo "$< -> $@"
	$(LESSC) $< $@

# Recipe relying on publish.el (website specification) to publish the website.
publish: publish.el
	@echo "Publishing..."
	emacs --batch --load publish.el --funcall org-publish-all

# Recipe to clean the artifacts produced by the `publish` recipe.
clean:
	@echo "Cleaning up..."
	@rm -rvf public/
	@rm -rvf .timestamps
