VERSION_TAG=$(shell date +'%y.%m.%d')
PWD=$(shell pwd)

.PHONY: build bash detailed resume clean all

build:
	docker build -f build/Dockerfile -t tex:latest -t tex:$(VERSION_TAG) .

bash:
	docker run --rm -it -v $(PWD):/data tex:latest bash

detailed:
	docker run --rm -v $(PWD):/data tex:latest pdflatex -output-directory dist George_Messiha_detailed_resume.tex

resume:
	docker run --rm -v $(PWD):/data tex:latest pdflatex -output-directory dist George_Messiha_Resume.tex

clean:
	rm -f dist/*.aux dist/*.out dist/*.log

all: build detailed resume clean
