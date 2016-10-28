﻿parser grammar SdmapParser;

options { tokenVocab=SdmapLexer; }

root:
	namespace | namedSql*;

namespace:
	OpenNamespace
		namedSql* 
	Close;

coreSql:
	(macro | plainText)+;

plainText:
	SQLText;

namedSql:
	OpenNamedSql
		coreSql
	CloseSql;

unnamedSql:
	OpenUnnamedSql
		coreSql
	CloseSql;

macro:
	OpenMacro
		macroParameter? (Comma macroParameter)*
	CloseMacro;

macroParameter:
	NSSyntax | 
	value |
	unnamedSql;

value:
	STRING |
	NUMBER |
	DATE;
