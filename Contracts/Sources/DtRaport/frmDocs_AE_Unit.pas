unit frmDocs_AE_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxGroupBox, cxLookAndFeelPainters, StdCtrls,
  cxButtons, cxMaskEdit, cxDropDownEdit, cxCalendar, cxContainer, cxEdit,
  cxTextEdit, cxButtonEdit, Ibase, cn_Common_Types, cn_Common_Loader, cnConsts,
  cnConsts_Messages, cn_Common_Funcs;

type
  TfrmDocs_AE = class(TForm)
    cxGroupBox1: TcxGroupBox;
    OKButton: TcxButton;
    CancelButton: TcxButton;
    Num_Doc_Edit: TcxTextEdit;
    Date_Doc_Edit: TcxDateEdit;
    Status_Label: TLabel;
    Date_Doc_Label: TLabel;
    Status_Edit: TcxButtonEdit;
    TypeDocum_Edit: TcxButtonEdit;
    DateDept_Edit: TcxDateEdit;
    TypeDocum_Label: TLabel;
    Num_Doc_Label: TLabel;
    DateDept_Label: TLabel;
    Order_Date_Edit: TcxDateEdit;
    Date_Order_Label: TLabel;
    Order_Num_Edit: TcxTextEdit;
    Num_Order_Label: TLabel;
    procedure CancelButtonClick(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Num_Doc_EditKeyPress(Sender: TObject; var Key: Char);
    procedure Date_Doc_EditKeyPress(Sender: TObject; var Key: Char);
    procedure Status_EditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure TypeDocum_EditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure Status_EditKeyPress(Sender: TObject; var Key: Char);
    procedure TypeDocum_EditKeyPress(Sender: TObject; var Key: Char);
    procedure DateDept_EditKeyPress(Sender: TObject; var Key: Char);
    procedure Order_Num_EditKeyPress(Sender: TObject; var Key: Char);
    procedure Order_Date_EditKeyPress(Sender: TObject; var Key: Char);
  private
   PLanguageIndex :byte;
   DB_Handle : TISC_DB_HANDLE;
   procedure FormIniLanguage();
  public
    ID_STATUS, ID_TYPE_DOCUM : int64;

    constructor Create(Owner: TComponent ; LangIndex : byte; DBHandle: TISC_DB_HANDLE; ViewMode: boolean); reintroduce;
  end;

var
  frmDocs_AE: TfrmDocs_AE;

implementation

{$R *.dfm}

constructor TfrmDocs_AE.Create(Owner: TComponent ; LangIndex : byte; DBHandle: TISC_DB_HANDLE; ViewMode: boolean );
begin
 inherited Create(Owner);
 PLanguageIndex := LangIndex;
 DB_Handle:= DBHandle;
 if ViewMode then
  begin
   Num_Doc_Edit.Enabled := false;
   Date_Doc_Edit.Enabled := false;
   DateDept_Edit.Enabled := false;
   OKButton.Visible:= false;
  end;
end;


procedure TfrmDocs_AE.FormIniLanguage();
begin
 // индекс языка (1-укр, 2 - рус)
 NUM_DOC_Label.Caption       :=   cn_Name_Column[PLanguageIndex];
 DATE_DOC_Label.Caption      :=   cn_DateDoc_Pay[PLanguageIndex];
 Status_Label.Caption        :=   cn_Status[PLanguageIndex];
 TypeDocum_Label.Caption     :=   cn_Type[PLanguageIndex];
 DateDept_Label.Caption      :=   cn_DateCalc[PLanguageIndex];
 Date_Order_Label.Caption     :=   cn_DatePrikaz[PLanguageIndex];
 Num_Order_Label.Caption      :=   cn_NomPrikaz[PLanguageIndex];

 OKButton.Caption            :=   cn_Accept[PLanguageIndex];
 CancelButton.Caption        :=   cn_Cancel[PLanguageIndex];
end;

procedure TfrmDocs_AE.CancelButtonClick(Sender: TObject);
begin
close;
end;

procedure TfrmDocs_AE.OKButtonClick(Sender: TObject);
begin
if CheckControls(self, PLanguageIndex) then exit;
 ModalResult := MrOk;
end;

procedure TfrmDocs_AE.FormShow(Sender: TObject);
begin
FormIniLanguage();
end;

procedure TfrmDocs_AE.Num_Doc_EditKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then Date_Doc_Edit.SetFocus;
end;

procedure TfrmDocs_AE.Date_Doc_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then DateDept_Edit.SetFocus;
end;

procedure TfrmDocs_AE.Status_EditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  AParameter:TcnSimpleParams;
  res: Variant;
 begin
  AParameter:= TcnSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= DB_Handle;
  AParameter.Formstyle:=fsNormal;
  AParameter.WaitPakageOwner:=self;
  res:= RunFunctionFromPackage(AParameter, 'Contracts\cn_sp_RaportStatus.bpl','ShowSPRapStatus');

  if VarArrayDimCount(Res)>0
   then begin
    ID_STATUS := res[0];
    Status_Edit.Text := res[1];
   end; 
  AParameter.Free;
end;

procedure TfrmDocs_AE.TypeDocum_EditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
  var
  AParameter:TcnSimpleParams;
  res: Variant;
 begin
  AParameter:= TcnSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= DB_Handle;
  AParameter.Formstyle:=fsNormal;
  AParameter.WaitPakageOwner:=self;
  res:= RunFunctionFromPackage(AParameter, 'Contracts\cn_sp_TypeDocum.bpl','ShowSPTypeDocum');
  if VarArrayDimCount(Res)>0
   then begin
    ID_TYPE_DOCUM := res[0];
    TypeDocum_Edit.Text := res[1];
   end;
  AParameter.Free;
end;

procedure TfrmDocs_AE.Status_EditKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then TypeDocum_Edit.SetFocus;
end;

procedure TfrmDocs_AE.TypeDocum_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
 if key = #13 then DateDept_Edit.SetFocus;
end;

procedure TfrmDocs_AE.DateDept_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then Order_Date_Edit.SetFocus;
end;

procedure TfrmDocs_AE.Order_Num_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then OKButton.SetFocus;
end;

procedure TfrmDocs_AE.Order_Date_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then Order_Num_Edit.SetFocus;
end;

end.
