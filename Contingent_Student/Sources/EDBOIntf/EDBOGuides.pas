// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : D:\WebServiceIntf\Delphi7\EDBOGuides.wsdl
//  >Import : D:\WebServiceIntf\Delphi7\EDBOGuides.wsdl:0
// Encoding : utf-8
// Version  : 1.0
// (22.02.2013 22:35:26 - * $Rev: 5154 $)
// ************************************************************************ //

unit EDBOGuides;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns;

const
  IS_OPTN = $0001;
  IS_UNBD = $0002;
  IS_NLBL = $0004;
  IS_UNQL = $0008;
  IS_ATTR = $0010;
  IS_TEXT = $0020;

type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Borland types; however, they could also 
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:int             - "http://www.w3.org/2001/XMLSchema"
  // !:string          - "http://www.w3.org/2001/XMLSchema"
  // !:dateTime        - "http://www.w3.org/2001/XMLSchema"

  ExtensionDataObject  = class;                 { "http://edboservice.ua/"[GblCplx] }
  dAcademicYears       = class;                 { "http://edboservice.ua/"[GblCplx] }
  dLastError           = class;                 { "http://edboservice.ua/"[GblCplx] }

  ArrayOfDAcademicYears = array of dAcademicYears;   { "http://edboservice.ua/"[GblCplx] }


  // ************************************************************************ //
  // XML       : ExtensionDataObject, global, <complexType>
  // Namespace : http://edboservice.ua/
  // ************************************************************************ //
  ExtensionDataObject = class(TRemotable)
  private
  published
  end;



  // ************************************************************************ //
  // XML       : dAcademicYears, global, <complexType>
  // Namespace : http://edboservice.ua/
  // ************************************************************************ //
  dAcademicYears = class(TRemotable)
  private
    FExtensionData: ExtensionDataObject;
    FExtensionData_Specified: boolean;
    FId_AcademicYear: Integer;
    FAcademicYearName: WideString;
    FAcademicYearName_Specified: boolean;
    FAcademicYearDescription: WideString;
    FAcademicYearDescription_Specified: boolean;
    FAcademicYearDateBegin: TXSDateTime;
    FAcademicYearDateEnd: TXSDateTime;
    FAcademicYearDatelLastChange: TXSDateTime;
    FAcademicYearIsActive: Integer;
    procedure SetExtensionData(Index: Integer; const AExtensionDataObject: ExtensionDataObject);
    function  ExtensionData_Specified(Index: Integer): boolean;
    procedure SetAcademicYearName(Index: Integer; const AWideString: WideString);
    function  AcademicYearName_Specified(Index: Integer): boolean;
    procedure SetAcademicYearDescription(Index: Integer; const AWideString: WideString);
    function  AcademicYearDescription_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property ExtensionData:               ExtensionDataObject  Index (IS_OPTN) read FExtensionData write SetExtensionData stored ExtensionData_Specified;
    property Id_AcademicYear:             Integer              read FId_AcademicYear write FId_AcademicYear;
    property AcademicYearName:            WideString           Index (IS_OPTN) read FAcademicYearName write SetAcademicYearName stored AcademicYearName_Specified;
    property AcademicYearDescription:     WideString           Index (IS_OPTN) read FAcademicYearDescription write SetAcademicYearDescription stored AcademicYearDescription_Specified;
    property AcademicYearDateBegin:       TXSDateTime          read FAcademicYearDateBegin write FAcademicYearDateBegin;
    property AcademicYearDateEnd:         TXSDateTime          read FAcademicYearDateEnd write FAcademicYearDateEnd;
    property AcademicYearDatelLastChange: TXSDateTime          read FAcademicYearDatelLastChange write FAcademicYearDatelLastChange;
    property AcademicYearIsActive:        Integer              read FAcademicYearIsActive write FAcademicYearIsActive;
  end;

  ArrayOfDLastError = array of dLastError;      { "http://edboservice.ua/"[GblCplx] }


  // ************************************************************************ //
  // XML       : dLastError, global, <complexType>
  // Namespace : http://edboservice.ua/
  // ************************************************************************ //
  dLastError = class(TRemotable)
  private
    FExtensionData: ExtensionDataObject;
    FExtensionData_Specified: boolean;
    FLastErrorCode: Integer;
    FLastErrorDescription: WideString;
    FLastErrorDescription_Specified: boolean;
    procedure SetExtensionData(Index: Integer; const AExtensionDataObject: ExtensionDataObject);
    function  ExtensionData_Specified(Index: Integer): boolean;
    procedure SetLastErrorDescription(Index: Integer; const AWideString: WideString);
    function  LastErrorDescription_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property ExtensionData:        ExtensionDataObject  Index (IS_OPTN) read FExtensionData write SetExtensionData stored ExtensionData_Specified;
    property LastErrorCode:        Integer              read FLastErrorCode write FLastErrorCode;
    property LastErrorDescription: WideString           Index (IS_OPTN) read FLastErrorDescription write SetLastErrorDescription stored LastErrorDescription_Specified;
  end;


  // ************************************************************************ //
  // Namespace : http://edboservice.ua/
  // soapAction: http://edboservice.ua/%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : document
  // binding   : EDBOGuidesSoap
  // service   : EDBOGuides
  // port      : EDBOGuidesSoap
  // URL       : http://test.edbo.gov.ua/EDBOGuides/EDBOGuides.asmx
  // ************************************************************************ //
  EDBOGuidesSoap = interface(IInvokable)
  ['{3388FE85-720C-04EE-2F43-F032C77ACE1C}']
    function  AcademicYearsGet(const SessionGUID: WideString; const Id_Language: Integer): ArrayOfDAcademicYears; stdcall;
    function  Login(const User: WideString; const Password: WideString; const ClearPreviewSession: Integer; const ApplicationKey: WideString): WideString; stdcall;
    function  GetLastError(const session: WideString): ArrayOfDLastError; stdcall;
  end;

