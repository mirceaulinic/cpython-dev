cpython-dev
===========

Docker dev environment for CPython.

Getting started
---------------

1. Clone the CPython repo:

.. code-block:: bash

    git clone git@github.com:python/cpython.git

2. Clone this repo (or not):

.. code-block:: bash

    git clone git@github.com:mirceaulinic/cpython-dev.git

Build a new image
-----------------

Should you need, run ``make build``, eventually under a different tag should 
you prefer, e.g., ``make build TAG=user/cpython-env:test``.

Running the dev environment
---------------------------

Executing ``make run`` assumes that the local clone of the `CPython repository 
<https://github.com/python/cpython>`__ is available at the same relative path 
from the parent dir (i.e., available at ``cd ../cpython`` from this dir). 

Otherwise you'd have to run passing the ``CPYTHON_DIR`` variable, e.g.,
``make run CPYTHON_DIR=/path/to/cpython``.

Compile and use
---------------

Once you run ``make run``, you're positioned inside the container, under the 
``/cpython`` directory, from where you can compile the CPython source code, and
start having fun:

.. code-block:: bash

    root@61704c5a2ff5:/cpython# ./configure --with-pydebug
    ...
    ... snip ...
    ...
 
.. code-block:: bash

    root@61704c5a2ff5:/cpython# make -j2 -s
    CC='gcc -pthread' LDSHARED='gcc -pthread -shared    ' OPT='-g -Og -Wall' 	_TCLTK_INCLUDES='' _TCLTK_LIBS='' 	./python -E ./setup.py -q build

    Python build finished successfully!

.. code-block:: bash

    root@61704c5a2ff5:/cpython# ./python
    Python 3.9.0a0 (default, Aug 28 2019, 12:23:04) 
    [GCC 6.3.0 20170516] on linux
    Type "help", "copyright", "credits" or "license" for more information.
    >>>

Whenever you make any code changes in your local CPython clone, you'd need to 
run the above to re-compile the Python code.
