Rivendell - Spintron Update
===========================

WMFO - Tufts Freeform Radio  
ops@wmfo.org  
For copyrights and licensing, see TERMS and COPYING.  

This is a Rivendell Loadable Module made to report the current playing song
metadata to Spinitron. It was orginally made for Rivendell 1.5 and has been
updated to work with Rivendell 2.

Before use, revert to the latest known good version. These are numbered using `git tag`.  
Add your Spinitron credentials to credentials-dummy.h and rename it credentials.h.  
You may also need to change the symlink rlm.h to point to the correct location in your install.  
If you don't want to log the cart number in the notes field, change LOG_CART_NUM to 0.  
Compile using `make all` to produce rlm_spinitron.rlm.  
Optionally, install the file to another directory with `make install`.  
Runtime configurtaion is done at RDAdmin->ManageHosts->select the host->Edit->
RDAirplay->EditNow&NextData and specify the path to the file. Restart RDAirplay.

Please note: when the on-air signal is on, the module posts to the current
playlist of the active Spinitron user; when it is off, it posts to the account
provided in the parameters. This was made to support automated playback when no
'live' Spinitron user is logged in. It effectively logs all automated playlists
under a 'fake' automated user. This user should be set up in Spinitron just
like a regular user. We use a Macro cart on the Rivendell cart screen to turn
Automation 'on' or 'off' and switch between the active DJ and the automation
user. You may need to ask Tom at Spinitron to enable automation access (we had
to, but the automation integration was in beta then).

Changelog
---------
###05/12/11
Initial version. - Benjamin Yu and Eric Berg

###07/12/12
Move credentials to new file, prepare documentation, Makefile.
As few modifications as possible. - Max Goldstein

###07/15/12
Refactor code, particularly for safe string functions. - Max Goldstein

###07/29/12
Fix bug where sepcial characters such as `&` would not be escaped properly.
Makefile now keeps a backup during install and replaces it on uninstall. - Max Goldstein

###08/12/12
Fix bug where script would never log as DJ with open playlist. curl now
times out instead of freezing RDAirplay. - Max Goldstein

###9/25/12
Restrict access to files containing credentials automatically in the Makefile. - Max Goldstein

###10/13/12
Add logging cart number to notes field. - Max Goldstein

###10/15/12
Add tag for known-good commit. Update README. - Max Goldstein

###11/21/12
New known-good commit. Optionally logs cart numbers, curl times out. - Max Goldstein
