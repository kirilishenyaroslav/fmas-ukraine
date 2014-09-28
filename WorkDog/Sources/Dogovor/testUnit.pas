unit testUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxMaskEdit, cxDropDownEdit, cxCalendar, cxMemo,
  cxControls, cxContainer, cxEdit, cxTextEdit;

type
  TtestForm = class(TForm)
    GroupBox1: TGroupBox;
    cxTextEdit1: TcxTextEdit;
    cxMemo1: TcxMemo;
    cxDateEdit1: TcxDateEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Button1: TButton;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    cxTextEdit2: TcxTextEdit;
    Button2: TButton;
    GroupBox3: TGroupBox;
    Label5: TLabel;
    cxTextEdit3: TcxTextEdit;
    Label6: TLabel;
    cxTextEdit4: TcxTextEdit;
    Label7: TLabel;
    cxTextEdit5: TcxTextEdit;
    Button3: TButton;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  testForm: TtestForm;

implementation
uses
  DogLoaderUnit,
  DataModule;
{$R *.dfm}

procedure TtestForm.FormShow(Sender: TObject);
begin
  Sys_test := true;
end;

procedure TtestForm.Button1Click(Sender: TObject);
var
 input : TDogInput;
 res   : TDogResult;
begin
 input.Owner      := Self;
 input.DBHandle   := dm.Database.Handle;
 input.ReadTrans  := dm.ReadTransaction.Handle;
 input.WriteTrans := dm.WriteTransaction.Handle;
 input.FormStyle  := fsMDIChild;
 input.id_Group_add := SYS_ID_GROUP_DOG;
 input.id_Group   := SYS_ID_GROUP_DOG_VIEW;
 SYS_TEMP_NUM     := cxTextEdit1.Text;
 SYS_TEMP_DATE    := cxDateEdit1.Text;
 SYS_TEMP_NOTE    := cxMemo1.Text;
 res := ShowDogMain(input);
end;

procedure TtestForm.Button2Click(Sender: TObject);
var
 input : TDogInput;
 res   : TDogResult;
begin
 input.Owner      := Self;
 input.DBHandle   := dm.Database.Handle;
 input.ReadTrans  := dm.ReadTransaction.Handle;
 input.WriteTrans := dm.WriteTransaction.Handle;
 input.FormStyle  := fsMDIChild;
 input.id_Group_add := SYS_ID_GROUP_DOG;
 input.id_Group   := SYS_ID_GROUP_DOG_VIEW;
 input.id_doc     := StrToInt(cxTextEdit2.Text);
 res := ShowDogMain(input);
end;

procedure TtestForm.Button3Click(Sender: TObject);
var
 input : TDogInput;
 res   : TDogResult;
begin
 input.Owner      := Self;
 input.DBHandle   := dm.Database.Handle;
 input.ReadTrans  := dm.ReadTransaction.Handle;
 input.WriteTrans := dm.WriteTransaction.Handle;
 input.FormStyle  := fsMDIChild;
 input.id_Group_add := SYS_ID_GROUP_DOG;
 input.id_Group   := SYS_ID_GROUP_DOG_VIEW;

 if cxTextEdit4.Text <> '' then input.lInfo.name_customer := cxTextEdit4.Text;
 if cxTextEdit5.Text <> '' then input.lInfo.summa := cxTextEdit5.Text;
 if cxTextEdit3.Text <> '' then input.lInfo.rate_acc := cxTextEdit3.Text;

 res := ShowDogMain(input);
end;

procedure TtestForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := cafree;
end;

end.
