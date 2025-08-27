import datetime

project = 'RGES-PIT Pipeline Tools'
project_copyright = f'2025 - {datetime.datetime.now().year}, Greg Olmschenk'
author = 'Greg Olmschenk'
html_title = "RGES-PIT Pipeline Tools"


extensions = [
    "myst_parser",
    "sphinx.ext.autodoc",
    'sphinx_copybutton',
]

templates_path = ["_templates"]
exclude_patterns = []
source_suffix = [".rst", ".md"]

html_theme = 'furo'
html_static_path = ['_static']
