unit uSynchTypeStrEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxMaskEdit,
  cxButtonEdit, cxTextEdit, cxControls, cxContainer, cxEdit, cxLabel, ibase,
  AdrSp_MainForm, DB, RxMemDS, cxCheckBox,AppStruClasses, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, USpTypeStrEDBO, dxBar;

type
  TfmSynchTypeStrEdit = class(TForm)
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    ButtonEdit_TypeStr: TcxButtonEdit;
    OkButton: TcxButton;
    CancelButton: TcxButton;
    CheckBoxDefault: TcxCheckBox;
    ButtonEditStreetType: TcxButtonEdit;
    procedure OkButtonClick(Sender: TObject);
    procedure TextEdit_typeStr_edboKeyPress(Sender: TObject;
      var Key: Char);
    procedure ButtonEdit_TypeStrPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure CancelButtonClick(Sender: TObject);
    procedure ButtonEditStreetTypePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
  public
    id_type_street, id_type_street_edbo : variant;
     id_type_street_name_edbo : Int64;
    type_add : integer;
    short_name : string;
    DB_handle : TISC_DB_HANDLE;
    constructor Create(AOwner:TComponent);reintroduce;
  end;
{var
  fmSynchTypeStrEdit: TfmSynchTypeStrEdit;}

implementation

uses DM_TypeStreetSynch;

{$R *.dfm}

constructor TfmSynchTypeStrEdit.Create(AOwner:TComponent);
begin
  Screen.Cursor:=crHourGlass;

  inherited Create(AOwner);

  Screen.Cursor:=crDefault;
end;


procedure TfmSynchTypeStrEdit.OkButtonClick(Sender: TObject);
begin
  if  (id_type_street = null)  then
  Begin
    ShowMessage('Необхідно обрати тип вулиці!');
    ButtonEdit_TypeStr.SetFocus;
    Exit;
  end;
  if  (id_type_street_edbo = null)  then
  Begin
    ShowMessage('Необхідно обрати тип вулиці ЄДБО!');
    ButtonEditStreetType.SetFocus;
    Exit;
  end;

  ModalResult := mrOk;
end;

procedure TfmSynchTypeStrEdit.TextEdit_typeStr_edboKeyPress(
  Sender: TObject; var Key: Char);
begin
    key :=chr(0);
end;

procedure TfmSynchTypeStrEdit.ButtonEdit_TypeStrPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    ViewForm      : TfmSpTypeStrEDBO;
begin
    ViewForm                          := TfmSpTypeStrEDBO.Create(self);
    ViewForm.DB_handle                := DM.DB.Handle;
    ViewForm.Caption                  := 'Довідник типів вулиць';
    ViewForm.GridDBViewDB_name_typestr_EDBO.Caption := 'Назва типу вулиці';
    ViewForm.GridDBView.DataController.DataSource := Dm.DataSourceOur;
    ViewForm.ShowModal;

    if ViewForm.ModalResult = mrOk then
    begin
         id_type_street            := DM.DataSetOur['Id_StreetType'];
         ButtonEdit_TypeStr.Text   := DM.DataSetOur['StreetTypeFullName'];
    end;
end;

procedure TfmSynchTypeStrEdit.CancelButtonClick(Sender: TObject);
begin
    close;
end;

procedure TfmSynchTypeStrEdit.ButtonEditStreetTypePropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    ViewForm      : TfmSpTypeStrEDBO;
begin
    if type_add= 1 then exit
    else
    begin
        ViewForm                          := TfmSpTypeStrEDBO.Create(self);
        ViewForm.DB_handle                := DM.DB.Handle;
        ViewForm.AddButton.Visible        := ivNever;
        ViewForm.EditButton.Visible       := ivNever;
        ViewForm.DelButton.Visible        := ivNever;
        ViewForm.RefreshButton.Visible    := ivNever;
        ViewForm.Caption                  := 'Довідник типів вулиць з ЄДБО';
        ViewForm.GridDBViewDB_name_typestr_EDBO.Caption := 'Назва типу вулиці з ЄДБО';
        ViewForm.GridDBView.DataController.DataSource := Dm.DataSourceEDBO;
        ViewForm.ShowModal;

        if ViewForm.ModalResult = mrOk then
        begin
             id_type_street_edbo := DM.RxMem_EdboStreetType.FieldByName('Id_StreetType').AsInteger;
             id_type_street_name_edbo  := DM.RxMem_EdboStreetType.FieldByName('Id_StreetTypeName').AsInteger;
             ButtonEditStreetType.Text := DM.RxMem_EdboStreetType.FieldByName('StreetTypeFullName').AsString;
             short_name                := DM.RxMem_EdboStreetType.FieldByName('StreetTypeShortName').AsString;
        end;
    end;
end;

end.
