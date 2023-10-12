# Sphinx

    pip install -U sphinx
    
    cd /path/to/project
    mkdir docs
    sphinx-quickstart

    make html
    
## needs

     pip install sphinxcontrib-needs
     pip install sphinxcontrib-plantuml
     
edit `conf.py`

    extensions = ['sphinxcontrib.plantuml', 'sphinxcontrib.needs'] 
   
    # add support for plantuml
    import os
    on_rtd = os.environ.get('READTHEDOCS') == 'True'
    if on_rtd:
        plantuml = 'java -Djava.awt.headless=true -jar /usr/share/plantuml/plantuml.jar'
    else:
        cwd = os.getcwd()
        plantuml = 'java -jar %s' % os.path.join(cwd, "utils/plantuml_beta.jar")

    # If we are running on windows, we need to manipulate the path,
    # otherwise plantuml will have problems.
    if os.name == "nt":
        plantuml = plantuml.replace("/", "\\")
        plantuml = plantuml.replace("\\", "\\\\")

    plantuml_output_format = 'png'
