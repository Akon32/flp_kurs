
name=SpreadSheet
installpath=/usr/bin/

build:
	ghc --make $(name)

run: build
	./$(name)

clean:
	rm -f *.o *.hi
	rm -f $(name)

release: build
	strip $(name)
	rm -f *.o *.hi

export: release
	tar -c ../flp_kurs | lzma -9 > ../flp_kurs-`date +%Y%m%d_%H%M%S`.tar.lzma

install: release
	cp -f $(name) $(installpath)$(name)

uninstall:
	rm -f $(installpath)$(name)

