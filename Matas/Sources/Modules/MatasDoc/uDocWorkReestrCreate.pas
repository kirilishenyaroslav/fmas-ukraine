unit uDocWorkReestrCreate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxCheckBox, cxButtonEdit, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, StdCtrls, ibase,
  uSpTipDocMulti, uResources, cxLookAndFeelPainters, cxButtons;

type
  TDocWorkReestrCreate = class(TForm)
    Label2: TLabel;
    cxDateReestr: TcxDateEdit;
    Label1: TLabel;
    cxTipDoc: TcxButtonEdit;
    cxCheckUser: TcxCheckBox;
    OkButton: TcxButton;
    CancelButton: TcxButton;
    procedure cxTipDocPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    DBHANDLE : TISC_DB_HANDLE;
    FILTER_ID_SESSION: Integer;
  end;

var
  DocWorkReestrCreate: TDocWorkReestrCreate;

implementation

{$R *.dfm}

procedure TDocWorkReestrCreate.cxTipDocPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  Res : Variant;
  FormResult: Boolean;
  VarDimCnt: integer;
  i: integer;
  s: string;
begin
  Res:=uSpTipDocMulti.GetTipDocMulti(self, self.DBHANDLE, 0, FILTER_ID_SESSION, FormResult);
  if FormResult then begin
  if  VarType(Res) <> varEmpty then begin
   VarDimCnt:=VarArrayHighBound(Res,  1);
   s:='';
   for i:=0 to VarDimCnt do begin
    s:=s+VarToStr(Res[i][1])+';';
   end;
   cxTipDoc.Text := s;
  end
 end
end;

procedure TDocWorkReestrCreate.FormCreate(Sender: TObject);
begin
 cxDateReestr.Date:=Date;
 OkButton.Caption:=MAT_BUTTON_OK_CONST;
 CancelButton.Caption:=MAT_BUTTON_CANCEL_CONST;
end;

end.
