{
  Clever Internet Suite Version 6.2
  Copyright (C) 1999 - 2006 Clever Components
  www.CleverComponents.com
}

unit clXmlUtils;

interface

{$I clVer.inc}

uses
  Classes{$IFDEF DELPHI6}, Variants, msxml {$ELSE}, msxml_tlb{$ENDIF};

procedure StringsToXML(AStrings: TStrings; ANode: IXMLDOMNode);
procedure XMLToStrings(AStrings: TStrings; ANode: IXMLDOMNode);
procedure SaveXMLToFile(const AFileName: string; ADomDoc: IXMLDOMDocument);
procedure SaveXMLToStrings(AList: TStrings; ADomDoc: IXMLDOMDocument);
procedure AddCDataNodeName(const AName: string);
function GetAttributeValue(const ANode: IXMLDOMNode; const AName: string): string;
procedure SetAttributeValue(const ANode: IXMLDOMNode; const AName, AValue: string);
function GetNodeByName(const ARoot: IXMLDomNode; const AName, ANameSpace: string): IXMLDomNode;
function GetNodeValueByName(const ARoot: IXMLDomNode; const AName, ANameSpace: string): string;

implementation

uses
  SysUtils;

const
  CDataXMLFormat = '<xsl:output indent="yes" method="xml" encoding="UTF-8" cdata-section-elements="%s"/>';
  XMLFormat = '<?xml version="1.0" encoding="UTF-8"?>' +
              '<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">' +
              '  <xsl:output indent="yes" method="xml" encoding="UTF-8"/> %s ' +
              '    <xsl:template match="/ | @* | node()">' +
              '  <xsl:copy>' +
              '  <xsl:apply-templates select="@* | node()"/>' +
              '    </xsl:copy>' +
              '  </xsl:template>' +
              '</xsl:stylesheet>';

var
  CDataNodeNames: TStrings = nil;

procedure AddCDataNodeName(const AName: string);
begin
  if (CDataNodeNames = nil) then
  begin
    CDataNodeNames := TStringList.Create();
  end;
  if (CDataNodeNames.IndexOf(AName) < 0) then
  begin
    CDataNodeNames.Add(AName);
  end;
end;

function GetXMLFormat: string;
var
  i: Integer;
begin
  Result := '';
  if (CDataNodeNames <> nil) then
  begin
    for i := 0 to CDataNodeNames.Count - 1 do
    begin
      Result := Result + #32 + Format(CDataXMLFormat, [CDataNodeNames[i]]);
    end;
  end;
  Result := Format(XMLFormat, [Result]);
end;

procedure SaveXMLToFile(const AFileName: string; ADomDoc: IXMLDOMDocument);
var
  b: Boolean;
  TransDoc, ResDoc: IXMLDOMDocument;
begin
  TransDoc := CoDOMDocument.Create();
  ResDoc := CoDOMDocument.Create();
  TransDoc.loadXML(GetXMLFormat());
  try
    ADomDoc.transformNodeToObject(TransDoc, ResDoc);
    b := (ResDoc.xml <> '');
  except
    b := False;
  end;
  if b then
  begin
    ResDoc.save(AFileName);
  end else
  begin
    ADomDoc.save(AFileName);
  end;
end;

procedure SaveXMLToStrings(AList: TStrings; ADomDoc: IXMLDOMDocument);
var
  b: Boolean;
  TransDoc, ResDoc: IXMLDOMDocument;
begin
  TransDoc := CoDOMDocument.Create();
  ResDoc := CoDOMDocument.Create();
  TransDoc.loadXML(GetXMLFormat());
  try
    ADomDoc.transformNodeToObject(TransDoc, ResDoc);
    b := (ResDoc.xml <> '');
  except
    b := False;
  end;
  if b then
  begin
    AList.Text := string(ResDoc.xml);
  end else
  begin
    AList.Text := string(ADomDoc.xml);
  end;
end;

procedure StringsToXML(AStrings: TStrings; ANode: IXMLDOMNode);
var
  ChildNode: IXMLDOMNode;
begin
  ChildNode := ANode.ownerDocument.createCDATASection(AStrings.Text);
  ANode.appendChild(ChildNode);
end;

procedure XMLToStrings(AStrings: TStrings; ANode: IXMLDOMNode);
begin
  AStrings.Text := ANode.text;
end;

function GetAttributeValue(const ANode: IXMLDOMNode; const AName: string): string;
begin
  Result := VarToStr((ANode as IXMLDOMElement).getAttribute(WideString(AName)));
end;

procedure SetAttributeValue(const ANode: IXMLDOMNode; const AName, AValue: string);
begin
  if (AValue <> '') then
  begin
    (ANode as IXMLDOMElement).setAttribute(WideString(AName), AValue);
  end else
  begin
    (ANode as IXMLDOMElement).removeAttribute(WideString(AName));
  end;
end;

function GetNodeByName(const ARoot: IXMLDomNode; const AName, ANameSpace: string): IXMLDomNode;
var
  list: IXMLDomNodeList;
begin
  list := ARoot.childNodes;
  Result := list.nextNode;
  while (Result <> nil) do
  begin
    if (Result.baseName = AName) and (Result.namespaceURI = ANameSpace) then Exit;
    Result := list.nextNode;
  end;
  Result := nil;
end;

function GetNodeValueByName(const ARoot: IXMLDomNode; const AName, ANameSpace: string): string;
var
  node: IXMLDomNode;
begin
  node := GetNodeByName(ARoot, AName, ANameSpace);
  if (node <> nil) then
  begin
    Result := Trim(string(node.text));
  end else
  begin
    Result := '';
  end;
end;

initialization

finalization
  CDataNodeNames.Free();

end.