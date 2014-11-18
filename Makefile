OBJDIR := $(shell readlink -f thumbs)
INFILES = $(shell find orig -name "*.jpg")
OBJS := $(addprefix $(OBJDIR)/, $(INFILES:.jpg=.jpg.jpg))

$(OBJDIR)/%.jpg.jpg : %.jpg
	@mkdir -p $(dir $@)
	vipsthumbnail -s 460x460 -t $< -o $@

all: $(OBJS) index.html

clean:
	rm -rf thumbs index.html

index.html:
	bash genindex.sh > index.html

host:
	python -m http.server