function GetEDBOGuidesSoap(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): EDBOGuidesSoap;


implementation
  uses SysUtils;

function GetEDBOGuidesSoap(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): EDBOGuidesSoap;
const
  defWSDL = 'D:\WebServiceIntf\Delphi7\EDBOGuides.wsdl';
  defURL  = 'http://test.edbo.gov.ua/EDBOGuides/EDBOGuides.asmx';
  defSvc  = 'EDBOGuides';
  defPrt  = 'EDBOGuidesSoap';
var
  RIO: THTTPRIO;
begin
  Result := nil;
  if (Addr = '') then
  begin
    if UseWSDL then
      Addr := defWSDL
    else
      Addr := defURL;
  end;
  if HTTPRIO = nil then
    RIO := THTTPRIO.Create(nil)
  else
    RIO := HTTPRIO;
  try
    Result := (RIO as EDBOGuidesSoap);
    if UseWSDL then
    begin
      RIO.WSDLLocation := Addr;
      RIO.Service := defSvc;
      RIO.Port := defPrt;
    end else
      RIO.URL := Addr;
  finally
    if (Result = nil) and (HTTPRIO = nil) then
      RIO.Free;
  end;
end;


destructor dAcademicYears.Destroy;
begin
  FreeAndNil(FExtensionData);
  FreeAndNil(FAcademicYearDateBegin);
  FreeAndNil(FAcademicYearDateEnd);
  FreeAndNil(FAcademicYearDatelLastChange);
  inherited Destroy;
end;

procedure dAcademicYears.SetExtensionData(Index: Integer; const AExtensionDataObject: ExtensionDataObject);
begin
  FExtensionData := AExtensionDataObject;
  FExtensionData_Specified := True;
end;

function dAcademicYears.ExtensionData_Specified(Index: Integer): boolean;
begin
  Result := FExtensionData_Specified;
end;

procedure dAcademicYears.SetAcademicYearName(Index: Integer; const AWideString: WideString);
begin
  FAcademicYearName := AWideString;
  FAcademicYearName_Specified := True;
end;

function dAcademicYears.AcademicYearName_Specified(Index: Integer): boolean;
begin
  Result := FAcademicYearName_Specified;
end;

procedure dAcademicYears.SetAcademicYearDescription(Index: Integer; const AWideString: WideString);
begin
  FAcademicYearDescription := AWideString;
  FAcademicYearDescription_Specified := True;
end;

function dAcademicYears.AcademicYearDescription_Specified(Index: Integer): boolean;
begin
  Result := FAcademicYearDescription_Specified;
end;

destructor dLastError.Destroy;
begin
  FreeAndNil(FExtensionData);
  inherited Destroy;
end;

procedure dLastError.SetExtensionData(Index: Integer; const AExtensionDataObject: ExtensionDataObject);
begin
  FExtensionData := AExtensionDataObject;
  FExtensionData_Specified := True;
end;

function dLastError.ExtensionData_Specified(Index: Integer): boolean;
begin
  Result := FExtensionData_Specified;
end;

procedure dLastError.SetLastErrorDescription(Index: Integer; const AWideString: WideString);
begin
  FLastErrorDescription := AWideString;
  FLastErrorDescription_Specified := True;
end;

function dLastError.LastErrorDescription_Specified(Index: Integer): boolean;
begin
  Result := FLastErrorDescription_Specified;
end;

initialization
  InvRegistry.RegisterInterface(TypeInfo(EDBOGuidesSoap), 'http://edboservice.ua/', 'utf-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(EDBOGuidesSoap), 'http://edboservice.ua/%operationName%');
  InvRegistry.RegisterInvokeOptions(TypeInfo(EDBOGuidesSoap), ioDocument);
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfDAcademicYears), 'http://edboservice.ua/', 'ArrayOfDAcademicYears');
  RemClassRegistry.RegisterXSClass(ExtensionDataObject, 'http://edboservice.ua/', 'ExtensionDataObject');
  RemClassRegistry.RegisterXSClass(dAcademicYears, 'http://edboservice.ua/', 'dAcademicYears');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfDLastError), 'http://edboservice.ua/', 'ArrayOfDLastError');
  RemClassRegistry.RegisterXSClass(dLastError, 'http://edboservice.ua/', 'dLastError');

end.