import vim
from functools import partial


from inflection import inflection


def _dispatch(name):
    if name == "uppercase":
        return str.upper

    if name == "lowercase":
        return str.lower
    if name == "underscore":
        return inflection.underscore
    if name == "camelize":
        return partial(inflection.camelize, uppercase_first_letter=False)
    if name == "Camelize":
        return partial(inflection.camelize, uppercase_first_letter=True)
    if name == "dasherize":
        return inflection.dasherize
    if name == "humanize":
        return inflection.humanize
    if name == "ordinal":
        return inflection.ordinal

    if name == "ordinalize":
        return inflection.ordinalize
    if name == "parameterize":
        return inflection.parameterize

    if name == "pluralize":
        return inflection.pluralize
    if name == "singularize":
        return inflection.singularize
    if name == "tableize":
        return inflection.tableize
    if name == "titleize":
        return inflection.titleize


def inflect_current_word(to_format):
    func = _dispatch(to_format)
    current_word = vim.eval('expand("<cword>")')
    new_word = func(current_word)
    vim.command("normal! ciW{}".format(new_word))
