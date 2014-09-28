unit UpComandOrderAddOrg;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, cxLookAndFeelPainters, ActnList, StdCtrls, cxButtons,
    cxTextEdit, cxLabel, cxControls, cxContainer, cxEdit, cxMaskEdit,
    cxButtonEdit, uUnivSprav, uAddModifForm, Buttons, BaseTypes,
    UpComandOrderSpCity, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
    cxDBLookupComboBox, DB, FIBDataSet, pFIBDataSet, iBase, uCommonSp;

type
    TFormAddOrg = class(TAddModifForm)
        cxLabel2: TcxLabel;
        NameLbl: TcxLabel;
        NameTE: TcxTextEdit;
        ActionList: TActionList;
        AcceptAction: TAction;
        CancelAction: TAction;
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        CityBtn: TcxButton;
        CityBE: TcxTextEdit;
        procedure OkButtonClick(Sender: TObject);
        procedure CityBtnClick(Sender: TObject);
        procedure CityBEKeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
    private
        { Private declarations }
    public
        { Public declarations }
        DBHandle: TISC_DB_HANDLE;
        Id_City: Integer;
    end;

var
    FormAddOrg: TFormAddOrg;

implementation

{$R *.dfm}

procedure TFormAddOrg.OkButtonClick(Sender: TObject);
begin
    if (NameTE.Text = '') and (Id_City <> -1) then
    begin
        agMessageDlg('Увага', 'Заповніть поле "Назва організації"', mtError, [mbOk]);
        NameTE.SetFocus;
        Exit;
    end;

    if (CityBE.EditingText = '') then
    begin
        agMessageDlg('Увага', 'Заповніть поле "Назва міста"', mtError, [mbOk]);
        CityBE.SetFocus;
        Exit;
    end;

    ModalResult := mrOk;

end;

procedure TFormAddOrg.CityBtnClick(Sender: TObject);
var
    AdressesSp: TSprav;
    ShowStyle, Select: Integer;
begin

    AdressesSp := GetSprav('Adresses');
    ShowStyle := 3;
    if (AdressesSp <> nil) then
    begin
        with AdressesSp.Input do
        begin
            Edit;
            FieldValues['Id_Adress'] := -1; //Id_City;  //DSetOrg['ID_PLACE'];
            FieldValues['DbHandle'] := integer(DBHandle);
            FieldValues['Select'] := 1;
            FieldValues['ShowStyle'] := ShowStyle;
            Post;
        end;

        AdressesSp.Show;

        if (not VarIsNull(AdressesSp.Output['Name_Adr']))
            then
        begin
            CityBE.EditValue := AdressesSp.Output['Name_Adr'];
            Id_City := AdressesSp.Output['Id_Adress'];
        end;
    end;
    AdressesSp.free;
{    frmCity: TFormComandSpCity;
Begin
    frmCity := TFormComandSpCity.Create(self);
    frmCity.DBHandle := DBHandle;
    If frmCity.ShowModal = mrOk Then
    Begin
        Id_City := frmCity.DSetCity.FieldByName('ID_COMAND_CITY').AsInteger;
        CityBE.EditValue := frmCity.DSetCity.FieldByName('NAME_CITY').AsString;
    End;
    frmCity.Free;  }
end;

procedure TFormAddOrg.CityBEKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    exit;
end;

end.
