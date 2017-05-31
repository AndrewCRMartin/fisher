Fisher Exact Test
=================

The fexact.c code is modified from Apophinia 
   http://apophenia.info/
which in turn came from the R source code.


Installation
------------

The program makes use of the GNU Scientific Library (GSL)
<http://www.gnu.org/software/gsl/>

If you have this installed already, you can modify the definition of
`GSLDIR` in the Makefile to point to this install - `GSLDIR` is the
directory comntaining the `lib` directory which in turn contains
`libgsl.a`.  If GSL isn't installed already, it will be downloaded and
installed for you in the directory specified by `GSLDIR` simply by
typing `make`.

To compile the `fisher` program, simply type:

    make


Testing
-------

You can test the program by typing:

    ./fisher test/test.chsq

You should obtain:

    p-value: 0.0173


