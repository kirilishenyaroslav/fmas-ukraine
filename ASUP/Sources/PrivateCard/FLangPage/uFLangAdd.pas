unit uFLangAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, FieldControl, SpComboBox, Buttons, ComCtrls, EditControl,
  uFLangDataModule, uCommonSp, SpCommon, UpKernelUnit;

type
  TAddFLangForm = class(TForm)
    SpCB_FLang: TSpComboBox;
    FC_FLang: TFieldControl;
    Label1: TLabel;
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    Label2: TLabel;
    SpCB_Degree: TSpComboBox;
    FC_Degree: TFieldControl;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CancelButtonClick(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
  public
    Add: Boolean;
    id, id_pcard:integer;
    FormControl: TEditControl;
    DM:TdmFLang;
  end;

var
  Form1: TAddFLangForm;

implementation

{$R *.dfm}


procedure TAddFLangForm.FormCreate(Sender: TObject);
begin
  DM:=TdmFLang.Create(Self); 
  FormControl := TEditControl.Create;
  FormControl.Add([FC_FLang,FC_Degree]);
  FormControl.Prepare(emNew);
  SpCB_FLang.LoadFromRegistry;
  SpCB_Degree.LoadFromRegistry;
end;

procedure TAddFLangForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FormControl.Free;
  SpCB_FLang.SaveIntoRegistry;
  SpCB_Degree.SaveIntoRegistry;
end;

procedure TAddFLangForm.CancelButtonClick(Sender: TObject);
begin
	ModalResult := mrCancel;
	Close;
end;

procedure TAddFLangForm.OkButtonClick(Sender: TObject);
var s:string;
begin
  FormControl.Read;

  with DM do
  try
    DefaultTransaction.StartTransaction;
    StartHistory(DefaultTransaction);
    if (not Add) then
     InsertUpdate.ParamByName('id_man_flang').AsVariant:=id
    else
     InsertUpdate.ParamByName('id_man_flang').AsVariant:=Null;

    InsertUpdate.ParamByName('id_pcard').AsInteger:=id_pcard;
    InsertUpdate.ParamByName('id_FLang').AsInteger:=SpCB_FLang.GetId;
    InsertUpdate.ParamByName('id_flang_degree').AsInteger:=SpCB_Degree.GetId;
    InsertUpdate.ExecProc;

    DefaultTransaction.Commit;
    ModalResult:=mrOk;
  except on e: Exception do
    begin
      if Add then s:='додати' else s:='змінити';
      MessageDlg('Не вдалося '+s+' запис: '+#13+e.Message,mtError,[mbYes],0);
      DefaultTransaction.RollBack;
      ModalResult:=0;
    end;
  end;
end;


end.
