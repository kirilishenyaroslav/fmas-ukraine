unit uUpSetGroupForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxListBox, cxDBEdit, cxControls, cxContainer, cxEdit,
  cxTextEdit, Buttons,dmUpLoaderMain, cxMaskEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, DBCtrls;

type
  TGroupEditForm = class(TForm)
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    GroupBox1: TGroupBox;
    GroupEdit: TcxTextEdit;
    GroupsList: TcxLookupComboBox;
    NewRadioGroup: TRadioButton;
    OldGroupBtn: TRadioButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure OkButtonClick(Sender: TObject);
    procedure NewRadioGroupEnter(Sender: TObject);
    procedure OldGroupBtnEnter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    DataModule:TMainDM;
    IdReport:Integer;
  end;

var
  GroupEditForm: TGroupEditForm;

implementation

{$R *.dfm}

procedure TGroupEditForm.FormShow(Sender: TObject);
begin
    DataModule.GroupsDataSet.Open;
end;

procedure TGroupEditForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    DataModule.GroupsDataSet.Close;
end;

procedure TGroupEditForm.OkButtonClick(Sender: TObject);
var
   GroupName:String;
begin

    if (NewRadioGroup.Checked) then
        GroupName:=GroupEdit.Text
    else
        GroupName:=GroupsList.EditText;


    with DataModule do
    begin
        WriteTransaction.StartTransaction;

        UpdateGroupQuery.ParamByName('ID_SP_REPORT').Value:=IdReport;
        UpdateGroupQuery.ParamByName('NAME_GROUP').Value:=GroupName;

        try
            UpdateGroupQuery.ExecQuery;
            WriteTransaction.Commit;
        except on E:Exception do
        begin
            ShowMessage(E.Message);
            WriteTransaction.Rollback;
        end;
        end;

    end;


end;

procedure TGroupEditForm.NewRadioGroupEnter(Sender: TObject);
begin
    GroupsList.Enabled:=False;
    GroupEdit.Enabled:=True;

end;

procedure TGroupEditForm.OldGroupBtnEnter(Sender: TObject);
begin
    GroupsList.Enabled:=True;
    GroupEdit.Enabled:=False;
end;

procedure TGroupEditForm.FormCreate(Sender: TObject);
begin
    GroupsList.Enabled:=False;
    GroupEdit.Enabled:=True;
end;

end.
