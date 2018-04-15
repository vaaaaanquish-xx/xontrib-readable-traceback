from setuptools import setup
from codecs import open
from os import path

here = path.abspath(path.dirname(__file__))
with open(path.join(here, 'README.md'), encoding='utf-8') as f:
    long_description = f.read()

install_requires = ['backtrace', 'colorama']

setup(
    name='xontrib-readable-traceback',
    version='0.2.2',
    description='Makc Traceback easier to see for xonsh.',
    long_description=long_description,
    url='https://github.com/vaaaaanquish/xontrib-readable-traceback',
    author='vaaaaanquish',
    author_email='6syun9@gmail.com',
    install_requires=install_requires,
    license='MIT',
    classifiers=[
        'Development Status :: 3 - Alpha',
        'License :: OSI Approved :: MIT License',
        'Programming Language :: Python :: 3',
        'Programming Language :: Python :: 3.5',
        'Programming Language :: Python :: 3.6',
    ],
    packages=['xontrib'],
    package_dir={'xontrib': 'xontrib'},
    package_data={'xontrib': ['*.xsh']},
    platforms='any',
)
