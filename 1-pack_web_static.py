#!/usr/bin/python3
"""
Module is a fabric script to genereate tgz archive
execute: fab -f 1-pack_web_static.py do_pack
"""

from fabric.api import local
import time


def do_pack():
    """
    Method generates .tgz archive from web_static folder
    """
    try:
        local("mkdir -p versions")
        local("tar -cvzf versions/web_static_{}.tgz web_static/".
              format(time.strftime("%Y%m%d%H%M%S")))
        return ("versions/web_static_{}.tgz".format(time.
                                                    strftime("%Y%m%d%H%M%S")))
    except:
        return None
