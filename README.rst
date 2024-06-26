=================
OpenStack Manuals
=================

This repository contains documentation for the OpenStack project.

For more details, see the `OpenStack Documentation Contributor
Guide <https://docs.openstack.org/doc-contrib-guide/>`_.

It includes these manuals:

* API Guide (Quick Start)
* Documentation Contributor Guide
* Installation Guide
* Virtual Machine Image Guide

In addition to the guides, this repository contains:

* docs.openstack.org contents: ``www``

Building
========

Various manuals are in subdirectories of the ``doc/`` directory.

Guides
------

Some pre-requisites are needed to build the guides. If you are using a Linux
operating system you can generate a report of missing local requirements with
the ``bindep`` command::

    $ tox -e bindep

All guides are in the RST format. You can use ``tox`` to prepare
virtual environment and build all guides (HTML only)::

    $ tox -e docs

You can also build a specific guide.

For example, to build *OpenStack Virtual Machine Image Guide*, use the
following command::

    $ tox -e build -- image-guide

You can find the root of the generated HTML documentation at::

    doc/image-guide/build/html/index.html

To build a specific guide with a PDF file, add a ``-pdf`` option like::

    $ tox -e build -- image-guide --pdf

The generated PDF file will be copied to the root directory of the
generated HTML documentation.

PDF builds are accomplished using LaTeX as an intermediate format. Currently,
you can generate a PDF file for a limited number of guides. The supported list
is maintained in the ``tools/build-all-rst.sh`` file.

If you get the error message ``make: xelatex: No such file or directory``, it
means your local environment does not have LaTeX installed. Read
`Getting LaTeX <https://www.latex-project.org/get/>`_ and
`Install dependencies for building documentation
<https://docs.openstack.org/doc-contrib-guide/docs-builds.html#install-dependencies-for-building-documentation>`_
for instructions.

Testing of changes and building of all manuals
==============================================

Install the Python tox package and run ``tox`` from the top-level
directory to use the same tests that are done as part of the OpenStack
CI jobs.

If you like to run individual tests, run:

* ``tox -e publishdocs`` - to actually build the manual; this also generates a
  directory ``publish-docs`` that contains the built files for inspection
* ``tox -e publishlang`` - to build translated manuals
* ``tox -e linters`` - to run the niceness tests, for example, to see extra
  whitespaces
* ``tox -e linkcheck`` - to run the tests for working remote URLs

The ``tox`` command uses the openstack-doc-tools package to run the
tests.


Generated files
---------------

Some documentation files are generated using tools. These files include
a ``do not edit`` header and should not be modified by hand.
Please see `Generated files
<https://docs.openstack.org/doc-contrib-guide/doc-tools.html>`_.


Bugs
====

Bugs should be filed on Launchpad, not GitHub:

https://bugs.launchpad.net/openstack-manuals


Release Notes
=============

https://docs.openstack.org/releasenotes/openstack-manuals


Installing
==========

Refer to https://docs.openstack.org to see where these documents are
published and to learn more about the OpenStack project.
