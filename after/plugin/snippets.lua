local ls = require("luasnip")
local snip = ls.snippet
local node = ls.snippet_node
local insert = ls.insert_node
local text = ls.text_node

local func = ls.function_node
local choice = ls.choice_node
local dynamicn = ls.dynamic_node

local fmt = require('luasnip.extras.fmt').fmt
local rep = require('luasnip.extras').rep

local date = function()
    return { os.date('%Y-%m-%d') }
end

ls.add_snippets(nil, {
    all = {
        ls.parser.parse_snippet("expand", "-- this is what is expanded"),
        snip({
            trig = "curdate",
            namr = "Date",
            dscr = "Date in form YYYY-MM-DD",
        }, {
            func(date, {})
        }),
        snip({ trig = "todo", dscr = "Todo reminder" }, {
            text({ "TODO " }),
            insert(1),
            text({ " : " }),
            insert(0)

        }),
    },
    lua = {
        ls.parser.parse_snippet("lf", "local $1 = function($2)\n $0\nend"),
        ls.parser.parse_snippet("mf", "$1.$2 = function($3)\n $0\nend"),
        snip({
            trig = "ssnip",
            namr = "snippet",
            dscr = "snippet template",
        }, {
            text({ "snip({" }),
            text({ "", 'trig = "' }), insert(1, 'trig'), text({ '",' }),
            text({ "", 'namr = "' }), insert(2, 'name'), text({ '",' }),
            text({ "", 'dscr = "' }), insert(3, 'description'), text({ '",' }),
            text({ "", "}, {", "" }),
            insert(0, '-- snippet code'),
            text({ "", "})," }),
        }),
    },
    html = {
        snip({ trig = "hx", }, { text('{{ '), insert(0), text(' }}') }),
        snip({ trig = "hxx", }, { text('{{ .'), insert(0), text(' }}') }),
        snip({ trig = "hif", dscr = "If" }, { text('{{ if }} '), insert(0), text(' {{ end }}') }),
        snip({ trig = "hife", dscr = "If/Else" }, {
            text({ '{{ if ' }), insert(1), text({ ' }}', '' }),
            insert(2),
            text({ '', '{{ else }}' }),
            insert(3),
            text({ '', '{{ end }}' })
        }),

        -- "if-else": {
        --   "prefix": ["hife"],
        --   "body": ["{{ if $1 }}", "$2", "{{ else }}", "$3", "{{ end }}"],
        --   "description": "If/Else"
        -- },
        -- "with": {
        --   "prefix": ["hwith"],
        --   "body": ["{{ with }}", "$1", "{{ end }}"],
        --   "description": "With"
        -- },
        -- "with else": {
        --   "prefix": ["hwithe"],
        --   "body": ["{{ with }}", "$1", "{{ else }}", "$2", "{{ end }}"],
        --   "description": "With/Else"
        -- },
        -- "range": {
        --   "prefix": ["hrange"],
        --   "body": ["{{ range $1 }}", "$0", "{{ end }}"],
        --   "description": "Range"
        -- },
        -- "template": {
        --   "prefix": ["htemplate"],
        --   "body": ["{{ template \"$0\" . }}"],
        --   "description": "Partial"
        -- },
        -- "partial": {
        --   "prefix": ["hpartial"],
        --   "body": ["{{ partial \"$0\" . }}"],
        --   "description": "Partial"
        -- },
        -- "partial cached": {
        --   "prefix": ["hpartialc"],
        --   "body": ["{{ partialCached \"$0\" . variant }}"],
        --   "description": "partialCached"
        -- },
        -- "partial naked": {
        --   "prefix": ["hxpartial"],
        --   "body": ["partial \"$0\" ."],
        --   "description": "Naked partial"
        -- },
        -- "block": {
        --   "prefix": ["hblock"],
        --   "body": ["{{ block \"main\" . }}", "$0", "{{ end }}"],
        --   "description": "Block"
        -- },
        -- "define": {
        --   "prefix": ["hdefine"],
        --   "body": ["{{ define \"block\" }}", "$0", "{{ end }}"],
        --   "description": "Block define"
        -- },
        -- "scratch set": {
        --   "prefix": ["hscra"],
        --   "body": ["`{{ .Scratch.Set"],
        --   "description": "Scratch"
        -- },
        -- "print string": {
        --   "prefix": ["hstr"],
        --   "body": ["{{ printf \"Something about %s\" . }}"],
        --   "description": "String"
        -- },
        -- "printf": {
        --   "prefix": ["hprint"],
        --   "body": ["`printf \"%s\""],
        --   "description": "printF"
        -- },
        -- "vars": {
        --   "prefix": ["hvars"],
        --   "body": ["{{ $var := what }}"],
        --   "description": "Variable"
        -- },
        -- "return": {
        --   "prefix": ["hret"],
        --   "body": ["{{ return $return }}"],
        --   "description": "Return"
        -- },
        -- "debug": {
        --   "prefix": ["hdebug"],
        --   "body": ["{{ printf \"%#v\" . }}"],
        --   "description": "Debug"
        -- },
        -- "error": {
        --   "prefix": ["herror"],
        --   "body": ["{{ errorf \"%#v\" . }}"],
        --   "description": "Error"
        -- },
        -- "comment": {
        --   "prefix": ["hcomm"],
        --   "body": ["{{/* */}}"],
        --   "description": "Comment"
        -- },
        -- "unescape": {
        --   "prefix": ["hunescape"],
        --   "body": ["{{ unescape $0 }}"],
        --   "description": "Partial"
        -- }
    },
    javascript = {
        -- {
        --   "oodefine": {
        --     "prefix": ["oodefine"],
        --     "body": [
        --       "odoo.define('${1:module_name}', function (require) {",
        --       "\t\"use strict\";",
        --       "\t$0",
        --       "});"
        --     ],
        --     "definition": "Defining a module"
        --   },
        --   "oowidget": {
        --     "prefix": ["oowidget"],
        --     "body": [
        --       "var ${1:MyWidget} = Widget.extend({",
        --       "\ttemplate: 'MyQWebTemplate',",
        --       "\tevents: {",
        --       "\t},",
        --       "\t/**",
        --       "\t* @override",
        --       "\t*/",
        --       "\tinit: function (parent) {",
        --       "\t\tthis._super.apply(this, arguments);",
        --       "\t},",
        --       "\t/**",
        --       "\t* @override",
        --       "\t*/",
        --       "\twillStart: function () {",
        --       "\t\treturn this._super.apply(this, arguments);",
        --       "\t},",
        --       "\t/**",
        --       "\t* @override",
        --       "\t*/",
        --       "\tstart: function () {",
        --       "\t\treturn this._super.apply(this, arguments);",
        --       "\t},",
        --       "});"
        --     ],
        --     "definition": "Add widget"
        --   },
        --
        --   "oosuper": {
        --     "prefix": ["oosuper"],
        --     "body": ["this._super.apply(this, arguments);"],
        --     "definition": "Add super statement"
        --   },
        --
        --   "oorpc": {
        --     "prefix": ["oorpc"],
        --     "body": [
        --       "return this._rpc({",
        --       "\tmodel: '${1:model_name}',",
        --       "\tmethod: '${2:method_name}',",
        --       "\targs: [],",
        --       "\tcontext: {}",
        --       "}).then(function (result) {",
        --       "\t$0",
        --       "});"
        --     ],
        --     "definition": "Add rpc call"
        --   },
        --
        --   "oorpc_route": {
        --     "prefix": ["oorpc_route"],
        --     "body": [
        --       "return this._rpc({",
        --       "\troute: '${1:url}',",
        --       "\tparams: {",
        --       "\t\t${2:params}",
        --       "\t}",
        --       "}).then(function (result) {",
        --       "\t$0",
        --       "});"
        --     ],
        --     "definition": "Add route rpc call"
        --   },
        --
        --   "oodialog": {
        --     "prefix": ["oodialog"],
        --     "body": [
        --       "var MyDialog = Dialog.extend({",
        --       "\ttemplate: '${1:My.Dialog}',",
        --       "\t/**",
        --       "\t* @override",
        --       "\t*/",
        --       "\tinit: function (parent) {",
        --       "\t\tthis._super(parent, {",
        --       "\t\t\ttitle: _t(\"${2:title}\"),",
        --       "\t\t\tsize: '${3:large}',",
        --       "\t\t\tbuttons: [{",
        --       "\t\t\t\ttext: _t(\"Save\"),",
        --       "\t\t\t\tclose: true,",
        --       "\t\t\t\tclasses: 'btn-primary',",
        --       "\t\t\t\tclick: function () {",
        --       "\t\t\t\t\t$0",
        --       "\t\t\t\t}",
        --       "\t\t\t}, {",
        --       "\t\t\t\ttext: _t(\"Discard\"),",
        --       "\t\t\t\tclose: true,",
        --       "\t\t\t}],",
        --       "\t\t});",
        --       "\t},",
        --       "\t/**",
        --       "\t* @override",
        --       "\t*/",
        --       "\twillStart: function () {",
        --       "\t\treturn this._super.apply(this, arguments);",
        --       "\t},",
        --       "\t/**",
        --       "\t* @override",
        --       "\t*/",
        --       "\tstart: function () {",
        --       "\t\treturn this._super.apply(this, arguments);",
        --       "\t},",
        --       "});"
        --     ],
        --     "definition": "Add dialog widget"
        --   },
        --
        --   "ooalert": {
        --     "prefix": ["ooalert"],
        --     "body": [
        --       "Dialog.alert(this, _t(\"${1:message}\"), {",
        --       "\t${2:title}: _t(\"$2\"),",
        --       "\tconfirm_callback: function () {",
        --       "\t\t$0",
        --       "\t},",
        --       "});"
        --     ],
        --     "definition": "Add alert dialog"
        --   },
        --
        --   "ooconfirm": {
        --     "prefix": ["ooconfirm"],
        --     "body": [
        --       "Dialog.confirm(this, _t(\"${1:message}\"), {",
        --       "\t${2:title}: _t(\"$2\"),",
        --       "\tconfirm_callback: function () {",
        --       "\t\t$0",
        --       "\t},",
        --       "\tcancel_callback: function () {",
        --       "\t},",
        --       "});"
        --     ],
        --     "definition": "Add confirm dialog"
        --   },
        --
        --   "conslog": {
        --     "prefix": ["conslog"],
        --     "body": ["console.log($0);"],
        --     "definition": "console log out"
        --   },
        --
        --   "constab": {
        --     "prefix": ["constab"],
        --     "body": ["console.table($0);"],
        --     "definition": "console table out"
        --   }
        -- }


    },
    json = {
        snip("vsnip", fmt('local {} = function({})\n{}\nend', {
            insert(1),
            insert(2),
            insert(0),
        }))
    },
    markdown = {
        --         {
        --   "hshort": {
        --     "prefix": ["hshort"],
        --     "body": ["{{< $1 \"$2\" >}}"],
        --     "description": "shortcode"
        --   }
        -- }

    },
    python = {
        --         {
        --   "odoo": { "prefix": ["odoo"], "body": [""], "description": "" },
        --   "python env": {
        --     "prefix": ["sb"],
        --     "body": ["#!/usr/bin/env python"],
        --     "description": ""
        --   },
        --   "python3 env": {
        --     "prefix": ["sb3"],
        --     "body": ["#!/usr/bin/env python3"],
        --     "description": ""
        --   },
        --   "unicode": {
        --     "prefix": ["ucode"],
        --     "body": ["# -*- coding: utf-8 -*-"],
        --     "description": ""
        --   },
        --   "odoo manifest": {
        --     "prefix": ["oomanifest"],
        --     "body": [
        --       "{",
        --       "'name': '$1',",
        --       "'version': '1.0',",
        --       "'description': '$2',",
        --       "'summary': '$2',",
        --       "'author': '$3',",
        --       "'website': '',",
        --       "'license': 'AGPL-3',",
        --       "'category': '',",
        --       "'maintainer': '',",
        --       "'contributors': [",
        --       "'',",
        --       "],",
        --       "'depends': [",
        --       "''",
        --       "],",
        --       "'data': [",
        --       "''",
        --       "],",
        --       "'demo': [",
        --       "''",
        --       "],",
        --       "'auto_install': True,",
        --       "'application': True,",
        --       "}"
        --     ],
        --     "description": "add manifest"
        --   },
        --
        --   "from import": {
        --     "prefix": ["oofimport"],
        --     "body": ["from . import ${1:names}"],
        --     "description": "add from import"
        --   },
        --
        --   "odoo import": {
        --     "prefix": ["ooimport"],
        --     "body": ["from odoo import _, api, fields, models, tools"],
        --     "description": "add default oddoo imports"
        --   },
        --
        --   "from models": {
        --     "prefix": ["oofile"],
        --     "body": ["from . import models"],
        --     "description": ""
        --   },
        --
        --   "oomodel": {
        --     "prefix": ["oomodel"],
        --     "body": [
        --       "class ${1:ModuleName}(models.Model):",
        --       "\t_name = '${2:module.name}'",
        --       "\t_description = '${3:description}'",
        --       "\t$0"
        --     ],
        --     "description": "add model"
        --   },
        --
        --   "oomodeli": {
        --     "prefix": ["oomodeli"],
        --     "body": [
        --       "class ${1:ModuleName}(models.Model):",
        --       "\t_inherit = '${2:module.name}'",
        --       "\tname = fields.Char(string='${3:name}')",
        --       "\t$0"
        --     ],
        --     "description": "inherit existing model"
        --   },
        --
        --   "oofboolean": {
        --     "prefix": ["oofboolean"],
        --     "body": ["${1:field_name} = fields.Boolean(string='$0',help='')"],
        --     "description": "add boolean field"
        --   },
        --
        --   "oofbinary": {
        --     "prefix": ["oofbinary"],
        --     "body": ["${1:field_name} = fields.Binary(string='$0')"],
        --     "description": "add binary field"
        --   },
        --
        --   "ooattachment": {
        --     "prefix": ["ooattachment"],
        --     "body": [
        --       "attachment = fields.Binary(string='attachment', attachment=True)"
        --     ],
        --     "description": "add attachment field"
        --   },
        --
        --   "oofchar": {
        --     "prefix": ["oofchar"],
        --     "body": ["${1:field_name} = fields.Char(string='$0')"],
        --     "description": "add char field"
        --   },
        --
        --   "ooftext": {
        --     "prefix": ["ooftext"],
        --     "body": ["${1:field_name} = fields.Text(string='$0')"],
        --     "description": "add text field"
        --   },
        --
        --   "oofhtml": {
        --     "prefix": ["oofhtml"],
        --     "body": ["${1:field_name} = fields.Html(string='$0')"],
        --     "description": "add html field"
        --   },
        --
        --   "oofinteger": {
        --     "prefix": ["oofinteger"],
        --     "body": ["${1:field_name} = fields.Integer(string='$0')"],
        --     "description": "add integer field"
        --   },
        --
        --   "ooffloat": {
        --     "prefix": ["ooffloat"],
        --     "body": [
        --       "${1:field_name} = fields.Float(string='$0', digits=(${2:total}, ${3:decimal}))"
        --     ],
        --     "description": "add float field"
        --   },
        --
        --   "oofmonetary": {
        --     "prefix": ["oofmonetary"],
        --     "body": ["${1:field_name} = fields.Monetary(string='$0')"],
        --     "description": "add monetary field"
        --   },
        --
        --   "oofdate": {
        --     "prefix": ["oofdate"],
        --     "body": [
        --       "${1:field_name} = fields.Date(string='$0',${2:default=fields.Date.context_today})"
        --     ],
        --     "description": "add date field"
        --   },
        --
        --   "oofdatetime": {
        --     "prefix": ["oofdatetime"],
        --     "body": [
        --       "${1:field_name} = fields.DateTime(string='$0',${2:default=fields.Datetime.now})"
        --     ],
        --     "description": "add datetime field"
        --   },
        --
        --   "oofselection": {
        --     "prefix": ["oofselection"],
        --     "body": [
        --       "${1:field_name} = fields.Selection([",
        --       "('${2:key}', '${3:value}')",
        --       "], string='$0', default='', help='')"
        --     ],
        --     "description": "add selection field"
        --   },
        --
        --   "oofmany2one": {
        --     "prefix": ["oofmany2one"],
        --     "body": [
        --       "${1:field_name} = fields.Many2one('${2:comodel_name}', string='$0', ${3:ondelete='restrict'}, ${4:required=True}, help='')"
        --     ],
        --     "description": "add many2one field"
        --   },
        --
        --   "oofone2many": {
        --     "prefix": ["oofone2many"],
        --     "body": [
        --       "${1:field_name} = fields.One2many('${2:comodel_name}', '${3:inverse_field}', string='$0')"
        --     ],
        --     "description": "add one2many field"
        --   },
        --
        --   "oofmany2many": {
        --     "prefix": ["oofmany2many"],
        --     "body": [
        --       "${1:field_name} = fields.Many2many('${2:comodel_name}', string='$0')"
        --     ],
        --     "description": "add many2many field"
        --   },
        --
        --   "oofcompute": {
        --     "prefix": ["oofcompute"],
        --     "body": [
        --       "${1:field_name} = fields.Char(compute='_compute_${1:field_name}', string='$2')",
        --       "@api.depends('$0')",
        --       "def _compute_${1:field_name}(self):",
        --       "\tpass"
        --     ],
        --     "description": "add compute field"
        --   },
        --
        --   "oofcomputei": {
        --     "prefix": ["oofcomputei"],
        --     "body": [
        --       "${1:field_name} = fields.Char(compute='_compute_${1:field_name}', inverse='_inverse_${1:field_name}', string='')",
        --       "@api.depends('')",
        --       "def _compute_${1:field_name}(self):",
        --       "\tpass",
        --       "def _inverse_${1:field_name}(self):",
        --       "\tpass"
        --     ],
        --     "description": "add compute field with inverse method"
        --   },
        --
        --   "oofcomputeex": {
        --     "prefix": ["oofcomputeex"],
        --     "body": [
        --       "${1:field_name} = fields.Char(compute='_compute_${1:field_name}', inverse='_inverse_${1:field_name}', search='_search_${1:field_name}', string='')",
        --
        --       "@api.depends('')",
        --       "def _compute_${1:field_name}(self):",
        --       "\tpass",
        --       "def _inverse_${1:field_name}(self):",
        --       "\tpass",
        --       "def _search_${1:field_name}(self, operator, value):",
        --       "\tpass"
        --     ],
        --     "description": "add extended compute method"
        --   },
        --
        --   "oocreate": {
        --     "prefix": ["oocreate"],
        --     "body": [
        --       "@api.model",
        --       "def create(self, ${1:vals}):",
        --       "\treturn super().create($1)"
        --     ],
        --     "description": "add create method"
        --   },
        --
        --   "oonameget": {
        --     "prefix": ["oonameget"],
        --     "body": ["def name_get(self):", "\tpass"],
        --     "description": "override name get method"
        --   },
        --
        --   "oonamesearch": {
        --     "prefix": ["oonamesearch"],
        --     "body": [
        --       "@api.model",
        --       "def _name_search(self, name, args=None, operator='ilike', limit=100, name_get_uid=None):",
        --       "\tpass"
        --     ],
        --     "description": "override private name search method"
        --   },
        --
        --   "oowrite": {
        --     "prefix": ["oowrite"],
        --     "body": ["def write(self, ${1:vals}):", "\treturn super().write($1)"],
        --     "description": "add write method"
        --   },
        --
        --   "oocopy": {
        --     "prefix": ["oocopy"],
        --     "body": [
        --       "def copy(self, default=None):",
        --       "\tres = super().copy(default)",
        --       "\t$0",
        --       "\treturn res"
        --     ],
        --     "description": "add copy method"
        --   },
        --
        --   "oofonchange": {
        --     "prefix": ["oofonchange"],
        --     "body": ["@api.onchange('$0')", "def _onchange_(self):", "\tpass"],
        --     "description": "add onchange field"
        --   },
        --
        --   "oofconstrains": {
        --     "prefix": ["oofconstrains"],
        --     "body": [
        --       "@api.constrains('${1:fieldname}')",
        --       "def _constrains_${1:fieldname}(self):",
        --       "\tpass"
        --     ],
        --     "description": "add constains to field"
        --   },
        --
        --   "oounlink": {
        --     "prefix": ["oounlink"],
        --     "body": ["def unlink(self):", "\treturn super().unlink()"],
        --     "description": "add unlink method"
        --   },
        --
        --   "oologger": {
        --     "prefix": ["oologger"],
        --     "body": ["import logging", "_logger = logging.getLogger(__name__)"],
        --     "description": "import logger"
        --   },
        --
        --   "oologinfo": {
        --     "prefix": ["oologinfo"],
        --     "body": ["_logger.info(\"$0\")"],
        --     "description": "log info message"
        --   },
        --
        --   "oologdebug": {
        --     "prefix": ["oologdebug"],
        --     "body": ["_logger.debug(\"$0\")"],
        --     "description": "log debug message"
        --   },
        --
        --   "oologerror": {
        --     "prefix": ["oologerror"],
        --     "body": ["_logger.error(\"$0\")"],
        --     "description": "log error message"
        --   },
        --
        --   "ootests": {
        --     "prefix": ["ootests"],
        --     "body": ["from odoo.tests import common"],
        --     "description": "import odoo unit tests"
        --   },
        --
        --   "ootesttrx": {
        --     "prefix": ["ootesttrx"],
        --     "body": [
        --       "class ${1:ModuleName}Tests(common.TransactionCase):",
        --       "\tdef test_(self):",
        --       "\t\tpass",
        --       "\tdef setUp(self):",
        --       "\t\tsuper($1, self).setUp()",
        --       "\tdef test_item_name(self):",
        --       "\t\t\"\"\" Checks if the item_name works properly \"\"\"",
        --       "\t\tpass",
        --       "\t$0"
        --     ],
        --     "description": "generate odoo transaction test case"
        --   },
        --
        --   "ooaddTypeEqualityFunc": {
        --     "prefix": ["ooaddTypeEqualityFunc"],
        --     "body": ["addTypeEqualityFunc(typeobj, function)"],
        --     "description": ""
        --   },
        --
        --   "ooassertAlmostEqual": {
        --     "prefix": ["ooassertAlmostEqual"],
        --     "body": [
        --       "assertAlmostEqual(first, second, places=7, msg=None, delta=None)"
        --     ],
        --     "description": ""
        --   },
        --
        --   "ooassertDictContainsSubset": {
        --     "prefix": ["ooassertDictContainsSubset"],
        --     "body": ["assertDictContainsSubset(expected, actual, msg=None)"],
        --     "description": ""
        --   },
        --
        --   "ooassertDictEqual": {
        --     "prefix": ["ooassertDictEqual"],
        --     "body": ["assertDictEqual(expected, actual, msg=None)"],
        --     "description": ""
        --   },
        --
        --   "ooassertEqual": {
        --     "prefix": ["ooassertEqual"],
        --     "body": ["assertEqual(first, second, msg=None)"],
        --     "description": ""
        --   },
        --
        --   "ooassertFalse": {
        --     "prefix": ["ooassertFalse"],
        --     "body": ["assertFalse(expr, msg=None)"],
        --     "description": ""
        --   },
        --
        --   "ooassertGreater": {
        --     "prefix": ["ooassertGreater"],
        --     "body": ["assertGreater(first, second, msg=None)"],
        --     "description": ""
        --   },
        --
        --   "ooassertGreaterEqual": {
        --     "prefix": ["ooassertGreaterEqual"],
        --     "body": ["assertGreaterEqual(first, second, msg=None)"],
        --     "description": ""
        --   },
        --
        --   "ooassertIn": {
        --     "prefix": ["ooassertIn"],
        --     "body": ["assertIn(first, second, msg=None)"],
        --     "description": "assertIn"
        --   },
        --
        --   "ooassertIs": {
        --     "prefix": ["ooassertIs"],
        --     "body": ["assertIs(first, second, msg=None)"],
        --     "description": "assertIs"
        --   },
        --
        --   "ooassertIsInstance": {
        --     "prefix": ["ooassertIsInstance"],
        --     "body": ["assertIsInstance(obj, cls, msg=None)"],
        --     "description": ""
        --   },
        --
        --   "ooassertIsNone": {
        --     "prefix": ["ooassertIsNone"],
        --     "body": ["assertIsNone(expr, msg=None)"],
        --     "description": ""
        --   },
        --
        --   "ooassertIsNot": {
        --     "prefix": ["ooassertIsNot"],
        --     "body": ["assertIsNot(first, second, msg=None)"],
        --     "description": ""
        --   },
        --
        --   "ooassertIsNotNone": {
        --     "prefix": ["ooassertIsNotNone"],
        --     "body": ["assertIsNotNone(expr, msg=None)"],
        --     "description": ""
        --   },
        --
        --   "ooassertItemsEqual": {
        --     "prefix": ["ooassertItemsEqual"],
        --     "body": ["assertItemsEqual(actual, expected, msg=None)"],
        --     "description": ""
        --   },
        --
        --   "ooassertLess": {
        --     "prefix": ["ooassertLess"],
        --     "body": ["assertLess(first, second, msg=None)"],
        --     "description": ""
        --   },
        --
        --   "ooassertLessEqual": {
        --     "prefix": ["ooassertLessEqual"],
        --     "body": ["assertLessEqual(first, second, msg=None)"],
        --     "description": ""
        --   },
        --
        --   "ooassertListEqual": {
        --     "prefix": ["ooassertListEqual"],
        --     "body": ["assertListEqual(list1, list2, msg=None)"],
        --     "description": ""
        --   },
        --
        --   "ooassertMultiLineEqual": {
        --     "prefix": ["ooassertMultiLineEqual"],
        --     "body": ["assertMultiLineEqual(first, second, msg=None)"],
        --     "description": ""
        --   },
        --
        --   "ooassertNotAlmostEqual": {
        --     "prefix": ["ooassertNotAlmostEqual"],
        --     "body": [
        --       "assertNotAlmostEqual(first, second, places=7, msg=None, delta=None)"
        --     ],
        --     "description": ""
        --   },
        --
        --   "ooassertNotEqual": {
        --     "prefix": ["ooassertNotEqual"],
        --     "body": ["assertNotEqual(first, second, msg=None)"],
        --     "description": ""
        --   },
        --
        --   "ooassertNotIn": {
        --     "prefix": ["ooassertNotIn"],
        --     "body": ["assertNotIn(first, second, msg=None)"],
        --     "description": ""
        --   },
        --
        --   "ooassertNotIsInstance": {
        --     "prefix": ["ooassertNotIsInstance"],
        --     "body": ["assertNotIsInstance(obj, cls, msg=None)"],
        --     "description": ""
        --   },
        --
        --   "ooassertNotRegexpMatches": {
        --     "prefix": ["ooassertNotRegexpMatches"],
        --     "body": ["assertNotRegexpMatches(text, regexp, msg=None)"],
        --     "description": ""
        --   },
        --
        --   "ooassertRaises": {
        --     "prefix": ["ooassertRaises"],
        --     "body": ["assertRaises(exception, callable, *args, **kwds)"],
        --     "description": "assertRaises"
        --   },
        --
        --   "ooassertRaisesRegexp": {
        --     "prefix": ["ooassertRaisesRegexp"],
        --     "body": ["assertRaisesRegexp(exception, regexp, callable, *args, **kwds)"],
        --     "description": "assertRaisesRegexp"
        --   },
        --
        --   "ooassertRegexpMatches": {
        --     "prefix": ["ooassertRegexpMatches"],
        --     "body": ["assertRegexpMatches(text, regexp, msg=None)"],
        --     "description": "assertRegexpMatches"
        --   },
        --
        --   "ooassertSequenceEqual": {
        --     "prefix": ["ooassertSequenceEqual"],
        --     "body": ["assertSequenceEqual(seq1, seq2, msg=None, seq_type=None)"],
        --     "description": "assertSequenceEqual"
        --   },
        --
        --   "ooassertSetEqual": {
        --     "prefix": ["ooassertSetEqual"],
        --     "body": ["assertSetEqual(set1, set2, msg=None)"],
        --     "description": "assertSetEqual"
        --   },
        --
        --   "ooassertTrue": {
        --     "prefix": ["ooassertTrue"],
        --     "body": ["assertTrue(expr, msg=None)"],
        --     "description": "assertTrue"
        --   },
        --
        --   "ooassertTupleEqual": {
        --     "prefix": ["ooassertTupleEqual"],
        --     "body": ["assertTupleEqual(tuple1, tuple2, msg=None)"],
        --     "description": "assertTupleEqual"
        --   }
        -- }

    },
    xml = {
        snip({
            trig = "ooodoo",
            dscr = "add odoo namespace"
        }, {
            text({ "<odoo>", "" }),
            insert(0),
            text({ "", "</odoo>" })
        }),
        snip({
            trig = "ooxodoo",
            namr = "ooxodoo",
            dscr = "add xml odoo namespace",
        }, {
            text({ '<?xml version="1.0" encoding="utf-8"?>', '<odoo>', '' }),
            insert(0),
            text({ '', '</odoo>' }),
        }),
        snip({
            trig = "oodata",
            namr = "oodata",
            dscr = "data file",
        }, {
            text({ '<data noupdate="' }), insert(1), text({ '">' }),
            insert(0),
            text({ '</data>' })
        }),
        snip({
            trig = "oofield",
            namr = "oofield",
            dscr = "add field tag",
        }, {
            text({ '<field name="' }), insert(1, 'name'), text({ '">' }),
            insert(0),
            text({ '</field>' })
        }),
        --   "oomenuroot": {
        --     "prefix": ["oomenuroot"],
        --     "body": [
        --       "<menuitem id=\"menu_root\" name=\"${1:name}\" sequence=\"10\" />"
        --     ],
        --     "description": "Create New Root Menu in the Upper bar"
        --   },

        --   "oomenuitem": {
        --     "prefix": ["oomenuitem"],
        --     "body": [
        --       "<menuitem id=\"menu_${2:item}\" parent=\"menu_root\" name=\"${1:name}\" sequence=\"10\" />"
        --     ],
        --     "description": "Create Menu Heading in Root Menu"
        --   },

        --   "oomenuaction": {
        --     "prefix": ["oomenuaction"],
        --     "body": [
        --       "<menuitem id=\"menu_${2:item}_${3:action}\" parent=\"menu_${2:item}\" name=\"${1:name}\" action=\"${2:item}_${3:action}_action\" sequence=\"10\" />"
        --     ],
        --     "description": "Create Menu Actions in Menu Heading"
        --   },

        --   "oofinherit": {
        --     "prefix": ["oofinherit"],
        --     "body": ["<field name=\"inherit_id\" ref=\"base_module.view_id\"/>"],
        --     "description": "add inherit field"
        --   },

        --   "ooform": {
        --     "prefix": ["ooform"],
        --     "body": [
        --       "<record id=\"${1:model_name}_view_form\" model=\"ir.ui.view\">",
        --       "\t<field name=\"name\">${1:model_name}.view.form</field>",
        --       "\t<field name=\"model\">${1:model_name}</field>",
        --       "\t<field name=\"arch\" type=\"xml\">",
        --       "\t\t<form string=\"\">",
        --       "\t\t<sheet>",
        --       "\t\t\t<group>",
        --       "\t\t\t\t$0",
        --       "\t\t\t</group>",
        --       "\t\t</sheet>",
        --       "\t</form>",
        --       "\t</field>",
        --       "</record>"
        --     ],
        --     "description": "add form view"
        --   },

        --   "oolist": {
        --     "prefix": ["oolist"],
        --     "body": [
        --       "<record id=\"${1:model_name}_view_tree\" model=\"ir.ui.view\">",
        --       "\t<field name=\"name\">${1:model_name}.view.tree</field>",
        --       "\t<field name=\"model\">${1:model_name}</field>",
        --       "\t<field name=\"arch\" type=\"xml\">",
        --       "\t<tree string=\"\">",
        --       "\t\t$0",
        --       "\t</tree>",
        --       "\t</field>",
        --       "</record>"
        --     ],
        --     "description": "add list view"
        --   },

        --   "ookanban": {
        --     "prefix": ["ookanban"],
        --     "body": [
        --       "<record id=\"${1:model_name}_view_kanban\" model=\"ir.ui.view\">",
        --       "\t<field name=\"name\">${1:model_name}.view.kanban</field>",
        --       "\t<field name=\"model\">${1:model_name}</field>",
        --       "\t<field name=\"arch\" type=\"xml\">",
        --       "\t\t<kanban string=\"\">",
        --       "\t\t\t<templates>",
        --       "\t\t\t\t<t t-name=\"kanban-box\">",
        --       "\t\t\t\t\t$0",
        --       "\t\t\t\t</t>",
        --       "\t\t\t</templates>",
        --       "\t\t</kanban>",
        --       "\t</field>",
        --       "</record>"
        --     ],
        --     "description": "add kanban view"
        --   },

        --   "oosearch": {
        --     "prefix": ["oosearch"],
        --     "body": [
        --       "<record id=\"${1:model_name}_view_search\" model=\"ir.ui.view\">",
        --       "\t<field name=\"name\">${1:model_name}.view.search</field>",
        --       "\t<field name=\"model\">${1:model_name}</field>",
        --       "\t<field name=\"arch\" type=\"xml\">",
        --       "\t\t<search string=\"\">",
        --       "\t\t\t$0",
        --       "\t\t</search>",
        --       "\t</field>",
        --       "</record>"
        --     ],
        --     "description": "add search view"
        --   },

        --   "oocalendar": {
        --     "prefix": ["oocalendar"],
        --     "body": [
        --       "<record id=\"${1:model_name}_view_calendar\" model=\"ir.ui.view\">",
        --       "\t<field name=\"name\">${1:model_name}.view.calendar</field>",
        --       "\t<field name=\"model\">${1:model_name}e</field>",
        --       "\t<field name=\"arch\" type=\"xml\">",
        --       "\t\t<calendar string=\"\" date_start=\"date_start_field\" color=\"color_field\" mode=\"{6:month}\">",
        --       "\t\t\t$0",
        --       "\t\t</calendar>",
        --       "\t</field>",
        --       "</record>"
        --     ],
        --     "description": "add calendar view"
        --   },

        --   "oocohort": {
        --     "prefix": ["oocohort"],
        --     "body": [
        --       "<record id=\"${1:model_name}_view_cohort\" model=\"ir.ui.view\">",
        --       "\t<field name=\"name\">${1:model_name}.view.cohort</field>",
        --       "\t<field name=\"model\">${1:model_name}</field>",
        --       "\t<field name=\"arch\" type=\"xml\">",
        --       "\t\t<cohort string=\"\" date_start=\"date_start_field\" date_stop=\"date_stop_field\">",
        --       "\t\t\t$0",
        --       "\t\t</cohort>",
        --       "\t</field>",
        --       "</record>"
        --     ],
        --     "description": "add cohort view"
        --   },

        --   "oogantt": {
        --     "prefix": ["oogantt"],
        --     "body": [
        --       "<record id=\"${1:model_name}_view_gantt\" model=\"ir.ui.view\">",
        --       "\t<field name=\"name\">${1:model_name}.view.gantt</field>",
        --       "\t<field name=\"model\">${1:model_name}</field>",
        --       "\t<field name=\"arch\" type=\"xml\">",
        --       "\t\t<gantt string=\"\" date_start=\"date_start_field\" date_stop=\"date_stop_field\">",
        --       "\t\t\t$0",
        --       "\t\t</gantt>",
        --       "\t</field>",
        --       "</record>"
        --     ],
        --     "description": "add gantt view"
        --   },

        --   "oograph": {
        --     "prefix": ["oograph"],
        --     "body": [
        --       "<record id=\"${1:model_name}_view_graph\" model=\"ir.ui.view\">",
        --       "\t<field name=\"name\">${1:model_name}.view.graph</field>",
        --       "\t<field name=\"model\">${1:model_name}</field>",
        --       "\t<field name=\"arch\" type=\"xml\">",
        --       "\t\t<graph string=\"\" type=\"bar\">",
        --       "\t\t\t$0",
        --       "\t\t\t<field name=\"\" type=\"measure\"/>",
        --       "\t\t</graph>",
        --       "\t</field>",
        --       "</record>"
        --     ],
        --     "description": "add graph view"
        --   },

        --   "oopivot": {
        --     "prefix": ["oopivot"],
        --     "body": [
        --       "<record id=\"${1:model_name}_view_pivot\" model=\"ir.ui.view\">",
        --       "\t<field name=\"name\">${1:model_name}.view.pivot</field>",
        --       "\t<field name=\"model\">${1:model_name}</field>",
        --       "\t<field name=\"arch\" type=\"xml\">",
        --       "\t\t<pivot string=\"\" disable_linking=\"true\">",
        --       "\t\t\t$0",
        --       "\t\t<field name=\"\" type=\"row\"/>",
        --       "\t\t<field name=\"\" type=\"measure\"/>",
        --       "\t\t</pivot>",
        --       "\t</field>",
        --       "</record>"
        --     ],
        --     "description": "add pivot view"
        --   },

        --   "ooactivity": {
        --     "prefix": ["ooactivity"],
        --     "body": [
        --       "<record id=\"${1:model_name}_view_activity\" model=\"ir.ui.view\">",
        --       "\t<field name=\"name\">${1:model_name}.view.activity</field>",
        --       "\t<field name=\"model\">${1:model_name}</field>",
        --       "\t<field name=\"arch\" type=\"xml\">",
        --       "\t\t<activity string=\"\">",
        --       "\t\t\t<templates>",
        --       "\t\t\t\t<div t-name=\"activity-box\">",
        --       "\t\t\t\t\t$0",
        --       "\t\t\t\t</div>",
        --       "\t\t\t</templates>",
        --       "\t\t</activity>",
        --       "\t</field>",
        --       "</record>"
        --     ],
        --     "description": "add activity view"
        --   },

        --   "ooqweb": {
        --     "prefix": ["ooqweb"],
        --     "body": [
        --       "<record id=\"${1:model_name}_view_qweb\" model=\"ir.ui.view\">",
        --       "\t<field name=\"name\">${1:model_name}.view.qweb</field>",
        --       "\t<field name=\"model\">${1:model_name}</field>",
        --       "\t<field name=\"type\">qweb</field>",
        --       "\t<field name=\"arch\" type=\"xml\">",
        --       "\t\t$0",
        --       "\t</field>",
        --       "</record>"
        --     ],
        --     "description": "add qweb view"
        --   },

        --   "oobuttonheader": {
        --     "prefix": ["oobuttonheader"],
        --     "body": [
        --       "<button string=\"$0\" name=\"action_name\" type=\"object\" class=\"oe_highlight\"/>"
        --     ],
        --     "description": "add button in form view header"
        --   },

        --   "oobuttonbox": {
        --     "prefix": ["oobuttonbox"],
        --     "body": [
        --       "<div class=\"oe_button_box\" name=\"button_box\">",
        --       "\t<button name=\"${1:action_name}\" type=\"${2:object}\" class=\"oe_stat_button\" icon=\"fa-$3\">",
        --       "\t\t<field name=\"${4:field_name}\" string=\"$5\" widget=\"statinfo\"/>",
        --       "\t</button>",
        --       "</div>"
        --     ],
        --     "description": "add stat button container in form view"
        --   },

        --   "oobuttonstat": {
        --     "prefix": ["oobuttonstat"],
        --     "body": [
        --       "<button name=\"${1:action_name}\" type=\"${2:object}\" class=\"oe_stat_button\" icon=\"fa-$3\">",
        --       "\t<field name=\"${4:field_name}\" string=\"$5\" widget=\"statinfo\"/>",
        --       "</button>"
        --     ],
        --     "description": "add button stat"
        --   },

        --   "oostatusbar": {
        --     "prefix": ["oostatusbar"],
        --     "body": ["<field name=\"\" widget=\"statusbar\" statusbar_visible=\"\"/>"],
        --     "description": "Create Status bar"
        --   },

        --   "oostatusbarheader": {
        --     "prefix": ["oostatusbarheader"],
        --     "body": [
        --       "<header>",
        --       "\t<field name=\"\" widget=\"statusbar\"/>",
        --       "</header>"
        --     ],
        --     "description": "Create Header with Status Bar"
        --   },

        --   "oodashboard": {
        --     "prefix": ["oodashboard"],
        --     "body": [
        --       "<dashboard>",
        --       "\t<view type=\"graph\" ref=\"model_name_view_graph\"/>",
        --       "\t<group>",
        --       "\t\t<aggregate name=\"field_name\" field=\"field_name\"/>",
        --       "\t</group>",
        --       "</dashboard>"
        --     ],
        --     "description": "dashboard view"
        --   },

        --   "oonotebook": {
        --     "prefix": ["oonotebook"],
        --     "body": [
        --       "<notebook>",
        --       "\t<page name=\"${1:name}\" string=\"${2:string}\">",
        --       "\t\t$0",
        --       "\t</page>",
        --       "</notebook>"
        --     ],
        --     "description": "add a notebook"
        --   },

        --   "oopage": {
        --     "prefix": ["oopage"],
        --     "body": [
        --       "<page name=\"${1:name}\" string=\"${2:string}\">",
        --       "\t$0",
        --       "</page>"
        --     ],
        --     "description": "add a notebook page"
        --   },

        --   "oochatter": {
        --     "prefix": ["oochatter"],
        --     "body": [
        --       "<div class=\"oe_chatter\">",
        --       "\t<field name=\"message_follower_ids\" widget=\"mail_followers\"/>",
        --       "\t<field name=\"activity_ids\" widget=\"mail_activity\"/>",
        --       "\t<field name=\"message_ids\" widget=\"mail_thread\"/>",
        --       "</div>"
        --     ],
        --     "description": "add chatter"
        --   },

        --   "ooaction": {
        --     "prefix": ["ooaction"],
        --     "body": [
        --       "<record id=\"model_name_action\" model=\"ir.actions.act_window\">",
        --       "\t<field name=\"name\">Action Name</field>",
        --       "\t<field name=\"res_model\">model.name</field>",
        --       "\t<field name=\"view_type\">form</field>",
        --       "\t<field name=\"view_mode\">tree,form</field>",
        --       "\t<field name=\"domain\">[]</field>",
        --       "\t<field name=\"context\">{}</field>",
        --       "\t<field name=\"help\" type=\"html\">",
        --       "\t\t$0",
        --       "\t</field>",
        --       "</record>"
        --     ],
        --     "description": "add an action"
        --   },

        --   "ooactionserver": {
        --     "prefix": ["ooactionserver"],
        --     "body": [
        --       "<record id=\"model_name_action_server\" model=\"ir.actions.server\">",
        --       "\t<field name=\"name\">Action Name</field>",
        --       "\t<field name=\"model_id\" ref=\"model_model_name\"/>",
        --       "\t<field name=\"binding_model_id\" ref=\"model_model_name\"/>",
        --       "\t<field name=\"state\">code</field>",
        --       "\t<field name=\"code\"></field>",
        --       "</record>"
        --     ],
        --     "description": "add server action"
        --   },

        --   "ooactionclient": {
        --     "prefix": ["ooactionclient"],
        --     "body": [
        --       "<record id=\"action_action_name\" model=\"ir.actions.client\">",
        --       "\t<field name=\"name\">Action Name</field>",
        --       "\t<field name=\"tag\">action_tag_name</field>",
        --       "\t<field name=\"target\">main</field>",
        --       "</record>"
        --     ],
        --     "description": "add client action"
        --   },

        --   "ooactionurl": {
        --     "prefix": ["ooactionurl"],
        --     "body": [
        --       "<record id=\"action_action_name\" model=\"ir.actions.act_url\">",
        --       "\t<field name=\"name\">Action Name</field>",
        --       "\t<field name=\"url\">url</field>",
        --       "\t<field name=\"target\">new</field>",
        --       "</record>"
        --     ],
        --     "description": "add url action"
        --   },

        --   "ooactionview": {
        --     "prefix": ["ooactionview"],
        --     "body": [
        --       "<record id=\"action_action_view_name\" model=\"ir.actions.act_window.view\">",
        --       "\t<field name=\"sequence\" eval=\"1\"/>",
        --       "\t<field name=\"view_mode\">view_name</field>",
        --       "\t<field name=\"act_window_id\" ref=\"action_id\"/>",
        --       "\t<field name=\"view_id\" ref=\"view_id\"/>",
        --       "</record>"
        --     ],
        --     "description": "add view in action"
        --   },

        --   "ooactionreport": {
        --     "prefix": ["ooactionreport"],
        --     "body": [
        --       "<report id=\"action_report_model_name\"",
        --       "model=\"model.name\"",
        --       "string=\"Report name\"",
        --       "report_type=\"qweb-pdf\"",
        --       "name=\"module_name.report_template_name\"",
        --       "file=\"module_name.report_template_name\"",
        --       "/>"
        --     ],
        --     "description": "add report action"
        --   },

        --   "ooreport": {
        --     "prefix": ["ooreport"],
        --     "body": [
        --       "<template id=\"report_template_name\">",
        --       "\t<t t-call=\"web.html_container\">",
        --       "\t\t<t t-foreach=\"docs\" t-as=\"doc\">",
        --       "\t\t\t<t t-call=\"web.external_layout\">",
        --       "\t\t\t\t<div class=\"page\">",
        --       "\t\t\t\t\t$0",
        --       "\t\t\t\t</div>",
        --       "\t\t\t</t>",
        --       "\t\t</t>",
        --       "\t</t>",
        --       "</template>"
        --     ],
        --     "description": "add report template"
        --   },

        --   "ootemplate": {
        --     "prefix": ["ootemplate"],
        --     "body": [
        --       "<template id=\"template_id\" name=\"template_name\">",
        --       "\t$0",
        --       "</template>"
        --     ],
        --     "description": "add template"
        --   },

        --   "ootemplateinherit": {
        --     "prefix": ["ootemplateinherit"],
        --     "body": [
        --       "<template id=\"template_id\" name=\"template_name\" inherit_id=\"module_name.template_id\">",
        --       "\t<xpath expr=\"\" position=\"inside\">",
        --       "\t\t$0",
        --       "\t</xpath>",
        --       "</template>"
        --     ],
        --     "description": "add inherited template"
        --   },

        --   "oorecord": {
        --     "prefix": ["oorecord"],
        --     "body": [
        --       "<record id=\"record_name\" model=\"model_name\">",
        --       "\t<field name=\"field_name\">field_value</field>",
        --       "</record>"
        --     ],
        --     "description": "add record"
        --   },

        --   "oofunction": {
        --     "prefix": ["oofunction"],
        --     "body": [
        --       "<function model=\"model.name\" name=\"method_name\" eval=\"[ref('record_id')]\">",
        --       "</function>"
        --     ],
        --     "description": "add function"
        --   },

        --   "ooxpath": {
        --     "prefix": ["ooxpath"],
        --     "body": [
        --       "<xpath expr=\"//field[@name='${1}']\" position=\"after\">",
        --       "\t$0",
        --       "</xpath>"
        --     ],
        --     "description": "add xpath element"
        --   },

        --   "ooxpathattr": {
        --     "prefix": ["ooxpathattr"],
        --     "body": [
        --       "<xpath expr=\"//field[@name='${1}']\" position=\"after\">",
        --       "\t<attribute name=\"attribute\">attribute_value</attribute>",
        --       "</xpath>"
        --     ],
        --     "description": "add xpath to attributes"
        --   },

        --   "ooattribute": {
        --     "prefix": ["ooattribute"],
        --     "body": ["<attribute name=\"${1:attribute}\">$1_value</attribute>"],
        --     "description": "add attribute tag for xpath"
        --   },

        --   "ooscript": {
        --     "prefix": ["ooscript"],
        --     "body": [
        --       "<script type=\"text/javascript\" src=\"/${1:module_name}/static/src/js/${2:filename}.js\"/>"
        --     ],
        --     "description": "add script tag"
        --   },

        --   "oolink": {
        --     "prefix": ["oolink"],
        --     "body": [
        --       "<link rel=\"stylesheet\" type=\"text/scss\" href=\"/${1:module_name}/static/src/scss/${2:filename}.scss\"/>"
        --     ],
        --     "description": "add link tag"
        --   },

        --   "ooassetsbackend": {
        --     "prefix": ["ooassetsbackend"],
        --     "body": [
        --       "<template id=\"assets_backend\" name=\"backend assets\" inherit_id=\"web.assets_backend\">",
        --       "\t<xpath expr=\".\" position=\"inside\">",
        --       "\t\t<script type=\"text/javascript\" src=\"/${1:module_name}/static/src/js/${2:filename}.js\"/>",
        --       "\t\t<link rel=\"stylesheet\" type=\"text/scss\" href=\"/${1:module_name}/static/src/scss/${3:filename}.scss\"/>",
        --       "\t</xpath>",
        --       "</template>"
        --     ],
        --     "description": "add backend assets"
        --   },

        --   "ooassetsfrontend": {
        --     "prefix": ["ooassetsfrontend"],
        --     "body": [
        --       "<template id=\"assets_frontend\" name=\"frontend assets\" inherit_id=\"website.assets_frontend\">",
        --       "\t<xpath expr=\".\" position=\"inside\">",
        --       "\t\t<script type=\"text/javascript\" src=\"/${1:module_name}/static/src/js/${2:filename}.js\"/>",
        --       "\t\t<link rel=\"stylesheet\" type=\"text/scss\" href=\"/${1:module_name}/static/src/scss/${3:filename}.scss\"/>",
        --       "\t</xpath>",
        --       "</template>"
        --     ],
        --     "description": "add frontend assets"
        --   },

        snip({
            trig = "tif",
            namr = "t-if",
            dscr = "if condition"
        }, {
            -- snippet code
            --     "body": ["<t t-if=\"condition\">", "$0", "</t>"],
            text('<t t-if="'),
            insert(1, 'condition'),
            text('">'),
            insert(0),
            text('</t>')

        }),
        snip({
            trig = "telif",
            namr = "t-elif",
            dscr = "elif conditon"
        }, {
            -- snippet code
            --     "body": ["</t>", "<t t-elif=\"condition\">", "$0"],
            text('<t t-elif="'),
            insert(1, 'condition'),
            text('">'),
            insert(0),
        }),
        snip({
            trig = "tifelse",
            namr = "t-ifelse",
            dscr = "if else condition"
        }, {
            -- snippet code
            --     "body": ["<t t-if="condition">", "$0", "</t>", "<t t-else="">", "</t>"],
            text({ '<t t-if="' }), insert(1, 'condition'), text({ '">' }),
            text(''),
            insert(0),
            text({ '<t t-else="' }), insert(2, 'condition'), text({ '">' }),
            text({ '', '</t>' })
        }),
        snip({
            trig = "tforeach",
            namr = "t-foreach",
            dscr = "foreach loop"
        }, {
            -- snippet code
            --       "<t t-foreach="${1:iteration}" t-as="${2:variable}">",
            --       "\t$0",
            text('<t t-foreach="'),
            insert(1, 'iteration'),
            text('" t-as="'),
            insert(2, 'variable'),
            text({ '">', '' }),
            insert(0)
        }),
        snip({
            trig = "tset",
            namr = "t-set",
            dscr = "add variable"
        }, {
            -- snippet code
            --     "body": ["<t t-set="${1:variable}" t-value="${2:value}"/>"],
            text('<t t-set="'),
            insert(1, 'variable'),
            text('" t-value="'),
            insert(2, 'value'),
            text('"/>')
        }),
        snip({
            trig = "tatt",
            namr = "t-att",
            dscr = "add attribute"
        }, {
            -- snippet code
            --     "body": ["t-att-${1:attribute_name}=\"$0\""],
            text('<t t-att-'),
            insert(1, 'attribute_name'),
            text('="'),
            insert(0),
            text('"/>')
        }),
        snip({
            trig = "tattf",
            namr = "t-attf",
            dscr = "add attribute with format value"
        }, {
            -- snippet code
            --     "body": ["t-attf-${1:attribute_name}=\"$0\""],
            text('<t t-attf-'),
            insert(1, 'attribute_name'),
            text('="'),
            insert(0),
            text('"/>')
        }),
        snip({
            trig = "tesc",
            namr = "t-esc",
            dscr = "evaluate expression"
        }, {
            -- snippet code
            --     "body": ["<t t-esc=\"${1:expression}\"/>"],
            text('<t t-exc="'),
            insert(0, 'expression'),
            text('"/>')
        }),
        snip({
            trig = "traw",
            namr = "t-raw",
            dscr = "evaluate html content"
        }, {
            -- snippet code
            --     "body": ["<t t-raw=\"${1:variable}\"/>"],
            text('<t t-raw="'),
            insert(0, 'variable'),
            text('"/>')
        }),

        snip({
            trig = "tcall",
            namr = "t-call",
            dscr = "call other template"
        }, {
            -- snippet code
            --     "body": ["<t t-call=\"${1:template_name}\"/>"],
            text('<t t-call="'),
            insert(0, 'template_name'),
            text('"/>')
        }),
        snip({
            trig = "tdebug",
            namr = "t-debug",
            dscr = "invoke debugger",
        }, {
            -- snippet code
            --     "body": ["<t t-debug\"${1:pdb}\"/>"],
            text('<t t-debug="'),
            insert(0, 'pdb'),
            text('"/>')
        }),
        snip({
            trig = "tlog",
            namr = "t-log",
            dscr = "log expression result",
        }, {
            -- snippet code
            text('<t t-log="'),
            insert(0, 'expression'),
            text('"/>')
        }),
        --   "ooxugroup": {
        --     "prefix": ["ooxugroup"],
        --     "body": [
        --       "<record id=\"\" model=\"res.groups\">",
        --       "\t<field name=\"name\">$0</field>",
        --       "\t<field name=\"category_id\" ref=\"\"/>",
        --       "\t<field name=\"comment\"></field>",
        --       "</record>"
        --     ],
        --     "description": "Add odoo user groups"
        --   },

        --   "ooxuser": {
        --     "prefix": ["ooxuser"],
        --     "body": [
        --       "<record model=\"res.users\" id=\"$0\">",
        --       "\t<field eval=\"[:(4,ref(''))]\" name=\"groups_id\"/>",
        --       "</record>"
        --     ],
        --     "description": "Add odoo user"
        --   },

        --   "ooxapplication": {
        --     "prefix": ["ooxapplication"],
        --     "body": [
        --       "<record model=\"ir.module.category\" id=\"\">",
        --       "\t<field name=\"name\">$0</field>",
        --       "\t<field name=\"sequence\"></field>",
        --       "</record>"
        --     ],
        --     "description": "Add odoo application"
        --   },

        --   "odxparam": {
        --     "prefix": ["odxparam"],
        --     "body": [
        --       "<record model=\"ir.config_parameter\" id=\"\">",
        --       "\t<field name=\"key\"></field>",
        --       "\t<field name=\"value\"></field>",
        --       "</record>"
        --     ],
        --     "description": "Add System Parameter"
        --   },

        --   "odxrule": {
        --     "prefix": ["odxrule"],
        --     "body": [
        --       "<record model=\"ir.rule\" id=\"\">",
        --       "\t<field name=\"name\">$0</field>",
        --       "\t<field name=\"model_id\" ref=\"\"/>",
        --       "\t<field name=\"domain_force\"></field>",
        --       "\t<field name=\"groups\" eval=\"\"/>",
        --       "</record>"
        --     ],
        --     "description": "Add Ir Rule Domain Filter"
        --   },

        --   "odxsequence": {
        --     "prefix": ["odxsequence"],
        --     "body": [
        --       "<record model=\"ir.sequence\" id=\"\">",
        --       "\t<field name=\"name\">$0</field>",
        --       "\t<field name=\"code\"></field>",
        --       "\t<field name=\"implementation\">standard</field>",
        --       "\t<field name=\"prefix\"></field>",
        --       "\t<field name=\"padding\"></field>",
        --       "\t<field name=\"suffix\"></field>",
        --       "\t<field name=\"number_increment\">1</field>",
        --       "</record>"
        --     ],
        --     "description": "Add sequence in data xml file"
        --   },

        --   "oocron": {
        --     "prefix": ["oocron"],
        --     "body": [
        --       "<record id=\"model_name_cron\" model=\"ir.cron\">",
        --       "\t<field name=\"name\">${1:Cron Name}</field>",
        --       "\t<field name=\"model_id\" ref=\"model_model_name\"/>",
        --       "\t<field name=\"interval_number\">1</field>",
        --       "\t<field name=\"interval_type\">minutes</field>",
        --       "\t<field name=\"numbercall\">-1</field>",
        --       "\t<field name=\"state\">code</field>",
        --       "\t<field name=\"code\"></field>",
        --       "</record>"
        --     ],
        --     "description": "add cron job"
        --   }
        -- }

    }
})
