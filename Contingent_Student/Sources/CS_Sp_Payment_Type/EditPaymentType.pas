unit EditPaymentType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxDropDownEdit, cxCalendar, cxButtonEdit, StdCtrls, Buttons,
  ExtCtrls, cxLabel, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, uCS_Loader, uCs_types, uCS_Proc, ActnList;

type
  TFEditPaymentType = class(TForm)
    cxMENameTypeVipl: TcxMaskEdit;
    cxLabel1: TcxLabel;
    Panel1: TPanel;
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    EditVidOpl: TcxButtonEdit;
    LabelVidOplData: TcxLabel;
    cxLabel2: TcxLabel;
    EditDateBeg: TcxDateEdit;
    EditDateEnd: TcxDateEdit;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxCBType: TcxComboBox;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxMEReason: TcxMaskEdit;
    cxLabel7: TcxLabel;
    cxMENameTypeViplFULL: TcxMaskEdit;
    KeyList: TActionList;
    ActionFocus: TAction;
    ActionYes: TAction;
    ActionCancel: TAction;
    procedure EditVidOplPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure EditVidOplExit(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure ActionFocusExecute(Sender: TObject);
    procedure ActionYesExecute(Sender: TObject);
    procedure ActionCancelExecute(Sender: TObject);
  private
    Id_VidOpl:integer;
    ID_PAYMENT_TYPE:Integer;
  public
    property PID_PAYMENT_TYPE:Integer read ID_PAYMENT_TYPE;
    property PId_VidOpl:Integer read Id_VidOpl write Id_VidOpl;
  end;

var
  FEditPaymentType: TFEditPaymentType;

implementation

uses DMPaymentTypeMain;

{$R *.dfm}

procedure TFEditPaymentType.EditVidOplPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var VidOpl:Variant;
csVidOplParam:TcsVidOplParam;
begin
  csVidOplParam:=TcsVidOplParam.create;
  csVidOplParam.Owner:=self;
  csVidOplParam.Db_HANDLE:=DMMainPaymentType.WorkDatabase.handle;
  csVidOplParam.PZFormStyle := zfsModal;
  VidOPl:=LoadVidOpl(csVidOplParam, CSVidOpl);
  if VarArrayDimCount(VidOpl)>0 then
  begin
   Id_VidOpl:=VidOpl[0];
   EditVidOpl.Text := VarToStrDef(VidOpl[2],'');
   LabelVidOplData.Caption := VidOpl[1];

  end
  else
    EditVidOpl.SetFocus;
end;

procedure TFEditPaymentType.EditVidOplExit(Sender: TObject);
var VidOpl:Variant;
begin
if EditVidOpl.Text<>'' then
 begin
    VidOpl:=VoByKod(StrToInt(EditVidOpl.Text),date,DMMainPaymentType.WorkDatabase.Handle);
  if VarArrayDimCount(VidOpl)>0 then
   begin
    Id_VidOpl:=VidOpl[0];
    EditVidOpl.Text := VarToStrDef(VidOpl[1],'');
    LabelVidOplData.Caption := VidOpl[2];
   end
  else
   EditVidOpl.SetFocus;
 end;
end;

procedure TFEditPaymentType.OkButtonClick(Sender: TObject);
begin
  

  ModalResult:=mrOK;
end;

procedure TFEditPaymentType.CancelButtonClick(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

procedure TFEditPaymentType.ActionFocusExecute(Sender: TObject);
begin
  if OkButton.Focused then
    begin
      ActionYesExecute(Sender);
      exit;
    end;
  keybd_event(VK_TAB,0,0,0);
end;

procedure TFEditPaymentType.ActionYesExecute(Sender: TObject);
begin
  if cxMENameTypeViplFULL.Text='' then
  begin
    ShowMessage('Не всі поля заповнені');
    exit;
  end;

  if cxMENameTypeVipl.Text='' then
  begin
    ShowMessage('Не всі поля заповнені');
    exit;
  end;

  if EditVidOpl.EditValue=null then
  begin
    ShowMessage('Не всі поля заповнені');
    exit;
  end;

  if EditDateBeg.EditValue=null then
  begin
    ShowMessage('Не всі поля заповнені');
    exit;
  end;

  if EditDateEnd.EditValue=null then
  begin
    ShowMessage('Не всі поля заповнені');
    exit;
  end;

  if (cxCBType.EditValue=null) or (cxCBType.EditValue='') then
  begin
    ShowMessage('Не всі поля заповнені');
    exit;
  end;

  if (cxMEReason.EditValue=null) or (cxMEReason.EditValue='') then
  begin
    ShowMessage('Не всі поля заповнені');
    exit;
  end;

  ModalResult:=mrOk;
end;

procedure TFEditPaymentType.ActionCancelExecute(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

end.
