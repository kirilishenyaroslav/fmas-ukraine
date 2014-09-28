unit uPiPrepareDocAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ActnList,
  cxCurrencyEdit, cxButtonEdit, cxMemo, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxControls, cxContainer, cxEdit, cxLabel, ibase,
  upi_resources, upi_Loader,AccMgmt;

type
  TfmPrepareDocAdd = class(TForm)
    OkButton: TcxButton;
    CancelButton: TcxButton;
    LabelDate: TcxLabel;
    cxLabel4: TcxLabel;
    DateEdit: TcxDateEdit;
    MemoNote: TcxMemo;
    LabelNum: TcxLabel;
    LabelTypeDoc: TcxLabel;
    ButtonEditTypeDoc: TcxButtonEdit;
    ActionList1: TActionList;
    ActionSave: TAction;
    ActionExit: TAction;
    TextEditNum: TcxTextEdit;
    procedure OkButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure ButtonEditTypeDocPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ButtonEditTypeDocKeyPress(Sender: TObject; var Key: Char);
    procedure TextEditNumKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    id_doc_header : variant;
    id_type_doc : variant;
    numb_pack : integer;
    id_user : integer;
    DB_handle : TISC_DB_HANDLE;
    constructor Create(AOwner:TComponent);reintroduce;
  end;

var
  fmPrepareDocAdd: TfmPrepareDocAdd;

implementation

uses DMPIPrepareDoc1df;

{$R *.dfm}


constructor TfmPrepareDocAdd.Create(AOwner:TComponent);
begin
  Screen.Cursor:=crHourGlass;

  inherited Create(AOwner);

  Screen.Cursor:=crDefault;
  DateEdit.Date := date;
  id_user := AccMgmt.GetUserId;

  DM.DataSetSelNumb.Close;
  DM.DataSetSelNumb.SQLs.SelectSQL.Text := 'select max(num_doc) as num_doc from PI_DOC_HEADERS';
  DM.DataSetSelNumb.Open;
  try numb_pack              := DM.DataSetSelNumb.FBN('num_doc').AsInteger; except numb_pack:= 0 end;
end;

procedure TfmPrepareDocAdd.OkButtonClick(Sender: TObject);
begin
    if(id_type_doc = null)  then
    Begin
        ShowMessage('Необхідно заповнити тип документа!');
        ButtonEditTypeDoc.SetFocus;
        Exit;
    end;
    if(TextEditNum.Text = '')  then
    Begin
        ShowMessage('Необхідно заповнити номер документаа!');
        TextEditNum.SetFocus;
        Exit;
    end;
    if(DateEdit.Text = '')  then
    Begin
        ShowMessage('Необхідно заповнити дату документа!');
        DateEdit.SetFocus;
        Exit;
    end;

    ModalResult := mrOk;

end;

procedure TfmPrepareDocAdd.CancelButtonClick(Sender: TObject);
begin
    close;
end;

procedure TfmPrepareDocAdd.ButtonEditTypeDocPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    AParameter: TPiParamPacks;
    res : variant;
begin
    AParameter := TPiParamPacks.Create;
    AParameter.Owner := self;
    AParameter.Db_Handle := dm.Db.Handle;
    AParameter.Formstyle := fsNormal;
    AParameter.id_locate := id_user;

    res := DoFunctionFromPackage(AParameter, ['Personal_income\PiTypeDoc.bpl', 'ShowPiTypeDoc']);
    AParameter.Free;

    if VarArrayDimCount(res)>0 then
    begin
        id_type_doc := res[0];
        ButtonEditTypeDoc.Text:= vartostr(res[1]);
    end;
end;



procedure TfmPrepareDocAdd.ButtonEditTypeDocKeyPress(Sender: TObject;
  var Key: Char);
begin
     key := chr(0);
end;

procedure TfmPrepareDocAdd.TextEditNumKeyPress(Sender: TObject;
  var Key: Char);
begin
    if ((Ord(Key) < 48) or (Ord(Key) > 57))
        and (Ord(Key) <> 8)
        and (Ord(Key) <> VK_DELETE)
        and (Ord(Key) <> VK_ESCAPE)
    then
        Key := Chr(0)
end;

end.
