
{ -$Id: EducationUnit.pas,v 1.4 2007/01/30 15:48:52 oleg Exp $}
{******************************************************************************}
{               Автоматизированная система управления персоналом               }

{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

                       {                       Модуль "Информация о образовании физ. лица"            }
{    Отображение, редактирование и добавлении информации о образовании.        }
{    Ответственный:Данил Збуривский                                            }


unit EducationUnit;

interface

uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    StdCtrls, Buttons, Mask, CheckEditUnit, ComCtrls, SpComboBox,
    Db, IBCustomDataSet, IBQuery, FieldControl, EditControl, PersonalCommon,
    SpEducOrgUnit, OrdersViewUnit, SpCommon, SpSpecUnit, KvalFormUnit;

type
    TEducMode = (emEducation, emKvalification);
    TEducationForm = class(TForm)
        Label1: TLabel;
        EducOrgSpComboBox: TSpComboBox;
        Label2: TLabel;
        EducSpComboBox: TSpComboBox;
        Label6: TLabel;
        SpecSpComboBox: TSpComboBox;
        Label7: TLabel;
        KvalifSpComboBox: TSpComboBox;
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        FC_EDUC: TFieldControl;
        FC_EDUC_ORG: TFieldControl;
        FC_SPEC: TFieldControl;
        FC_KVALIF: TFieldControl;
        DetailsQuery: TIBQuery;
        DetailsQueryDATE_BEG: TDateField;
        DetailsQueryDATE_END: TDateField;
        DetailsQueryID_SPEC: TIntegerField;
        DetailsQueryID_KVAL: TIntegerField;
        DetailsQueryID_EDUC: TIntegerField;
        DetailsQueryDIPLOM_DATE: TDateField;
        DetailsQueryAKREDITATION: TIntegerField;
        DetailsQueryID_THEME: TIntegerField;
        DetailsQueryID_ORDER: TIntegerField;
        DetailsQueryNUM_ITEM: TIntegerField;
        DetailsQueryIS_LEARNING: TIntegerField;
        GroupBox1: TGroupBox;
        Label4: TLabel;
        Label3: TLabel;
        FC_DATE_BEGIN: TFieldControl;
        FC_DATE_END: TFieldControl;
        DateBegin: TDateTimePicker;
        DateEnd: TDateTimePicker;
        GroupBox2: TGroupBox;
        Label9: TLabel;
        FC_DIPLOM_DATE: TFieldControl;
        Label8: TLabel;
        DimplomNumbeEdit: TCheckEdit;
        FC_DIPLOM_NUMBER: TFieldControl;
        Label10: TLabel;
        Label11: TLabel;
        FC_AKREDITATION: TFieldControl;
        FC_KVALIF_THEME: TFieldControl;
        AkreditationEdit: TCheckEdit;
        KvalThemeSpComboBox: TSpComboBox;
        Label5: TLabel;
        GroupBox3: TGroupBox;
        Label12: TLabel;
        OrderEdit: TEdit;
        AkreditationQuery: TIBQuery;
        Label13: TLabel;
        PunktEdit: TCheckEdit;
        FC_PUNKT_NUMBER: TFieldControl;
        FC_ORDER: TFieldControl;
        DiplomDate: TDateTimePicker;
        AkreditationQueryAKREDITATION: TIntegerField;
        DetailsQueryDIPLOM_NUMBER: TIBStringField;
        DetailsQueryIS_FSHR: TIBStringField;
        IsFshrCheckBox: TCheckBox;
        FC_IS_FSHR: TFieldControl;
    DetailsQueryID_ORG: TLargeintField;
        procedure OkButtonClick(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure FormActivate(Sender: TObject);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure CancelButtonClick(Sender: TObject);
        procedure Focus(Sender: TObject);
        procedure DateEndChange(Sender: TObject);
        procedure EducOrgSpComboBoxChange(Sender: TObject);
    private
    { Private declarations }
    public
        idman: Integer;
        id: Integer;
        Mode: TEditMode;
        EducationMode: TEducMode;
        EducationEditControl: TEditControl;
        BirthDate: TDate;
        procedure Prepare(Mode: TEditMode; EMode: TEducMode);
        procedure OrdersClosed(Sender: TObject);

    end;

var
    EducationForm: TEducationForm;

implementation

{$R *.DFM}

procedure TEducationForm.Prepare(Mode: TEditMOde; EMode: TEducMode);
begin
    Self.Mode := Mode;
    Self.EducationMode := EMode;
    
    if EMode = emEducation then
    begin
        Label11.Enabled := False;
        Label5.Enabled := False;
        KvalThemeSpComboBox.Enabled := False;
        Label12.Enabled := False;
        Label13.Enabled := False;
        OrderEdit.Enabled := False;
        PunktEdit.Enabled := False;
    end
    else
    begin
        Label11.Enabled := True;
        Label5.Enabled := True;
        KvalThemeSpComboBox.Enabled := True;
        Label12.Enabled := True;
        Label13.Enabled := True;
        OrderEdit.Enabled := True;
        PunktEdit.Enabled := True;

    end;

    if Mode = emView then
        Caption := 'Довідник навчальних закладів: Перегляд';
    if Mode = emNew then
        Caption := 'Довідник навчальних закладів: Додати';

    if Mode = emModify then
        Caption := 'Довідник навчальних закладів: Змінити';

            DetailsQuery.Prepare;
            DetailsQuery.ParamByName('Id_Educ_Key').AsInteger := id;
            DetailsQuery.Close;
            DetailsQuery.Open;

    EducationEditControl.Prepare(Mode);
    EducationEditControl.SetReadOnly(Mode = emView);
    if Mode = emNew then
    begin
        DateBegin.Date := IncMonth(BirthDate, 12 * PersonalCommon.Consts_Query['EDUC_AGE']);
        DateEnd.Date := IncMonth(DateBegin.Date, 60);
        DiplomDate.Date := DateEnd.Date;
    end;
    if Mode <> emView then
    begin
        EducSpComboBox.SpParams.Table := '';
        EducSpComboBox.SpParams.SelectProcName := 'Sp_Education_Select';
        
        EducOrgSpComboBox.SpParams.Table := '';
        EducOrgSpComboBox.SpParams.SelectProcName := 'Sp_EducOrg_Select';

        SpecSpComboBox.SpParams.Table := '';
        SpecSpComboBox.SpParams.SelectProcName := 'Sp_Spec_Select';

        KvalifSpComboBox.SpParams.Table := '';
        KvalifSpComboBox.SpParams.SelectProcName := 'Sp_Kvalification_Select';
    end;

end;

procedure TEducationForm.Focus(Sender: TObject);
begin
    if Sender is TWinControl then
        if (Sender as TWinControl).TabStop = False then
            OkButton.SetFocus;
end;

procedure TEducationForm.FormCreate(Sender: TObject);
begin
    try
    DetailsQuery.Transaction := PersonalCommon.ReadTransaction;
    AkreditationQuery.Transaction := PersonalCommon.ReadTransaction;

    EducationEditControl := TEditControl.Create;
    EducationEditControl.Add([FC_Educ_Org, FC_Date_Begin, FC_Date_End,
        FC_Spec, FC_Kvalif, FC_Educ, FC_Diplom_Number, FC_Diplom_Date
            , FC_Akreditation, FC_Kvalif_Theme, FC_Order,
            FC_PUNKT_Number, FC_IS_FSHR]);
    except on E: Exception do
        ShowMessage(E.Message);
    end;
end;

procedure TEducationForm.FormActivate(Sender: TObject);
begin
    OkButton.SetFocus;
end;


procedure TEducationForm.OkButtonClick(Sender: TObject);
var
    ISLEARN: Integer;
begin
    if EducationMode = emEducation then ISLEARN := 1
    else ISLEARN := 0;
    if Mode = emView then
    begin
        Close;
        Exit;
    end;
    EducationEditControl.Read;

   if not EducationEditControl.CheckFill then
        Exit;

    if DateBegin.Date > DateEnd.Date then
    begin
        MessageDlg('Невірний період: дата початку більше дати закінчення', mtError, [mbOK], 0);
        Exit;
    end;

    if WriteTransaction.Active then WriteTransaction.Rollback;
    PersonalCommon.WriteTransaction.StartTransaction;
    try
        if Mode = emNew then
            EducationEditControl.ExecProc('Man_Educ_Insert', [ISLEARN, idman]);
        if Mode = emModify then
            EducationEditControl.ExecProc('Man_Educ_Update', [ISLEARN, id, idman]);

    except on E: Exception do
        begin
            MessageDlg('При занесенні у базу даних виникла помилка:'
                + E.Message, mtError, [mbOk], 0);

            PersonalCommon.WriteTransaction.Rollback;
            Exit
        end;
    end;
    PersonalCommon.WriteTransaction.Commit;
    Self.ModalResult := 1;
    Self.Visible:=False;
end;

procedure TEducationForm.FormClose(Sender: TObject;
    var Action: TCloseAction);
begin
    EducSpComboBox.SaveIntoRegistry;
    EducOrgSpComboBox.SaveIntoRegistry;
    SpecSpComboBox.SaveIntoRegistry;
    KvalifSpComboBox.SaveIntoRegistry;
    KvalThemeSpComboBox.SaveIntoRegistry;

    EducationEditControl.Free;
    if FormStyle=fsMDIChild then
     Action := caFree;
end;

procedure TEducationForm.CancelButtonClick(Sender: TObject);
begin
    Close;
end;


procedure TEducationForm.OrdersClosed(Sender: TObject);
begin
    if (Sender as TOrdersViewForm).ModalResult = mrOk then
        OrderEdit.Text := (Sender as TOrdersViewForm).InputQuery['Note']
end;


procedure TEducationForm.DateEndChange(Sender: TObject);
begin
    DiplomDate.Checked := True;
    DiplomDate.DateTime := DateEnd.DateTime;
end;

procedure TEducationForm.EducOrgSpComboBoxChange(Sender: TObject);
begin
    if (AkreditationQuery.Transaction <> nil) and
        (EducOrgSpComboBox.ItemIndex <> -1) then
    begin
        AkreditationQuery.Close;
        AkreditationQuery.Params.ParamValues['Id_Org'] :=
            EducOrgSpComboBox.GetId;
        AkreditationQuery.Open;
        AkreditationEdit.Text := IntToStr(AkreditationQuery['Akreditation']);
    end;
end;
initialization
    registerclass(TSpecForm);
    registerclass(TKvalForm);
end.
