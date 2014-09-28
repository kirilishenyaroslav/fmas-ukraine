unit uSynchEDBO_Group;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxMaskEdit, cxButtonEdit, cxTextEdit,
  cxControls, cxContainer, cxEdit, cxLabel, StdCtrls, cxButtons, iBase,
  cn_Common_Types, cn_Common_Loader;

type
  TfrmSynchEDBO_Group = class(TForm)
    OkButton: TcxButton;
    CancelButton: TcxButton;
    cxLabel1: TcxLabel;
    TextEdit_name_group_edbo: TcxTextEdit;
    cxLabel2: TcxLabel;
    ButtonEdit_name_group: TcxButtonEdit;
    procedure CancelButtonClick(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
    procedure ButtonEdit_name_groupPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    { Private declarations }
  public
    id_group : Int64;
    id_facul : Int64;
    is_admin : Boolean;
    DB_Handle : TISC_DB_HANDLE;
  end;

var
  frmSynchEDBO_Group: TfrmSynchEDBO_Group;

implementation

{$R *.dfm}

procedure TfrmSynchEDBO_Group.CancelButtonClick(Sender: TObject);
begin
  close;
end;

procedure TfrmSynchEDBO_Group.OkButtonClick(Sender: TObject);
begin
  if ButtonEdit_name_group.Text = '' then
   begin
     ShowMessage('Необхідно обрати групу!');
     exit;
   end;

  ModalResult := mrOk;
end;

procedure TfrmSynchEDBO_Group.ButtonEdit_name_groupPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  AParameter : TcnSimpleParams;
  res: Variant;
begin
  AParameter           := TcnSimpleParams.Create;
  AParameter.Owner     := self;
  AParameter.Db_Handle := DB_Handle;
  AParameter.Formstyle :=fsNormal;
  AParameter.is_admin  := is_admin;
  AParameter.ID_Locate := id_facul;

  res := RunFunctionFromPackage(AParameter, 'Contracts\cn_sp_FacultySpecGroup.bpl','ShowSPFacSpecGroup');
  AParameter.Free;

  if VarArrayDimCount(res)>0 then
   begin
    ID_GROUP   := res[2];

    ButtonEdit_name_group.Text:= vartostr(res[5]);
   end;
end;

end.
