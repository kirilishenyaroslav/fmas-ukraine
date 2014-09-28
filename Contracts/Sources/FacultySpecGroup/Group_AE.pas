unit Group_AE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxButtonEdit, StdCtrls, cxControls, cxGroupBox, cxButtons,
  ibase, cnConsts, uCommonSp, DM_FacultySpecGroup, cnConsts_Messages,
  cxCheckBox;

type
  TfrmGroup_AE = class(TForm)
    OkButton: TcxButton;
    CancelButton: TcxButton;
    Frame_GroupBox: TcxGroupBox;
    Group_Label: TLabel;
    DepGroup_Edit: TcxButtonEdit;
    Error_Label: TLabel;
    Group_Edit: TcxTextEdit;
    DepGr_Label: TLabel;
    CheckBox_is_def: TcxCheckBox;
    procedure Fac_EditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormShow(Sender: TObject);
    procedure DepGroup_EditKeyPress(Sender: TObject; var Key: Char);
    procedure OkButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure Group_EditKeyPress(Sender: TObject; var Key: Char);
  private
    DM:TDM_FSG;
    PLanguageIndex : byte;
    DB_Handle : TISC_DB_HANDLE;
    procedure FormIniLanguage();
  public
    id_department : int64;
    constructor Create(AOwner:TComponent; DBHandle: TISC_DB_HANDLE; LanguageIndex : byte);reintroduce;
  end;

var
  frmGroup_AE: TfrmGroup_AE;

implementation

{$R *.dfm}
constructor TfrmGroup_AE.Create(AOwner:TComponent; DBHandle: TISC_DB_HANDLE; LanguageIndex : byte);
begin
 Screen.Cursor:=crHourGlass;
 inherited Create(AOwner);
 PLanguageIndex:= LanguageIndex;
 DB_Handle := DBHandle;
 FormIniLanguage();
 Screen.Cursor:=crDefault;
 end;

procedure TfrmGroup_AE.FormIniLanguage();
begin
  Group_Label.caption :=  cnConsts.cn_footer_Group[PLanguageIndex];
  DepGr_Label.caption :=  cnConsts.cn_DepGrName[PLanguageIndex];
  OkButton.Caption:=      cnConsts.cn_Accept[PLanguageIndex];
  CancelButton.Caption:=  cnConsts.cn_Cancel[PLanguageIndex];
  CheckBox_is_def.Properties.Caption := cnConsts.cn_is_def[PLanguageIndex];
end;
procedure TfrmGroup_AE.Fac_EditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
    sp: TSprav;
    Id_Property: int64;
begin
    // определяю номер свойства группы
    DM:=TDM_FSG.Create(Self);
    DM.DB.Handle:=DB_Handle;
    DM.ReadDataSet.Close;
    DM.ReadDataSet.SelectSQL.Clear;
    DM.ReadDataSet.SelectSQL.Text := 'select * from CN_GET_ID_GROUP_PROPERTY';
    DM.ReadDataSet.Open;
    Id_Property := DM.ReadDataSet['CN_DEP_GROUP_PROPERTY'];
    DM.ReadDataSet.Close;
    DM.Free;

    // создать справочник
    sp :=  GetSprav('SpDepartment');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(DB_Handle);
                // модальный показ
            FieldValues['ShowStyle'] := 0;
                // единичная выборка
            FieldValues['Select'] := 1;
            FieldValues['AllowEdit'] := true;
            FieldValues['Show_Properties'] := false;
//            FieldValues['Id_Property'] := Id_Property;
            Post;
        end;
    end;
        // показать справочник и проанализировать результат (выбор одного подр.)
    sp.Show;
        if ( sp.Output <> nil ) and not sp.Output.IsEmpty then
        begin
            id_department := sp.Output['Id_Department'];
            DepGroup_Edit.Text := sp.Output['Name_Full'];
            if Error_Label.Visible then
            Error_Label.Visible := false;
        end;
    sp.Free;
end;

procedure TfrmGroup_AE.FormShow(Sender: TObject);
begin
 DepGroup_Edit.SetFocus;
end;

procedure TfrmGroup_AE.DepGroup_EditKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then Group_Edit.SetFocus;
end;

procedure TfrmGroup_AE.OkButtonClick(Sender: TObject);
begin
 if Group_Edit.text = '' then
  begin
   showmessage(cn_Name_Need[PLanguageIndex]);
   Group_Edit.SetFocus;
   exit;
  end;
 ModalResult:=mrOk;
end;

procedure TfrmGroup_AE.CancelButtonClick(Sender: TObject);
begin
close;
end;

procedure TfrmGroup_AE.Group_EditKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then OkButton.SetFocus;
end;

end.
