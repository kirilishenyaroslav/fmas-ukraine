{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                        Модуль просмотра остатков и оборотов                  }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uViewOstFilter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uMatasVars, uMatasUtils, uResources, cxLookAndFeelPainters,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxButtonEdit,
  StdCtrls, cxButtons, uPackageManager, ibase, cxCheckBox, ActnList,
  uViewBegOst, FIBQuery, pFIBQuery, pFIBStoredProc, DB, ADODB, FIBDatabase,
  pFIBDatabase,uViewOstBase;

type
  TOstFilterForm = class(TForm)
    ClearButton: TcxButton;
    OkButton: TcxButton;
    CancelButton: TcxButton;
    LabelGroup: TLabel;
    cxLINKTO: TcxButtonEdit;
    LabelMat: TLabel;
    cxNOMN: TcxButtonEdit;
    cxCheckSubstr: TcxCheckBox;
    ActionList1: TActionList;
    acExit: TAction;
    Transaction: TpFIBTransaction;
    WorkProc: TpFIBStoredProc;
    pFIBDatabase1: TpFIBDatabase;
    procedure FormCreate(Sender: TObject);
    procedure cxLINKTOKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxNOMNKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxLINKTOPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ClearButtonClick(Sender: TObject);
    procedure cxNOMNPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure OkButtonClick(Sender: TObject);
    procedure acExitExecute(Sender: TObject);
  private

  public
    { Public declarations }
    DBHandle: TISC_DB_HANDLE;
    F_ID_NOMN, F_LINKTO: integer;
    ID_USER : Int64;
    PERIOD: TDateTime;
    ID_SESSION: Integer;
    st_gruppa:string;
    is_vibor:Integer;
  end;

var
  OstFilterForm: TOstFilterForm;

implementation

{$R *.dfm}

procedure TOstFilterForm.FormCreate(Sender: TObject);
begin
// pFIBDatabase1.Handle:=DBHANDLE;
// pFIBDatabase1.Open;
 OkButton.Caption:=MAT_BUTTON_OK_CONST;
 CancelButton.Caption:=MAT_BUTTON_CANCEL_CONST;
 ClearButton.Caption:=MAT_BUTTON_CLEAR_CONST;
 LabelGroup.Caption:=MAT_STR_COL_GROUP_TMC;
 LabelMat.Caption:=MAT_STR_COL_TMC;
 Caption:=MAT_SYS_PREFIX+MAT_ACTION_FILTER_CONST;


end;

procedure TOstFilterForm.cxLINKTOKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (Key=VK_BACK) or (Key=VK_DELETE) then
 begin
  cxLINKTO.Text:='';
  F_LINKTO:=0;
 end;
end;

procedure TOstFilterForm.cxNOMNKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (Key=VK_BACK) or (Key=VK_DELETE) then
 begin
  cxNOMN.Text:='';
  F_ID_NOMN:=0;
 end;
end;

procedure TOstFilterForm.cxLINKTOPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
 Res: Variant;
  FM:TAddGroupTMCForm;
begin
{ Res:=uPackageManager.LGetNomn(self, DBHandle, fsNormal, 0, F_LINKTO, 0, 0, 0, 2, 0);
 if  VarType(Res) <> varEmpty then
 begin
  F_LINKTO:=Res[0];
  cxLINKTO.Text:=Res[1];
  F_ID_NOMN:=0;
  cxNOMN.Text:='';
 end; }
  FM:=TAddGroupTMCForm.Create(Self,DBHANDLE, ID_USER,ID_SESSION,5,PERIOD,'групам ТМЦ');
  FM.ShowModal;
  cxLINKTO.Text:=VarToStr(FM.Result);
  FM.Free;
  st_gruppa:=cxLINKTO.Text;
end;

procedure TOstFilterForm.ClearButtonClick(Sender: TObject);
begin
 F_LINKTO:=0;
 cxLINKTO.Text:='';
 cxNOMN.Text:='';
 F_ID_NOMN:=0;
 try
   Transaction.StartTransaction;
   WorkProc.StoredProcName:='MAT_FILTER_CLEANER';
   WorkProc.Prepare;

   WorkProc.ParamByName('ID_SESSION').AsInt64:=ID_SESSION;
   WorkProc.ParamByName('ID_OBJECT').AsInt64:=5;

   WorkProc.ExecProc;
   WorkProc.Transaction.Commit;
 except on E : Exception
  do begin
    ShowMessage(E.Message);
    WorkProc.Transaction.Rollback;
    Exit;
  end;
 end;
end;

procedure TOstFilterForm.cxNOMNPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
 Res: Variant;
begin
 Res:=uPackageManager.LGetNomn(self, DBHandle, fsNormal, 0, F_ID_NOMN, 0, 0, 0, 0, 0);
 if  VarType(Res) <> varEmpty then
 begin
  F_ID_NOMN:=Res[0];
  cxNOMN.Text:=Res[1];
  F_LINKTO:=0;
  cxLINKTO.Text:='';
 end;
end;

procedure TOstFilterForm.OkButtonClick(Sender: TObject);
begin
 cxNOMN.Text:=AnsiUpperCase(cxNOMN.Text);
 if cxLINKTO.Text = '' then is_vibor:=0 else is_vibor:=1;
end;

procedure TOstFilterForm.acExitExecute(Sender: TObject);
begin
  if cxLINKTO.Text = '' then is_vibor:=0 else is_vibor:=1;
 Close;
end;

end.
