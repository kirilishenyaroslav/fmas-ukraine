unit UpComandCanceledit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FIBDatabase, pFIBDatabase, cxClasses, cxStyles, cxGridTableView,
  DB, FIBDataSet, pFIBDataSet, cxTextEdit, StdCtrls, Buttons, uFControl,
  uLabeledFControl, uSpravControl, cxLabel, cxControls, cxContainer,
  cxEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, ExtCtrls, ibase,AllPeopleUnit,
  qfTools,UpCommandCancelSelect;

type
  TfmUpComandCanceledit = class(TForm)
    PanelFiltr: TPanel;
    cxDateEdit1: TcxDateEdit;
    cxLabelData: TcxLabel;
    ManEdit: TqFSpravControl;
    ComandEdit: TqFSpravControl;
    PanelDialog: TPanel;
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    GBTexts: TPanel;
    cxLabelReason: TcxLabel;
    cxTextEditReason: TcxTextEdit;
    cxLabelNote: TcxLabel;
    cxTextEditNote: TcxTextEdit;
    DataSet: TpFIBDataSet;
    StyleRepository: TcxStyleRepository;
    stBackground: TcxStyle;
    stContent: TcxStyle;
    stContentEven: TcxStyle;
    stContentOdd: TcxStyle;
    stFilterBox: TcxStyle;
    stFooter: TcxStyle;
    stGroup: TcxStyle;
    stGroupByBox: TcxStyle;
    stHeader: TcxStyle;
    stInactive: TcxStyle;
    stIncSearch: TcxStyle;
    stIndicator: TcxStyle;
    stPreview: TcxStyle;
    stSelection: TcxStyle;
    stHotTrack: TcxStyle;
    qizzStyle: TcxGridTableViewStyleSheet;
    DB: TpFIBDatabase;
    ReadTr: TpFIBTransaction;
    DSetSelect: TpFIBDataSet;
    DataSourceSel: TDataSource;
    procedure ManEditOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure ComandEditOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure OkButtonClick(Sender: TObject);
    procedure cxTextEditReasonKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
      id_mode   : integer;
      Id_Comand_Plan : variant;
      DBHandle: TISC_DB_HANDLE;
  end;

{var
  fmUpComandCanceledit: TfmUpComandCanceledit;  }

implementation

{$R *.dfm}

procedure TfmUpComandCanceledit.ManEditOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
Var
    Result: Variant;
Begin
   if (id_mode=1) or (Id_mode=2) then exit;
    Try
        result := AllPeopleUnit.GetManForASUP(Self, DBHandle, False, False);
        If (Not VarIsNull(result)) And Not (VarType(result) = varNull) And
            Not (VarArrayDimCount(result) = 0) Then
        Begin
            ManEdit.Value := result[0];
            DisplayText := result[1];
        End;
    Except On e: Exception Do
        Begin
            qFErrorDialog('Неможливо завантажити довідник фізичних осіб! Виникла помилка: "'
                + e.Message + '"');
            exit;

        End;
    End;
End;

procedure TfmUpComandCanceledit.ComandEditOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
Var
    f: TfmUpCommandCancelSelect;
Begin
    if (id_mode = 2) then exit;
    If VarIsNull(ManEdit.Value) Then
    Begin
        MessageDlg('Оберіть фізичну особу!', mtError, [mbOk], 0);
        ManEdit.SetFocus;
        exit;
    End;

    f := TfmUpCommandCancelSelect.Create(Self);
    f.cxGridComandPlanDBTableView.DataController.DataSource := DataSourceSel;

    DSetSelect.Close;
    DSetSelect.SQLs.SelectSQL.Text := 'SELECT * FROM UP_DT_COMAND_PLAN_BUFF_SEL_EX(?F_DATE_BEG, ?ID_MAN)';
    If VarIsNull(cxDateEdit1.EditValue) Then
        DSetSelect.ParamByName('F_DATE_BEG').AsVariant := Null
    Else
        DSetSelect.ParamByName('F_DATE_BEG').AsDate := cxDateEdit1.Date;
    DSetSelect.ParamByName('ID_MAN').AsVariant := ManEdit.Value;

    DSetSelect.Open;
    If f.ShowModal = mrOk Then
    Begin
        If DSetSelect.RecordCount <> 0 Then
        Begin
            Value := DSetSelect['ID_COMAND_PLAN'];
            Id_Comand_Plan := DSetSelect['ID_COMAND_PLAN'];
            DisplayText := '№ ' + DSetSelect.fbn('NUM_ORDER').AsString + ' від ' + DateToStr(DSetSelect.fbn('DATE_ORDER').AsDateTime) + '. Відрядження: ' +
                DateToStr(DSetSelect['DATE_BEG']) + ' - ' + DateToStr(DSetSelect['DATE_END']) + ' на ' + IntToStr(DSetSelect['DAYS_COUNT']) + ' днів до ' + DSetSelect.fbn('NAME_ORG_FULL').asString;
        End;
        OkButton.Enabled := True;
    End;
    f.Free;



End;

procedure TfmUpComandCanceledit.OkButtonClick(Sender: TObject);
begin
    If cxTextEditReason.Text = '' Then
    Begin
        MessageDlg('Вкажіть підставу наказу!', mtError, [mbOk], 0);
        cxTextEditReason.SetFocus;
        Exit;
    End;
     ModalResult := mrOk;
end;

procedure TfmUpComandCanceledit.cxTextEditReasonKeyPress(Sender: TObject;
  var Key: Char);
begin
   if (id_mode=2) then key := chr(0);
end;

end.
