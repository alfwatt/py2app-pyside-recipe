# py2app TestDirectoryResrouce

Tries to package a py2app which imports PySide6

## Makefile

To clean:

	make clean
	
To debug:

	make debug
	
### Failure Modes

	make clean; make debug
	# ... py2app output ---
	Traceback (most recent call last):
  	File "/Users/alfwatt/Developer/utils/py2app-pyside-recipe/setup.py", line 14, in <module>
    	setup(
  	File "/Library/Frameworks/Python.framework/Versions/3.10/lib/python3.10/site-packages/setuptools/__init__.py", line 153, in setup
    	return distutils.core.setup(**attrs)
  	File "/Library/Frameworks/Python.framework/Versions/3.10/lib/python3.10/distutils/core.py", line 148, in setup
    	dist.run_commands()
  	File "/Library/Frameworks/Python.framework/Versions/3.10/lib/python3.10/distutils/dist.py", line 966, in run_commands
    	self.run_command(cmd)
  	File "/Library/Frameworks/Python.framework/Versions/3.10/lib/python3.10/distutils/dist.py", line 985, in run_command
    	cmd_obj.run()
  	File "/Library/Frameworks/Python.framework/Versions/3.10/lib/python3.10/site-packages/py2app/build_app.py", line 967, in run
    	self._run()
  	File "/Library/Frameworks/Python.framework/Versions/3.10/lib/python3.10/site-packages/py2app/build_app.py", line 1197, in _run
    	self.run_normal()
  	File "/Library/Frameworks/Python.framework/Versions/3.10/lib/python3.10/site-packages/py2app/build_app.py", line 1431, in run_normal
    	o = __import__(m)
  	File "shibokensupport/signature/loader.py", line 93, in feature_import
  	File "shibokensupport/feature.py", line 127, in feature_import
	IndexError: tuple index out of range
	make: *** [dist/TestPySideRecipe.app] Error 1

## License

This software is in the public domain
