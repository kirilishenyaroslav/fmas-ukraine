{
  Clever Internet Suite Version 6.2
  Copyright (C) 1999 - 2006 Clever Components
  www.CleverComponents.com
}

{$IFNDEF VER80}
 {$IFNDEF VER90}
  {$IFNDEF VER93}
    {$DEFINE DELPHI3} { Delphi 3.0 or higher }
  {$ENDIF}
 {$ENDIF}
{$ENDIF}

{$IFDEF VER120} { Delphi 4.0 }
  {$DEFINE DELPHI4}
{$ENDIF}

{$IFDEF VER140} { Delphi 6.0 or C++Builder 6.0}
  {$DEFINE DELPHI4}
  {$DEFINE DELPHI5}
  {$DEFINE DELPHI6}
  {$IFDEF BCB}
    {$DEFINE CBUILDER3}
    {$DEFINE CBUILDER4}
    {$DEFINE CBUILDER5}
    {$DEFINE CBUILDER6}
    {$ObjExportAll On}
  {$ENDIF}
{$ENDIF}

{$IFDEF VER150} { Delphi 7.0}
  {$DEFINE DELPHI4}
  {$DEFINE DELPHI5}
  {$DEFINE DELPHI6}
  {$DEFINE DELPHI7}
{$ENDIF}

{$IFDEF VER110} { Borland C++Builder 3.0 }
  {$DEFINE CBUILDER3}
  {$ObjExportAll On}
{$ENDIF}

{$IFDEF VER125} { Borland C++Builder 4.0 }
  {$DEFINE CBUILDER3}
  {$DEFINE DELPHI4}
  {$DEFINE CBUILDER4}
  {$ObjExportAll On}
{$ENDIF}

{$IFDEF VER130} { Delphi 5.0 or C++Builder 5.0 }
  {$DEFINE DELPHI4}
  {$DEFINE DELPHI5}
  {$IFDEF BCB}
    {$DEFINE CBUILDER3}
    {$DEFINE CBUILDER4}
    {$DEFINE CBUILDER5}
    {$ObjExportAll On}
  {$ENDIF}
{$ENDIF}

{$IFDEF VER170} { Delphi 2005}
  {$DEFINE DELPHI4}
  {$DEFINE DELPHI5}
  {$DEFINE DELPHI6}
  {$DEFINE DELPHI7}
  {$DEFINE DELPHI9}
{$ENDIF}

{$IFDEF VER180} { Delphi 2006}
  {$DEFINE DELPHI4}
  {$DEFINE DELPHI5}
  {$DEFINE DELPHI6}
  {$DEFINE DELPHI7}
  {$DEFINE DELPHI9}
  {$DEFINE DELPHI10}
{$ENDIF}

