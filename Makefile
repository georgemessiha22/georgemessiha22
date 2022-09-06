VERSION_TAG=$(shell date +'%y.%m.%d')
PWD=$(shell pwd)

.PHONY: build detailed resume cover 

build:
	docker build -f build/Dockerfile -t tex:latest -t tex:$(VERSION_TAG) .

bash:
	docker run --rm -it -v $(PWD):/data tex:latest bash

detailed:
	docker run --rm -it -v $(PWD):/data tex:latest pdflatex George_Messiha_detailed_resume.tex

resume: 
	docker run --rm -it -v $(PWD):/data tex:latest pdflatex George_Messiha_Resume.tex

cover:
	docker run --rm -it -v $(PWD):/data tex:latest pdflatex George_Messiha_CoverLetter.tex

clean:
	rm -f *.aux *.out *.log

all: build detailed resume cover clean
