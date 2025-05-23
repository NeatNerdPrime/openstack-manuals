.. _environment-ntp-other:

============
 Other nodes
============

Other nodes reference the controller node for clock synchronization.
Perform these steps on all other nodes.

Install and configure components
================================

1. Install the packages.

   For Ubuntu:

   .. code-block:: console

      # apt install chrony

   For RHEL or CentOS Stream:

   .. code-block:: console

      # dnf install chrony

2. Configure the ``chrony.conf`` file and comment out or remove all
   but one ``server`` key. Change it to reference the controller node.

   For RHEL or CentOS Stream, edit the ``/etc/chrony.conf`` file:

   .. code-block:: ini

      server controller iburst

   For RHEL/CentOS Stream in case of using firewalld don't forget to update firewall rules as follows:

   .. code-block:: console

      # firewall-cmd --permanent --add-service=ntp
      # firewall-cmd --reload

   For Ubuntu, edit the ``/etc/chrony/chrony.conf`` file:

   .. code-block:: ini

      server controller iburst

3. Comment out the ``pool 2.debian.pool.ntp.org offline iburst`` line.

4. Restart the NTP service.

   For Ubuntu:

   .. code-block:: console

      # service chrony restart

   For RHEL or CentOS Stream:

   .. code-block:: console

      # systemctl enable chronyd.service
      # systemctl start chronyd.service
