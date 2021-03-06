''' Set of commands to control path lookup and other hackey user-dependent quantities.
Although this doesn't solve the problem, at least I won't have to alter source code and 
instead can adjust all variables here.'''

import sys

#################
### CHANGE ME ###
#################
selected = 'ADAMS_LAB_PC'

# Set of possible computers to choose from.  LABPC2 is evelyn's main station next to adam's lab computer and
# also desktop by printer.
selections = ['ADAMS_LAB_PC', 'ADAMS_LAPTOP', 'LABPC', 'LAB_LAPTOP']

if selected not in selections:
    raise AttributeError('%s must be one of the following:"%s"'%(selected, ','.join(selections)))
                
### ImageJ path
imj_path={'ADAMS_LAB_PC':'/home/glue/Desktop/ImageJ/jre/bin/java -Xmx512m -jar /home/glue/Desktop/ImageJ/ij.jar',    
'ADAMS_LAPTOP':'/home/hugadams/Desktop/ImageJ/jre/bin/java -Xmx512m -jar /home/hugadams/Desktop/ImageJ/ij.jar',    
'LABPC':'/home/reeves/Desktop/ImageJ/jre/bin/java -Xmx512m -jar /home/reeves/Desktop/ImageJ/ij.jar',
'LAB_LAPTOP':'/home/lab3/Desktop/ImageJ/jre/bin/java -Xmx512m -jar /home/lab3/Desktop/ImageJ/ij.jar'}  

path_to_imagej=imj_path[selected]

### import pyrecord stuff
try:
    from pyrecords.Utilities.utils import from_file, to_dataframe, to_dic #From pyrecords
    from pyrecords.Utilities.utils import histogram as hcount #To avoid namespace conflicts
    from pyrecords.Core.immutablemanager import ImmutableManager
except ImportError:
    raise Exception("config.py failed to find imports; make sure you set your selection.")


