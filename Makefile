export MAYA_BIN = C:\Program Files\Autodesk\Maya2022\bin
export MAYA_PY = ${MAYA_BIN}/mayapy.exe

.PHONY: clean dist publish test_publish

clean:
	rm -rf "build"
	rm -rf "dist"

dist: clean
	"${MAYA_PY}" -m pip install 'twine>=1.5.0'
	#"${MAYA_PY}" setup.py sdist bdist_wheel
	#"${MAYA_PY}" setup.py sdist
	"${MAYA_PY}" setup.py bdist_wheel

publish: dist
	"${MAYA_PY}" -m twine upload --repository pypi dist/*

test_publish: dist
	"${MAYA_PY}" -m twine upload --repository testpypi dist/*
