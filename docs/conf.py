# Configuration file for the Sphinx documentation builder.
#
# For the full list of built-in configuration values, see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html

# -- Project information -----------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#project-information

project = 'ItemIO'
author = 'edayot'
copyright='Erwan DAYOT'
release = '0.5.4'

# -- General configuration ---------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#general-configuration

source_suffix = ['.rst', '.md']
master_doc = 'index'
source_parsers = {
    '.md': 'recommonmark.parser.CommonMarkParser',
}

templates_path = ['_templates']
exclude_patterns = ['_build', 'Thumbs.db', '.DS_Store']

language = 'fr'

# -- Options for HTML output -------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#options-for-html-output

html_title = "ItemIO wiki"
html_theme = "furo"
html_favicon = "assets/pack.ico"
html_logo = "../pack.png"



extensions = [
    "myst_parser",
    "sphinx.ext.autodoc",
    "sphinx.ext.napoleon",
    "sphinx.ext.viewcode",
    "sphinx.ext.githubpages",
    "sphinx.ext.doctest",
    "sphinx.ext.intersphinx",
    "sphinx_design",
    ]
myst_enable_extensions = [
    "amsmath",
    "attrs_inline",
    "colon_fence",
    "deflist",
    "dollarmath",
    "fieldlist",
    "html_admonition",
    "html_image",
    "linkify",
    "replacements",
    "smartquotes",
    "strikethrough",
    "substitution",
    "tasklist",
]
myst_enable_extensions = ["substitution", "colon_fence"]


# -- Options for HTML output -------------------------------------------------


from pygments.styles.monokai import MonokaiStyle
from pygments.token import Keyword, Name, Comment, String, Error, Token, \
     Number, Operator, Generic, Whitespace, Punctuation, Other, Literal

class MyStyle(MonokaiStyle):
    background_color = "#1e1e1e"
    highlight_color = "#49483e"

    styles_modified = {
        Comment:                   "#57a64a",     

        Keyword.Constant:          "#d4d4d4",        
        Keyword.Namespace:         "#f92672",

        Operator:                  "#f92672",   

        Punctuation:               "#ffd700", 

        Name:                      "#f8f8f2", 
        Name.Attribute:            "#9cdcfe", 
        Name.Builtin:              "#d8a0df",        
        Name.Builtin.Pseudo:       "",        
        Name.Class:                "#a6e22e", 
        Name.Constant:             "#66d9ef", 
        Name.Decorator:            "#a6e22e", 
        Name.Entity:               "",        
        Name.Exception:            "#a6e22e", 
        Name.Function:             "#dcdcaa",

        Name.Other:                "#a6e22e", 
        Name.Tag:                  "#ce9178", 
        Name.Variable:             "#4ec9b0",

        Literal:                   "#ae81ff", 
        Literal.Date:              "#e6db74", 
        Literal.Number.Float:      "#b5cea8",   
        Literal.Number.Byte:       "#ce9178",            
    }
    styles=MonokaiStyle.styles.copy()
    for keys in styles_modified.keys():
        styles[keys] = styles_modified[keys]
        


def pygments_monkeypatch_style(mod_name, cls):
    import sys
    import pygments.styles
    cls_name = cls.__name__
    mod = type(__import__("os"))(mod_name)
    setattr(mod, cls_name, cls)
    setattr(pygments.styles, mod_name, mod)
    sys.modules["pygments.styles." + mod_name] = mod
    from pygments.styles import STYLE_MAP
    STYLE_MAP[mod_name] = mod_name + "::" + cls_name

pygments_monkeypatch_style("my_style", MyStyle)

pygments_style = 'my_style'
pygments_dark_style = 'my_style'

